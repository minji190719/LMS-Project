package org.hdcd.service.manager.licenseenroll;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.ManagerLicenseEnrollMapper;
import org.hdcd.vo.LicenseEnrollVO;
import org.springframework.stereotype.Service;

@Service
public class ManagerLicenseEnrollImpl implements ManagerLicenseEnroll{
	
	@Inject
	ManagerLicenseEnrollMapper managerLicenseEnrollMapper;
	
	@Override
	public List<LicenseEnrollVO> licenseEnrollList() {
		// TODO Auto-generated method stub
		return managerLicenseEnrollMapper.licenseEnrollList();
	}

	@Override
	public LicenseEnrollVO licenseEnrollDetail(String licen_code) {
		// TODO Auto-generated method stub
		return managerLicenseEnrollMapper.licenseEnrollDetail(licen_code);
	}

	@Override
	public int licenseEnrollReturn(String license_code, String rejectContent) {
		// TODO Auto-generated method stub
		return managerLicenseEnrollMapper.licenseEnrollReturn(license_code, rejectContent);
	}

	@Override
	public int licenseEnrollValidation(String licen_code) {
		// TODO Auto-generated method stub
		return managerLicenseEnrollMapper.licenseEnrollValidation(licen_code);
	}

}
