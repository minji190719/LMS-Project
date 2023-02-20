package org.hdcd.mapper;

import org.hdcd.vo.MemberVO;

public interface LoginMapper {

	public MemberVO selectAuth(String username);
	
}
