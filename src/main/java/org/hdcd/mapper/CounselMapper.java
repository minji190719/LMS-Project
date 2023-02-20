package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.CounselVO;
import org.hdcd.vo.MemberVO;

public interface CounselMapper {
// -------------------------------- 학생 파트 ---------------------------------------------
	List<CounselApplyVO> counselApplyList(String userId);

	List<CounselVO> getCounselList();

	MemberVO counselNameList(String pmem_no);

	int apply(CounselApplyVO counselApplyVO);

	MemberVO proffsorNameList(String cnsl_code);

	int counselDelete(String cnsl_code);

	int updateState(String cnsl_code);
	
	int studentCounselReturn(CounselApplyVO counselApplyVO);
	
	List<CounselVO> getSearchCounselList(@Param("searchName")String searchName, @Param("searchDate")String searchDate, @Param("searchSelect")String searchSelect);
	
	List<CounselApplyVO> counselApplyListSearch(@Param("searchProfessorName")String searchProfessorName, @Param("searchState")String searchState, @Param("searchType")String searchType, @Param("userId")String userId);
	
	CounselVO counselApplyDetail(String cnsl_code);
	
// -------------------------------- 교수 파트 ---------------------------------------------
	
	List<CounselApplyVO> professorApplyCounsel(String professorSessionId);

	MemberVO getStudentName(String smem_no);

	int counselValidation(CounselApplyVO counselApplyVO);

	int counselValidationTo(CounselApplyVO counselApplyVO);

	int counselReturn(CounselApplyVO counselApplyVO);

	

	

	
}
