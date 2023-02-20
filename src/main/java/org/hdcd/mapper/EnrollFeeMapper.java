package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.EnrollFeeVO;
import org.hdcd.vo.MemberVO;

@Mapper
public interface EnrollFeeMapper {

	// 관리자 
	int checkTuiOpen(Map<String, String> map);

	List<Map<String, Object>> getEnrolledStudents(Map<String, String> nMap);

	List<Map<String, Object>> getScholarUnpaidInfo(String smem_no);

	int registerEnrollfee(EnrollFeeVO enrollFeeVO);

	List<EnrollFeeVO> getAnnouncedTui(Map<String, String> map);
	
	int checkUnannouncedTui(EnrollFeeVO enrollFeeVO);

	MemberVO getMemberInfo(String mem_no);

	int checkPaidPeople(EnrollFeeVO enrollFeeVO);


	// 학생
	List<EnrollFeeVO> getEnrollFeeList(String smem_no);

	Map<String, Object> getStudentInfo(String smem_no);

	int payEnrollFee(String enrl_code);



	
}
