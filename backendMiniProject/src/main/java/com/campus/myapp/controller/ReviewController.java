package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	
	@Inject
	ReviewService service;
	//리뷰목록
	@GetMapping("reviewList")
	public ModelAndView reviewList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		mav.addObject("list", service.reviewList(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("review/reviewList");
		
		return mav;
	}
	//리뷰등록폼
	@GetMapping("reviewWrite")
	public ModelAndView reviewWrite() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("review/reviewWrite");
		return mav;
	}
	//리뷰등록
	@PostMapping("reviewWriteOk")
	public ResponseEntity<String> reviewWriteOk(ReviewVO vo, HttpServletRequest request){
		vo.setIp(request.getRemoteAddr());
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload");
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			List<MultipartFile> files = mr.getFiles("filename");
			
			if(files != null) {
				int cnt = 1;
				for(int i=0; i<files.size(); i++) {
					MultipartFile mf = files.get(i);
					String orgFileName = mf.getOriginalFilename();

					if(orgFileName != null && !orgFileName.equals("")) {
						File f = new File(path, orgFileName);
						
						if(f.exists()) {
							for(int renameNum=1;;renameNum++) {
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0,point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName + " (" + renameNum + ")."+ext);
								if(!f.exists()) {
									orgFileName = f.getName();
									break;
								}
							} 
						}
						try {
							mf.transferTo(f); 
						} catch(Exception ee) {}
						if(cnt==1) vo.setFilename1(orgFileName);
						if(cnt==2) vo.setFilename2(orgFileName);
						cnt++;
					}
				}
			}
			service.reviewInsert(vo);
			String msg = "<script>alert('리뷰가 등록되었습니다!'); "
					+ "location.href='/myapp/review/reviewList'; </script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			//파일지우기
			fileDelete(path, vo.getFilename1());
			fileDelete(path, vo.getFilename2());
			
			String msg = "<script>alert('리뷰 등록에 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//파일지우기
	public void fileDelete(String p, String f) {
		if(f!=null) {
			File file = new File(p,f);
			file.delete();
		}
	}
	//리뷰글보기
	@GetMapping("reviewView")
	public ModelAndView reviewView(int no) {
		ModelAndView mav = new ModelAndView();
		
		service.hitCount(no);
		
		mav.addObject("vo", service.reviewView(no));
		mav.setViewName("review/reviewView");
		
		return mav;
	}
	//리뷰수정폼
	@GetMapping("reviewEdit")
	public ModelAndView reviewEdit(int no) {
		ModelAndView mav = new ModelAndView();
		ReviewVO vo = service.reviewView(no);
		int fileCount = 0;
		if(vo.getFilename1()!=null) {
			fileCount++;
		}
		if(vo.getFilename2()!=null) {
			fileCount++;
		}
		mav.addObject("fileCount", fileCount);
		mav.addObject("vo",vo);
		mav.setViewName("review/reviewEdit");
		
		return mav;
	}
	//리뷰수정(DB)
	@PostMapping("reviewEditOk")
	public ResponseEntity<String> reviewEditOk(ReviewVO vo, HttpSession session, HttpServletRequest request){
		vo.setUserid((String)session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload");
	
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-Type", "text/html; charset=utf-8");
		
		List<String> fileList = new ArrayList<String>(); //새로 DB에 업데이트할 파일명 정리하는 컬렉션
		List<String> newUpload = new ArrayList<String>(); //새로 업로드 한 파일명
		try {
			//1. DB에서 파일명 가져오기
			ReviewVO dbfileVO = service.fileSelect(vo.getNo());
			if(dbfileVO==null) {}
			else{
				fileList.add(dbfileVO.getFilename1());
				if(dbfileVO.getFilename2()!=null) fileList.add(dbfileVO.getFilename2());
			}
			
			//2. 삭제된 파일이 있을 경우 List에서 같은 파일명을 지운다.
			if(vo.getDelFile()!=null) {	//null을 삭제 파일이 없다.
				for(String delFile : vo.getDelFile()) {
					fileList.remove(delFile);
				}
			}
			//3. 새로 업로드하기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			//새로 업로드된 MultipartFile객체를 얻어오기
			List<MultipartFile> newFileList = mr.getFiles("filename");
			if(newFileList != null) { //새로 업로드 된 파일이 있으면
				for(int i = 0; i < newFileList.size(); i++) {
					MultipartFile newMf = newFileList.get(i);
					String newUploadFilename = newMf.getOriginalFilename();
					
					if(newUploadFilename!=null && !newUploadFilename.equals("")) {
						File f = new File(path, newUploadFilename);
						if(f.exists()) {
							//rename
							for(int n=1; ; n++) {
								int point = newUploadFilename.lastIndexOf(".");
								String fileNameNoExt = newUploadFilename.substring(0, point);
								String ext = newUploadFilename.substring(point+1);
								//새로운 파일명 만들어 존재유무 확인
								String nf = fileNameNoExt+" ("+n+")."+ext;
								f = new File(path, nf);
								if(f.exists()){
									newUploadFilename = nf;
									break;
								}
							}// for
						}
						//업로드
						try {
							newMf.transferTo(f);
						}catch(Exception ee) {}
						fileList.add(newUploadFilename); //db에 등록할 파일명에 추가
						newUpload.add(newUploadFilename); //새로 업로드 목록 추가
					}
				}///for
			}/////if
			
			//fileList에 있는 DB에 등록할 파일명을 vo.filename1, vo.filename2에 세팅
			for(int k = 0; k < fileList.size(); k++) {
				if(k==0) vo.setFilename1(fileList.get(k));
				if(k==1) vo.setFilename2(fileList.get(k));
			}
			
			//DB update
			service.reviewUpdate(vo);
			
			//DB 수정 됐을 떄
			if(vo.getDelFile() != null) {
				for (String fname : vo.getDelFile()) {
					fileDelete(path, fname);
				}
			}
			//글 내용 보기로 이동
			String msg = "<script>alert('자료실 글이 수정되었습니다.\\n글 내용 보기로 이동합니다.');";
			msg += "location.href='/myapp/review/reviewView?no="+vo.getNo()+"';</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			//DB 수정 못했을 떄
			for(String fname:newUpload) {
				fileDelete(path, fname);
			}
			//수정페이지로 이동
			String msg = "<script>";
			msg +="alert('글 수정에 실패하였습니다.\\n수정폼으로 이동합니다.');";
			msg += "history.back();</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//리뷰삭제
	@GetMapping("reviewDelete")
	public ResponseEntity<String> reviewDelete(int no, HttpSession session){
		String userid = (String)session.getAttribute("logId");
		String path = session.getServletContext().getRealPath("/upload");
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		try {
			ReviewVO dbfileVO = service.fileSelect(no);
			service.reviewDelete(no,userid);
			if(dbfileVO==null) {}
			else{
				fileDelete(path, dbfileVO.getFilename1());
				if(dbfileVO.getFilename2()!=null) fileDelete(path, dbfileVO.getFilename2());
			}
			
			String msg = "<script>alert('리뷰가 삭제되었습니다.');location.href='/myapp/review/reviewList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('리뷰 삭제를 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//체크박스로 글 삭제
	@PostMapping("reviewMultiDelete")
	public ModelAndView reviewMultiDelete(ReviewVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		 
		service.reviewMultiDelete(vo);
		mav.setViewName("redirect:reviewList");
		
		return mav;
	}
	
}
