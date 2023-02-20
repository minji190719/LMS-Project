package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.LicenseEnrollVO;

public interface ManagerLicenseEnrollMapper {

	List<LicenseEnrollVO> licenseEnrollList();

	LicenseEnrollVO licenseEnrollDetail(String licen_code);

	int licenseEnrollReturn(@Param("license_code")String license_code, @Param("rejectContent")String rejectContent);

	int licenseEnrollValidation(String licen_code);

}
