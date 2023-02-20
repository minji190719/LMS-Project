package org.hdcd.service.student.licenseenroll;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.LicenseEnrollMapper;
import org.hdcd.vo.LicenseEnrollVO;
import org.springframework.stereotype.Service;

@Service
public class LicenseEnrollServiceImpl implements LicenseEnrollService{
	
	@Inject
	LicenseEnrollMapper licenseEnrollMapper; 
	
	@Override
	public List<LicenseEnrollVO> licenseEnrollList(String userId) {

		return licenseEnrollMapper.licenseEnrollList(userId);
	}

	@Override
	public int licenseEnrollApply(LicenseEnrollVO licenseEnrollVO, String savePath) {
		// TODO Auto-generated method stub
		return licenseEnrollMapper.licenseEnrollApply(licenseEnrollVO, savePath);
	}

	@Override
	public int licenseEnrollReject(String licen_code) {
		// TODO Auto-generated method stub
		return licenseEnrollMapper.licenseEnrollReject(licen_code);
	}

}
