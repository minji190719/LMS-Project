package org.hdcd.controller.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
			
		// 세션삭제
		HttpSession session = request.getSession();
		session.invalidate();
		
		log.debug(accessDeniedException.getMessage());
		log.info("여긴왜 안뜸?/");
		
		response.sendRedirect("/pageLogin");
	}

}
