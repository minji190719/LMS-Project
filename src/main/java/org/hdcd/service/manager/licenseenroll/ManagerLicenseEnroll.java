package org.hdcd.service.manager.licenseenroll;

import java.util.List;

import org.hdcd.vo.LicenseEnrollVO;

public interface ManagerLicenseEnroll {

	List<LicenseEnrollVO> licenseEnrollList();

	LicenseEnrollVO licenseEnrollDetail(String smem_no);

	int licenseEnrollReturn(String license_code, String rejectContent);

	int licenseEnrollValidation(String licen_code);

}
