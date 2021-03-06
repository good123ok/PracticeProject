package com.finalproj.missingitnow.member.model.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/logout")
public class LogoutController {
	
	@GetMapping
	public String logout(HttpSession session) {
		

		
		if(!(session==null)) {
			
			session.invalidate();
			
		}
		
		return "redirect:/";
	}
}
