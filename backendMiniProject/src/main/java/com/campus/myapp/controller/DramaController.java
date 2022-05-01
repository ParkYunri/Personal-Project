package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.DramaService;

@RestController
@RequestMapping("/drama/*")
public class DramaController {
	@Inject
	DramaService service;
	
	//드라마 카테고리 목록
	@GetMapping("dramaList")
	public ModelAndView dramaList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", service.dramaList());
		mav.setViewName("drama/dramaList");
		return mav;
	}
}
