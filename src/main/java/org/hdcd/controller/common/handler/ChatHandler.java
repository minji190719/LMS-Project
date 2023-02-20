package org.hdcd.controller.common.handler;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatHandler extends TextWebSocketHandler {
   
   // 접속한 세션 담을 리스트
   private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      log.info("접속");
      list.add(session);
      log.info("list {}",list.size());
   }

   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      log.info("메세지 보냄");

      log.debug("list {} ", list);
      String index = message.getPayload();
      JSONParser parser = new JSONParser();
      JSONObject jsonObject = (JSONObject)parser.parse(index);
      
      String flag = (String)jsonObject.get("state");
      
      switch(flag) {
      // 입장
      case "0":
         for (WebSocketSession webSocketSession : list) {
        	 if(webSocketSession != session) {
        		 webSocketSession.sendMessage(message);
        	 }
         }
         break;
      
      //메세지   
      case "1" :
         for (WebSocketSession webSocketSession : list) {
        	 if(webSocketSession.getId() != session.getId()) {
        		 webSocketSession.sendMessage(message);
        	 }
         }
         break;
       
        
      // 퇴장   
      case "2" :
    	  for (WebSocketSession webSocketSession : list) {
    		  if(webSocketSession.getId() != session.getId()) {
    			  webSocketSession.sendMessage(message);
    		  }
    	  }
    	  break;
      }
      
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      log.info("떠남");
      list.remove(session);
   }
}