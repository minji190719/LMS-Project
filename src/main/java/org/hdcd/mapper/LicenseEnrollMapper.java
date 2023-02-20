package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.LicenseEnrollVO;

public interface LicenseEnrollMapper {

	List<LicenseEnrollVO> licenseEnrollList(String userId);

	int licenseEnrollApply(@Param("licenseEnrollVO")LicenseEnrollVO licenseEnrollVO,
											@Param("savePath")String savePath);

	int licenseEnrollReject(String licen_code);
	

}
