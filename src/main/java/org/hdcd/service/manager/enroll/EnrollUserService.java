package org.hdcd.service.manager.enroll;

import java.util.Map;

import org.hdcd.vo.DepartmentVO;

public interface EnrollUserService {
	
	public DepartmentVO selectOne(String depCode);

	public int insertMem(Map<String, Object> dataMap);
	

}
