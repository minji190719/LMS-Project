package org.hdcd.controller.manager.licenseenroll_manager;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.manager.licenseenroll.ManagerLicenseEnroll;
import org.hdcd.vo.LicenseEnrollVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/manager")
@Controller
public class ManagerLicenseEnrollController {
	
	@Inject
	ManagerLicenseEnroll managerLicenseEnroll;
	
	
	/**
	 * [자격증 신청 등록 관리 페이지 요청]
	 * @return manager/licenseEnroll.jsp
	 */
	@GetMapping("/licenseEnroll")
	public String licenseEnroll() {
		
		log.info("licenseEnroll");
		
		return "manager/licenseEnroll";
	}
	
	/**
	 * [자격증 등록 신청 내역]
	 * @return List<LicenseEnrollVO>
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollList", produces = "application/json;charset=utf-8")
	public List<LicenseEnrollVO> licenseEnrollList() {
		
		log.info("자격증 등록 신청 목록 메소드");
		
		List<LicenseEnrollVO> licenseEnrollList = managerLicenseEnroll.licenseEnrollList();
		
		for (LicenseEnrollVO licenseEnrollVO : licenseEnrollList) {
			licenseEnrollVO.setLicen_date(licenseEnrollVO.getLicen_date().substring(0, licenseEnrollVO.getLicen_date().indexOf(" "))); 
		}
		
		log.info("자격증 등록 신청 목록 licenseEnrollList : {}", licenseEnrollList);
		
		return licenseEnrollList;
	}
	
	/**
	 * [자격증 등록 신청 상세정보]
	 * @param licen_code
	 * @return LicenseEnrollVO
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollDetail", produces = "application/json;charset=utf-8")
	public LicenseEnrollVO licenseEnrollDetail(String licen_code) {
		
		log.info("자격증 등록 신청 디테일 목록 메소드");
		
		log.info("디테일로 들어온 licen_code : {} ", licen_code);
		
		LicenseEnrollVO licenseEnrollVO = managerLicenseEnroll.licenseEnrollDetail(licen_code);
		
		licenseEnrollVO.setLicen_date(licenseEnrollVO.getLicen_date().substring(0, licenseEnrollVO.getLicen_date().indexOf(" ")));
		
		log.info("디테일 메소드의 반환값 : {}", licenseEnrollVO);
		
		return licenseEnrollVO;
	}
	
	/**
	 * [자격증 등록 신청시 전달받은 파일보기]
	 * @param licen_code
	 * @return LicenseEnrollVO
	 */
	@ResponseBody
	@PostMapping(value = "/prevFileInfo", produces = "application/json;charset=utf-8")
	public LicenseEnrollVO prevFileInfo(String licen_code) {
		
		log.info("prevFileInfo 메소드");
		
		log.info("prevFileInfo로 들어온 licen_code : {} ", licen_code);
		
		LicenseEnrollVO licenseEnrollVO = managerLicenseEnroll.licenseEnrollDetail(licen_code);
		
		licenseEnrollVO.setLicen_date(licenseEnrollVO.getLicen_date().substring(0, licenseEnrollVO.getLicen_date().indexOf(" ")));
		
		log.info("prevFileInfo 반환값 : {}", licenseEnrollVO);
		
		return licenseEnrollVO;
	}
	
	/**
	 * [자격증 등록 신청시 전달받은 파일 미리보기]
	 * @param mav
	 * @param fileName
	 * @return licenseEnrollPrevFile.jsp
	 */
	@GetMapping("/prevFile")
	public ModelAndView prevFile(ModelAndView mav, String fileName) {
//		ModelAndView mav = new ModelAndView();
		
		log.info("%%%%%%%%%% fileName : {}", fileName);
		
		mav.addObject("fileName", fileName);
		mav.setViewName("licenseEnrollPrevFile");
		
		return mav;
	}
	
	/**
	 * [자격증 등록 신청 반려]
	 * @param license_code
	 * @param rejectContent
	 * @return 반려 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollReturn", produces = "application/json;charset=utf-8")
	public String licenseEnrollReturn(String license_code, String rejectContent) {
		
		log.info("자격증 등록 반려");
		
		log.info("디테일로 들어온 license_code : {} ", license_code);
		
		log.info("디테일로 들어온  : rejectContent{} ", rejectContent);
		
		int res = managerLicenseEnroll.licenseEnrollReturn(license_code, rejectContent);
		
		log.info("반려 후 적용된 row수  : {}", res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
	/**
	 * [자격증등록 신청 승인]
	 * @param licen_code
	 * @return 승인 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollValidation", produces = "application/json;charset=utf-8")
	public String licenseEnrollValidation(String licen_code) {
		
		log.info("자격증 등록 승인");
		
		log.info("디테일로 들어온 license_code : {} ", licen_code);
		
		int res = managerLicenseEnroll.licenseEnrollValidation(licen_code);
		
		log.info("승인 후 적용된 row수  : {}", res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
	}
	
}
