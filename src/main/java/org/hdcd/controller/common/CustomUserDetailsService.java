package org.hdcd.controller.common;

import javax.inject.Inject;

import org.hdcd.mapper.LoginMapper;
import org.hdcd.vo.MemberVO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Inject
	private LoginMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		try {
			
			// 여기서 username은 로그인한  20170001 아이디입니다.

			MemberVO memVO = mapper.selectAuth(username);
			// if memVO == null exception 존재하지 않는 사용자 입니다.
			log.info("CustomUserDetailsService============================");
			return memVO == null ? null : new CustomUser(memVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}



