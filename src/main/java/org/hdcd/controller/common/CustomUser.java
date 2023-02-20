package org.hdcd.controller.common;

import java.util.Collection;
import java.util.stream.Collectors;

import org.hdcd.vo.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUser extends User{

	private MemberVO memVO;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	// 유저에게 아이디, 비밀번호, 권한을 부여하는 작업
	public CustomUser(MemberVO memVO) {
		super(memVO.getMem_no(), memVO.getMem_pass(),
	            memVO.getAuthList().stream()
	            .map(auth->new SimpleGrantedAuthority(auth.getMem_auth()))
	            .collect(Collectors.toList())
	         );
	     this.memVO = memVO;
	      
	     log.info("this.memVO : " + this.memVO);
	}

	public MemberVO getMemVO() {
		return memVO;
	}

	public void setMemVO(MemberVO memVO) {
		this.memVO = memVO;
	}
	
}
