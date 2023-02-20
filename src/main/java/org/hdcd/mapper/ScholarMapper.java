package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarFileVO;
import org.hdcd.vo.ScholarHisVO;
import org.hdcd.vo.ScholarListVO;

@Mapper
public interface ScholarMapper {
	// 학생
	List<ScholarListVO> getScholarList();

	List<ScholarApplyVO> getScholarApplyList(String userId);

	int insertScholarApply(ScholarApplyVO scholarApplyVO);

	int insertScholarApplyFile(ScholarFileVO scholarFileVO);

	int scholarApplyFileDelete(String scha_no);
	
	int scholarApplyDelete(String scha_no);

	// 관리자 scholar_list
	int scholarListManageRegister(ScholarListVO scholarListVO);
	
	List<ScholarListVO> getTotalScholarList();

	// 관리자 scholar_apply
	List<ScholarListVO> getScholarTotalList();

	int approveScholarship(ScholarApplyVO scholarApplyVO);

	String getApproveScholar(String scha_no);
	
	Map<String, Object> getApprovedDetails(String scha_no);
	
	// 관리자 scholar_his
	
	int registerScholarHis(ScholarHisVO scholarHisVO);




}
