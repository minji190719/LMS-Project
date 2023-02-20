package org.hdcd.mapper;

import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.StudentVO;

public interface MEnrollUserMapper {

	public DepartmentVO selectOne(String depCode);

	public int insertMem(MemberVO memberVO);

	public void insertStu(StudentVO studentVO);

	public void insertAuth(String memNo);
	
}
