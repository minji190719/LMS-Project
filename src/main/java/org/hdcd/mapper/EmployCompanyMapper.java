package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.EmployCompanyVO;

@Mapper
public interface EmployCompanyMapper {

	public List<EmployCompanyVO> selectEmpList(String ecom_category);

	public EmployCompanyVO selectOneCompany(String ecom_code);

}
