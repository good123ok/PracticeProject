package com.finalproj.missingitnow.common.socket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.finalproj.missingitnow.member.model.dto.PrivateMemberDTO;

public class EchoHandler extends TextWebSocketHandler{

	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 회원이 서버로 연결시(로그인)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> sessionInfo = session.getAttributes();
		if(sessionInfo.get("loginMember") != null) {
			
			String senderId = getMemberId(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
			
			if(senderId!=null) {	// 로그인 값이 있는 경우만
				users.put(senderId, session);   // 로그인중 개별유저 저장
			}
			
		}
		
	}
	
	// 회원이 서버에서 연결 해제될 때(로그아웃)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		Map<String, Object> sessionInfo = session.getAttributes();
		
		if(sessionInfo.get("loginMember") != null) {
			
			String senderId = getMemberId(session);
			
			if(senderId!=null) {	// 로그인 값이 있는 경우만
				users.remove(senderId);
			}
				
		}
	
	}
	
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	// 웹소켓에 id 가져오기
    // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		
		String m_id = ((PrivateMemberDTO) httpSession.get("loginMember")).getUserId(); // 세션에 저장된 id 기준 조회
		
		return m_id == null ? null : m_id;
	}
	
	// 관리자가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 특정 회원에게 보내기
		String msg = message.getPayload();
		System.out.println(message);
		System.out.println(msg);
		if(msg != null) {
			String[] strs = msg.split(",");
			System.out.println(strs[0]);
			System.out.println(strs[1]);
			System.out.println(strs[2]);
			System.out.println(strs[3]);
			System.out.println(strs[4]);
			if(strs != null && strs.length == 5) {
				String sender = strs[0];
				String target = strs[1]; // m_id 저장
				String title = strs[2];
				String writer = strs[3];
				String url = strs[4];
				WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
				System.out.println(targetSession);
				// 현재 로그인중 일 시
				if(targetSession!=null) {
					// ex: [관리자] Q&A 답변이 등록되었습니다.
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='" + url + "'>[<b>" + sender + "</b>] " + writer + "님의 " + title + "게시글에 답변을 달았습니다.</a>" );
					targetSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
}
