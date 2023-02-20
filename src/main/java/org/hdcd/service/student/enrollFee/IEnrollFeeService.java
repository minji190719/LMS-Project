package org.hdcd.service.student.enrollFee;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.EnrollFeeVO;

public interface IEnrollFeeService {

	List<EnrollFeeVO> getEnrollFeeList(String smem_no);

	Map<String, Object> getStudentInfo(String smem_no);

	int payEnrollFee(String enrl_code);

}
