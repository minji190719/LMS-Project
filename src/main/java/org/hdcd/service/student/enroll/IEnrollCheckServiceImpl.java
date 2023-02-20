package org.hdcd.service.student.enroll;

import javax.inject.Inject;

import org.hdcd.mapper.CheckMemberMapper;
import org.springframework.stereotype.Service;

@Service
public class IEnrollCheckServiceImpl implements EnrollCheckService{

	@Inject
	CheckMemberMapper mapper;

	@Override
	public boolean checkMember(String userId) {
		
		int cnt = mapper.checkMember(userId);
		
		if(cnt > 0) {
			return true;
		}else {
			return false;
		}
	}
	
}
