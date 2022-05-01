package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Inject
	MemberService service;
	
	//회원가입폼
	@GetMapping("memberForm")
	public String memberForm() {
		return "member/memberForm";
	}
	//회원등록
	@PostMapping("memberOk")
	public String memberFormOk(MemberVO vo, Model model) {
		int cnt = service.memberInsert(vo);
		
		model.addAttribute("cnt", cnt);
		
		return "member/memberResult";
	}
	//아이디중복검사
	@PostMapping("memberIdCheck")
	@ResponseBody
	public int idCheck(String userid) {
		int cnt = service.idCheck(userid);
		return cnt;
	}
	//로그인폼
	@GetMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	//로그인
	@PostMapping("loginOk")
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		MemberVO vo2 = service.loginCheck(vo);
		ModelAndView mav = new ModelAndView();
		if(vo2!=null) {
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("logAdmin", vo2.getVerify());
			session.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	
	//로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//회원정보수정폼
	@GetMapping("memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		MemberVO vo = service.memberEdit(userid);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", vo);
		mav.setViewName("/member/memberEdit");
		
		return mav;
	}
	
	//회원정보수정(DB)
	@PostMapping("memberEditOk")
	public ModelAndView memberEditOk(MemberVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		service.memberUpdate(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:memberEdit");
		return mav;
	}
}
