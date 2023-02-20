package org.hdcd.service.manager.enrollFee;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.EnrollFeeVO;

public interface IEnrollFeeManageService {
	int checkTuiOpen(Map<String, String> map);

	int notifyTuiEnrolled(Map<String, String> map);

	List<EnrollFeeVO> getUnannouncedTui(String enrl_year, String enrl_semester);

	List<EnrollFeeVO> getAnnouncedTui(Map<String, String> map);

	int registerEnrollfee(EnrollFeeVO enrollFeeVO);

	int checkPaidPeople(EnrollFeeVO enrollFeeVO);

}
