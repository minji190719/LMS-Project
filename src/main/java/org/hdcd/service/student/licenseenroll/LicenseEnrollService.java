package org.hdcd.service.student.licenseenroll;

import java.util.List;

import org.hdcd.vo.LicenseEnrollVO;

public interface LicenseEnrollService {

	List<LicenseEnrollVO> licenseEnrollList(String userId);

	int licenseEnrollApply(LicenseEnrollVO licenseEnrollVO, String savePath);

	int licenseEnrollReject(String licen_code);

}
