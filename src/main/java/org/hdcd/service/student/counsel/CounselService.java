package org.hdcd.service.student.counsel;

import java.util.List;

import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.CounselVO;
import org.hdcd.vo.MemberVO;

public interface CounselService {

	List<CounselApplyVO> counselApplyList(String userId);

	List<CounselVO> getCounselList();

	MemberVO counselNameList(String pmem_no);

	int apply(CounselApplyVO counselApplyVO);

	MemberVO proffsorNameList(String cnsl_code);

	int updateState(String cnsl_code);

	int counselReturn(CounselApplyVO counselApplyVO);

	List<CounselVO> getSearchCounselList(String searchName, String searchDate, String searchSelect);

	List<CounselApplyVO> counselApplyListSearch(String searchProfessorName, String searchState, String searchType, String userId);

	CounselVO counselApplyDetail(String cnsl_code);

}
