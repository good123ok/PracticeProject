package com.finalproj.missingitnow.member.model.service;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.finalproj.missingitnow.email.EmailDTO;
import com.finalproj.missingitnow.email.EmailSender;
import com.finalproj.missingitnow.member.model.dao.MemberMapper;
import com.finalproj.missingitnow.member.model.dto.PasswordFindDTO;
import com.finalproj.missingitnow.member.model.dto.PrivateMemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	
	private MemberMapper mapper;
	private BCryptPasswordEncoder passwordEncoder;
	private EmailSender emailSender;
	private EmailDTO email;

	@Autowired
	public MemberServiceImpl(MemberMapper mapper, BCryptPasswordEncoder passwordEncoder, EmailSender emailSender
			, EmailDTO email) {
		
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;		
		this.emailSender = emailSender;
		this.email = email;
	}
	
	
	@Override
	public boolean registMember(PrivateMemberDTO member) {
		
		
		return mapper.insertMember(member) > 0 ? true: false;
	}


	@Override
	public PrivateMemberDTO loginMember(PrivateMemberDTO member){
		
		if(!passwordEncoder.matches(member.getUserPwd(), mapper.selectEncPassword(member))){
			
			return null;
			
		}
				
		return mapper.selectMember(member);
					
	}


	@Override
	public void userUpdate(PrivateMemberDTO member) {
		
		mapper.userUpdate(member);
		
	}


	@Override
	public void userQuit(PrivateMemberDTO member) {
		
		mapper.userQuit(member);
		
	}


	@Override
	public void pwdChange(PrivateMemberDTO member) {
		
		mapper.pwdChange(member);
		
	}


	@Override
	public String pwdFind(HttpServletResponse response, PasswordFindDTO passwordFind, PrivateMemberDTO member) {
					
		String result = "";
				
		
		//회원정보 불러오기
		member = mapper.selectMember(member);
		
		//가입된 이메일이 존재한다면 이메일 발송
		if(member!= null) {
			
			/*
			 * //임시 비밀번호 생성(UUID 이용 - 특수문자는 못넣음 ㅠㅠ) String tempPw =
			 * UUID.randomUUID().toString().replace("-", ""); // -를 제거 tempPw =
			 * tempPw.substring(0,10); //tempPw를 앞에서부터 10자리 잘라줌
			 * 
			 * System.out.println("임시 비밀번호 확인 : " + tempPw);
			 * 
			 * 
			 * email.setSubject(member.getUserName() + "님의 임시비밀번호입니다.");
			 * 
			 * email.setReceiver(member.getUserEmail()); //user객체에 임시 비밀번호 담기
			 * 
			 * email.setContent("임시비밀번호는 : " + tempPw + "입니다.");
			 */
			
			
			 
			
			//메일 전송			
			try {
				emailSender.SendEmail(email, member);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			
			
			result = "Success";
			
		} else {
			
			result = "Fail";
		}
		
		
		return result;
	}


	@Override
	public int loginCheck(PrivateMemberDTO member) {
	
		int result = mapper.loginCheck(member);
		
		return result;
	}


	@Override
	public int leaveCheck(PrivateMemberDTO member) {
		
		
		int leaveCheck = mapper.leaveCheck(member);
		
		return leaveCheck;	
	}



}
