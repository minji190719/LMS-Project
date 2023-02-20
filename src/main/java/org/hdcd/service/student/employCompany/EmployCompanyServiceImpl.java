package org.hdcd.service.student.employCompany;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.EmployCompanyMapper;
import org.hdcd.vo.EmployCompanyVO;
import org.springframework.stereotype.Service;

@Service
public class EmployCompanyServiceImpl implements IEmployCompanyService{
	
	@Inject
	private EmployCompanyMapper mapper;
	
	@Override
	public List<EmployCompanyVO> selectEmpList(String ecom_category) {
		// TODO Auto-generated method stub
		return mapper.selectEmpList(ecom_category);
	}

	@Override
	public EmployCompanyVO selectOneCompany(String ecom_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectOneCompany(ecom_code);
	}

}
