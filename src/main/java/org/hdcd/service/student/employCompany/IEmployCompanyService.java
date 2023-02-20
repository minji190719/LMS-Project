package org.hdcd.service.student.employCompany;

import java.util.List;

import org.hdcd.vo.EmployCompanyVO;

public interface IEmployCompanyService {

	public List<EmployCompanyVO> selectEmpList(String ecom_category) throws Exception;

	public EmployCompanyVO selectOneCompany(String ecom_code) throws Exception;

}
