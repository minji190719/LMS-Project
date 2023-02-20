package org.hdcd.controller.student.licenseEnroll;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.licenseenroll.LicenseEnrollService;
import org.hdcd.vo.LicenseEnrollVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student")
public class LicenseEnrollController {
	
	@Inject
	LicenseEnrollService licenseEnrollService; 
	
	/**
	 * [자격증 등록 페이지 요청]
	 * @return student/licenseEnroll.jsp
	 */
	@GetMapping("/licenseEnroll")
	public String licenseEnroll() {
		return "student/licenseEnroll";
	}
	
	/**
	 * [자격증 등록 페이지 데이터]
	 * @param req
	 * @return List<LicenseEnrollVO>
	 */
	@ResponseBody
	@GetMapping(value = "/licenseEnrollList", produces = "application/json;charset=utf-8")
	public List<LicenseEnrollVO> licenseEnrollList(HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("userId");
		
		log.info("licenseEnrollList 세션아이디 : {}", userId);
		
 		List<LicenseEnrollVO> LicenseEnrollList = licenseEnrollService.licenseEnrollList(userId); 
		 
 		log.info("LicenseEnrollList 회원의 자격증 신청내역: {}", LicenseEnrollList);
 		
		return LicenseEnrollList;
	}
	

	/**
	 * [지갹증 등록 신청 취소]
	 * @param licen_code
	 * @return 신청 취소 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollReject", produces = "text/plain;charset=utf-8")
	public String licenseEnrollReject(String licen_code) {
		log.debug("licenseEnrollReject 메소드 실행");
		
		log.debug("licenseEnrollReject 메소드 파라미터 값 : {}", licen_code);
		
		int res = licenseEnrollService.licenseEnrollReject(licen_code);
		
		if(res > 0) {
			return "OK";
		}
		
		
		return "NG";
	}
	

	/**
	 * [자격증 등록 신청]
	 * @param req
	 * @param licenseEnrollVO
	 * @param licenseEnrollFile
	 * @return 등록 신청 완료시 OK, 실패시 NG
	 * @throws Exception
	 * @throws IOException
	 */
	@ResponseBody
	@PostMapping(value = "/licenseEnrollApply", produces = "application/json;charset=utf-8")
	public String licenseEnrollApply(HttpServletRequest req, 
													LicenseEnrollVO licenseEnrollVO,
													MultipartFile licenseEnrollFile) throws Exception, IOException {
		String userId = (String)req.getSession().getAttribute("userId");
		
		String path = req.getSession().getServletContext().getRealPath("/resources/licenseEnroll");
		
		// mk링크로 인한 선택 가능한 코드
		File licenseEnrollFilePath = new File(path);
		
		if(!licenseEnrollFilePath.exists()) {
			licenseEnrollFilePath.mkdirs();
		}
		
		licenseEnrollVO.setSmem_no(userId);
		
		log.info("Path : {}", path);
		
		log.info("licenseEnrollApply 자격등등록신청 : {}", userId);
		
		log.info("자격증 등록신청 일반 데이터 : {}", licenseEnrollVO);
		log.info("자격등 등록신청 파일 데이터 : {}", licenseEnrollFile.getOriginalFilename());
		log.info("자격등 등록신청 파일 데이터 사이즈: {}", licenseEnrollFile.getSize());
		
		
		
		String extend = licenseEnrollFile.getOriginalFilename().substring(licenseEnrollFile.getOriginalFilename().lastIndexOf("."));
		
		String savePath = path + "/" + UUID.randomUUID() + extend;
//		String savePath = path + "/" + licenseEnrollFile.getOriginalFilename();
		
		licenseEnrollFile.transferTo(new File(savePath));
		
		int res = licenseEnrollService.licenseEnrollApply(licenseEnrollVO, savePath); 
		
		log.info("LicenseEnrollList 회원의 자격증 신청내역 insert된 row수 : {}", res);
		
		if(res > 0) {
			log.info("자격증발급 신청 완료");
			return "OK";
		}
		
		return "NG";
	}
}
