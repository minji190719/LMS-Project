package org.hdcd.controller.common.handler;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.AlarmMapper;
import org.hdcd.mapper.CommunityMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MainChatHandler extends TextWebSocketHandler{

	   // 접속한 세션 담을 리스트
	   private static Map<String ,WebSocketSession> map = new HashMap<String, WebSocketSession>();
	   
	   // mapper 들
	   @Inject
	   CommunityMapper communityMapper;
	   
	   @Inject
	   AlarmMapper alarmMapper;
	   
	   @Override
	   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	      log.info("접속");
	   }

	   //세션이 누구껀지 알아야함
	   
	   @Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		   // 세션추가
		   String jsonData = message.getPayload();
		   JSONParser parser = new JSONParser();
		   JSONObject jsonObject = (JSONObject)parser.parse(jsonData); 
		   
		   String state = (String)jsonObject.get("state");
		   
		   switch(state) {
		   // 입장
		   case "0":
			   String userId = (String)jsonObject.get("userId"); 
			   map.put(userId, session);
			   
			   for(String key : map.keySet()) {
//				   if(!key.equals((String)jsonObject.get("userId"))) {
					   map.get(key).sendMessage(message);
//				   }
			   }
			   break;
		   case "1":
			    String purpose = (String)jsonObject.get("purpose");
			    // 친구요청임
			    if("0".equals(purpose)) {
				    String friendName = (String)jsonObject.get("userId");
			 	   
			 	    for(String key : map.keySet()){
					    if(key.equals(friendName)) {
						    map.get(key).sendMessage(message);
					    }
				    }
			    }
			   
			   // 화상회의 URL전송
				if("1".equals(purpose)) {
				   log.debug("여긴 걸리냐!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@");
				   log.debug("map : {}", map);
				   Object studentName = (Object)jsonObject.get("studentId");
				   for(String key : map.keySet()){
				      if(key.equals(String.valueOf(studentName))) {
				         map.get(key).sendMessage(message);
				      }
				   }
				}
			   
				// 댓글알림용
				if("2".equals(purpose)) {
					// 게시글 코드 받아서 유저찾는다... 
					Map<String, Object> dataMap = new HashMap<String, Object>();
					String cummuUser = communityMapper.getCommuUser((String)jsonObject.get("cmnt_no"));
					String sender = (String)jsonObject.get("sender");
					String url = (String)jsonObject.get("url");
					
					// 알림 추가합니다.
					dataMap.put("sender", sender);
					dataMap.put("receiver", cummuUser);
					dataMap.put("url", url);
					dataMap.put("content", "댓글을 다셨습니다.");
					dataMap.put("alarmNo", null);
					int cnt = alarmMapper.inertAlarm(dataMap);
					
					jsonObject.put("alarmNo", (String)dataMap.get("alarmNo"));
					jsonObject.put("url", url);
					jsonObject.put("content", "댓글을 다셨습니다.");
					
					// /detail/{cmnt_no} 이거 같이 보냅니다.
					String data = jsonObject.toString();
					message = new TextMessage(data);
					for(String key : map.keySet()){
						if(key.equals(cummuUser)){
							map.get(key).sendMessage(message);
						}
					}
				}
			   break;
		   case "2":
			   for(String key : map.keySet()) {
				   if(!key.equals((String)jsonObject.get("userId"))) {
					   map.get(key).sendMessage(message);
				   }
			   }
			   map.remove((String)jsonObject.get("userId"));
			   break;
		   }
	   }
	   
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	      log.info("떠남");
	   }
	
	
}
