package org.hdcd.controller.student.employment;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.service.student.employCompany.IEmployCompanyService;
import org.hdcd.vo.EmployCompanyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/employ")
public class SEmployController {

	@Inject
	private IEmployCompanyService service;
	
	/**
	 * [학생] 취업훈련기관페이지 호출 메서드
	 * 
	 * @return String
	 * @throws Exception
	 */
	@GetMapping("/company")
	public String employCompanyListPage() throws Exception{
		log.debug("employCompanyListPage 시작합니다");
		
		return "student/employCompany";
	}
	
	
	/**
	 * [학생] 훈련기관 리스트 뽑아주는 메서드
	 * @param ecom_category
	 * @return List
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/companyList",produces = "application/json;charset=UTF-8")
	public List<EmployCompanyVO> employCompanyListData(String ecom_category) throws Exception{
		log.debug("employCompanyListPage 시작합니다");
		log.debug("ecom_category 확인 : "+ecom_category);
		
		List<EmployCompanyVO> empList = service.selectEmpList(ecom_category); 
		
		return empList;
	}
	
	/**
	 * [학생] 훈련기관 상세정보 출력 메서드
	 * @param ecom_code
	 * @return EmployCompanyVO
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/getOneCompany",produces = "application/json;charset=UTF-8")
	public EmployCompanyVO  getOneCompany(String ecom_code) throws Exception{
		log.debug("getOneCompany 시작합니다");
		log.debug("ecom_code 확인 : "+ecom_code);
		
		EmployCompanyVO empVo = service.selectOneCompany(ecom_code);
		
		return empVo;
	}
	
	
	/**
	 * [학생] 취업훈련기관 좌표값 호출 메서드
	 * @param ecom_x
	 * @param ecom_y
	 * @param ecom_name
	 * @return ModelAndView
	 */
	@GetMapping("/empCompanyMap")
	public ModelAndView empCompanyMap(String ecom_x, String ecom_y,String ecom_name) {
		log.debug("empCompanyMap 실행합니다 - 지도");
		log.debug("좌표확인 x : " + ecom_x);
		log.debug("좌표확인 y : " + ecom_y);
		log.debug("좌표확인 ecom_name : " + ecom_name);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("ecom_x",ecom_x);
		mav.addObject("ecom_y",ecom_y);
		mav.addObject("ecom_name",ecom_name);
		mav.setViewName("empCompanyMap");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
























