package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReviewDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;

	@Override
	public int reviewInsert(ReviewVO vo) {
		return dao.reviewInsert(vo);
	}
	
	@Override
	public List<ReviewVO> reviewList(PagingVO pVO) {
		return dao.reviewList(pVO);
	}

	@Override
	public ReviewVO reviewView(int no) {
		return dao.reviewView(no);
	}

	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
		return dao.reviewUpdate(vo);
	}

	@Override
	public ReviewVO fileSelect(int no) {
		return dao.fileSelect(no);
	}

	@Override
	public int reviewDelete(int no, String userid) {
		return dao.reviewDelete(no, userid);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public int reviewMultiDelete(ReviewVO vo) {
		return dao.reviewMultiDelete(vo);
	}
	
}
