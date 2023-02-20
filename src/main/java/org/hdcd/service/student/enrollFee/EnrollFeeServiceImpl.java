package org.hdcd.service.student.enrollFee;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.mapper.EnrollFeeMapper;
import org.hdcd.vo.EnrollFeeVO;
import org.springframework.stereotype.Service;

@Service
public class EnrollFeeServiceImpl implements IEnrollFeeService{

	@Inject
	EnrollFeeMapper mapper;
	
	@Override
	public List<EnrollFeeVO> getEnrollFeeList(String smem_no) {
		return mapper.getEnrollFeeList(smem_no);
	}

	@Override
	public Map<String, Object> getStudentInfo(String smem_no) {
		return mapper.getStudentInfo(smem_no);
	}

	@Override
	public int payEnrollFee(String enrl_code) {
		return mapper.payEnrollFee(enrl_code);
	}

}
