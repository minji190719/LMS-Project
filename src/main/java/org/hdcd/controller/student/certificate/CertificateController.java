package org.hdcd.controller.student.certificate;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.certificate.CertificateService;
import org.hdcd.vo.CertificateHisVO;
import org.hdcd.vo.CertificateVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/student")
@Controller
public class CertificateController {
	
	@Inject
	CertificateService certificateService;
	
	/**
	 * [증명서 발급 페이지 요청]
	 * @param mav
	 * @param req
	 * @return student/certificate.jsp
	 */
	@GetMapping("/certificate")
	public ModelAndView certificateList(ModelAndView mav, HttpServletRequest req) {
		
		String userSession = (String)req.getSession().getAttribute("userId");
		
		List<CertificateVO> certificateList = certificateService.getCertificateList();
		Map<String, Object> memberVO = certificateService.memberInfo(userSession);
		List<CertificateHisVO> certificateHisList = certificateService.getCertificateHisList(userSession);
		
		// 날짜 포멧
		for (CertificateHisVO certificateHisVO : certificateHisList) {
			certificateHisVO.setCrtfh_date(certificateHisVO.getCrtfh_date().substring(0,certificateHisVO.getCrtfh_date().indexOf(" "))); 
		}
		
		log.info("certificateList : {}", certificateList);
		log.info("memberVOInfo : {}", memberVO);
		log.info("증명서 발급 내역 certificateHisList : {}", certificateHisList);
		
		mav.addObject("certificateList", certificateList);
		mav.addObject("memberVO", memberVO);
		mav.addObject("certificateHisList", certificateHisList);
		
		mav.setViewName("student/certificate");
		
		return mav;
	}
	
	/**
	 * [즘영서 발급 신청 메소드]
	 * @param mav
	 * @param req
	 * @param certificateHisVO
	 * @return 발급신청 성공시 발급될 PDF이름, 실패시 NG
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/certificateApply", produces = "text/plain;charset=utf-8")
	public String certificateApply(ModelAndView mav, HttpServletRequest req, CertificateHisVO certificateHisVO) throws Exception {
		
		String userSession = (String)req.getSession().getAttribute("userId");
		
		certificateHisVO.setSmem_no(userSession);
		
		log.info("certificateHisVO : {}", certificateHisVO);
		
		String res = certificateService.certificateApply(certificateHisVO, req);
		
		log.info("res값 : {}", res);
		
		return res;
	}
	
	/**
	 * [발급받은 PDF iframe 으로 미리보기를 띄어주는 요청]
	 * @param pdfName
	 * @return popPdf.jsp
	 */
	@GetMapping("/popPdf")
	public ModelAndView goPopPdf(String pdfName) {
		ModelAndView mav = new ModelAndView();
		
		log.info("%$$$$$$$$$$ pdfName : {}", pdfName);
		
		mav.addObject("pdfName", pdfName);
		mav.setViewName("popPdf");
		
		return mav;
	}
	
}
