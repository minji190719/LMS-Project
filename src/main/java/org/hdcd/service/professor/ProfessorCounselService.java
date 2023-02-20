package org.hdcd.service.professor;

import java.util.List;

import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.MemberVO;

public interface ProfessorCounselService {

	List<CounselApplyVO> professorApplyCounsel(String professorSessionId);

	MemberVO getStudentName(String smem_no);

	int counselReturn(CounselApplyVO counselApplyVO);

	int counselValidation(CounselApplyVO counselApplyVO);

	

}
