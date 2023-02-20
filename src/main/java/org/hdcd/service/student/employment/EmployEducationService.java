package org.hdcd.service.student.employment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.EmployApplyVO;
import org.hdcd.vo.EmployProgramVO;

public interface EmployEducationService {

	List<EmployProgramVO> getEmployEducationProgram(String searchWord);

	EmployProgramVO employEducationProgramDetailPage(String epro_code);

	int employEducationProgramApply(String epro_code, String userId);

	EmployApplyVO employEducationProgramApplyValidation(String epro_code, String userId);

	

}
