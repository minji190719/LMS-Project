package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.EmployApplyVO;
import org.hdcd.vo.EmployProgramVO;

public interface EmployEducationMapper {

	List<EmployProgramVO> getEmployEducationProgram(String searchWord);

	EmployProgramVO employEducationProgramDetailPage(String epro_code);

	int employEducationProgramApply(@Param("epro_code")String epro_code, @Param("userId")String userId);

	EmployApplyVO employEducationProgramApplyValidation(@Param("epro_code")String epro_code, @Param("userId")String userId);

	void IncrementEproCurcnt(String epro_code);

}
