package org.hdcd.controller.common;

import java.io.IOException;
import java.security.Principal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hdcd.vo.MemberVO;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	private final RequestCache requestCache = new HttpSessionRequestCache();
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
	
		
		// 회원 아이디 세션추가
		HttpSession session = request.getSession();
		log.info("userId {}", authentication.getName());
		session.setAttribute("userId", authentication.getName());
		log.debug("세션을 시간을 확인해보자 ~~~~~~~~~~~~~~~~~~~~~~~ {}",session.getMaxInactiveInterval());
		
		clearSession(request);
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String userId = (String)session.getAttribute("userId");
		log.debug("값을 확인해봅시다 {}",userId);
		
		if(userId.equals("20200001") || userId.equals("201101") || userId.equals("20170003")) {
			String uri = "/main/home";
			redirectStrategy.sendRedirect(request, response, uri);
		}else {
			
			if(savedRequest == null) {
				String uri = "/otp/login.do";
				redirectStrategy.sendRedirect(request, response, uri);
			}
			
		}
		
	
		Iterator<? extends GrantedAuthority> iter = authentication.getAuthorities().iterator();
		
		// 권한 빼기
		while(iter.hasNext()) {
			
			session.setAttribute("role", iter.next().toString());
			
		}
		
		
		log.info("0000000000000000000000000000000000000 로그인 프로세스 성공!");
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
    // 로그인 실패 후 성공 시 남아있는 에러 세션 제거
    protected void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        }
    }
	
	
}
