package org.hdcd.service.manager.enroll;

import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.MEnrollUserMapper;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.StudentVO;
import org.springframework.stereotype.Service;

@Service
public class EnrollUserServiceImpl implements EnrollUserService{
	
	@Inject
	MEnrollUserMapper mapper;
	
	@Override
	public DepartmentVO selectOne(String depCode) {
		return mapper.selectOne(depCode);
	}

	@Override
	public int insertMem(Map<String, Object> dataMap) {
		
		int result = 0;
		
		if(dataMap != null) {
			MemberVO memberVo = (MemberVO)dataMap.get("MemberVO");
			mapper.insertMem(memberVo);
			mapper.insertAuth(memberVo.getMem_no());
			
			mapper.insertStu((StudentVO)dataMap.get("StudentVO"));
			result = 1;
		}
		
		return result;
	}

}
