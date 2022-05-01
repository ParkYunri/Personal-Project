package com.campus.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/ajaxLogin")
	public String ajaxView() {
		return "login/ajaxLogin";
	}
}