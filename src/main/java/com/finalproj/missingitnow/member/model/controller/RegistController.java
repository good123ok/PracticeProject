package com.finalproj.missingitnow.member.model.controller;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproj.missingitnow.common.exception.MemberRegistException;
import com.finalproj.missingitnow.member.model.dto.PasswordInputDTO;
import com.finalproj.missingitnow.member.model.dto.PrivateMemberDTO;
import com.finalproj.missingitnow.member.model.service.MemberService;

@Controller
@RequestMapping("member/regist")
public class RegistController {

	private final BCryptPasswordEncoder passwordEncoder;
	private final MemberService memberService;
	
	@Autowired              
	public RegistController(MemberService memberService, BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		this.memberService = memberService;
	}

	@GetMapping
	public String regist() {
		return "member/regist";
	}
	
	@PostMapping
	public String registProcess(@ModelAttribute PrivateMemberDTO member, PasswordInputDTO pass, BCryptPasswordEncoder passwordEncoder
			,RedirectAttributes rttr) {

		
		
		String inputId = member.getUserId();
		String pwd1 = pass.getUserPwd();
		String pwd2 = pass.getPwConfirm();
		
		int idCheck = memberService.loginCheck(member);
		
		String idPattern = "^[a-zA-Z0-9]{4,12}$";
		
		String pwdPattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,16}$";
		
		
		String regex = String.valueOf(Pattern.matches(idPattern, inputId));
		
		String regex2 = String.valueOf(Pattern.matches(pwdPattern, pwd1));
		String regex3 = String.valueOf(Pattern.matches(pwdPattern, pwd2));
		
		
		
		if(idCheck==1 || inputId.equals(null) || inputId.equals("") || regex.equals("false")) {
			
			rttr.addFlashAttribute("message", "?????? ?????? ?????? : ?????? ?????????????????? ????????? ?????? ?????? ??????????????????.");
			
			return "redirect:/member/regist";
			
			
		}
		
		else if(!(pwd1.equals(pwd2)) || pwd1.matches(inputId) || pwd2.matches(inputId) ||pwd1.equals("") || pwd2.equals("") || regex2.equals("false") || regex3.equals("false")){
			
			rttr.addFlashAttribute("message", "?????? ?????? ?????? : ??????????????? ???????????? ????????? ????????? ?????? ????????????. ?????? ??????????????? ???????????? ??????????????? ??? ????????????.");
			
			return "redirect:/member/regist";
		
		} else {
			
			

			
			/* ?????? ????????? ?????? */
			
			member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
			

			
			
			
			/*userNo??? null ??? -> ????????? ?????? */
			
			memberService.registMember(member);
			
			
			rttr.addFlashAttribute("message", "?????? ????????? ?????????????????????.");
			
			
		} 
		
		
		
		return "redirect:/";
	}
	
}
