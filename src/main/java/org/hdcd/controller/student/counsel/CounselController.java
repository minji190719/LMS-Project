package org.hdcd.controller.student.counsel;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.counsel.CounselService;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.CounselVO;
import org.hdcd.vo.MemberVO;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student")
public class CounselController {
	
	@Inject
	CounselService counselService;
	
	// 상담신청 교수디테일 메소드
	@PostMapping(value = "/counselApplyDetail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CounselVO counselApplyDetail(String cnsl_code) {
		CounselVO counselVO = counselService.counselApplyDetail(cnsl_code);
		counselVO.setCnsl_date(counselVO.getCnsl_date().substring(0, counselVO.getCnsl_date().indexOf(" "))); 
		return counselVO;
	}
	
	/**
	 * [상담신청 내역 조회 메서드]
	 * @param ModelAndView mav
	 * @param HttpServletRequest res
	 * @return student/counselList.jsp   
	 */
	@GetMapping(value = "/counselList.do")
	public ModelAndView counselList(ModelAndView mav, HttpServletRequest res) {
		
		String userId = (String) res.getSession().getAttribute("userId");
		
		log.info("======================================================");
		log.info("세션 아이디 : {}",res.getSession().getAttribute("userId"));
			
		List<CounselApplyVO> counselApplyList = counselService.counselApplyList(userId);
		List<MemberVO> proffsorNameList = new ArrayList<MemberVO>();
		
		
		for (CounselApplyVO counselApplyVO : counselApplyList) {
			proffsorNameList.add(counselService.proffsorNameList(counselApplyVO.getCnsl_code()));
		}
		
		log.info("교수이름리스트 : {}", proffsorNameList);
		
		log.info("길이 : {}", counselApplyList.size());
		
		log.info("신청한 상담 내역 : {}", counselApplyList);
		
		for (CounselApplyVO counselApplyVO : counselApplyList) {
			counselApplyVO.setCnsla_date(counselApplyVO.getCnsla_date().substring(0, counselApplyVO.getCnsla_date().indexOf(" ")));
			counselApplyVO.setCnsl_date(counselApplyVO.getCnsl_date().substring(0, counselApplyVO.getCnsl_date().indexOf(" ")));
		}
		
		
		mav.setViewName("student/counselList");
		mav.addObject("counselApplyList", counselApplyList);
		mav.addObject("proffsorNameList", proffsorNameList);
		
		return mav;
	
	}
	
	/**
	 * [상담 신청 페이지 요청]
	 * @param mav
	 * @param res
	 * @return student/counselApply.jsp
	 */
	@GetMapping(value = "/counselApply.do")
	public ModelAndView counselApply(ModelAndView mav, HttpServletRequest res) {
		
		// 상담교수 내역을 가져오는 메사드
		List<CounselVO> counselList = counselService.getCounselList();
		List<MemberVO> counselListName = new ArrayList<MemberVO>();
		
		for (CounselVO counselVO : counselList) {
			log.info("상담교수 목록 : {}", counselVO.toString());
			counselVO.setCnsl_date(counselVO.getCnsl_date().substring(0, counselVO.getCnsl_date().indexOf(" ")));
			log.info("상담교수 목록 : {}", counselVO.toString());
			MemberVO counselName = counselService.counselNameList(counselVO.getPmem_no());
			counselListName.add(counselName);
		}
		
		log.info("길이 ======================" + counselList.size() + "");
		
		mav.setViewName("student/counselApply");
		mav.addObject("counselList", counselList);
		mav.addObject("counselListName", counselListName);
		
		return mav;
		
	}
	
	/**
	 * [상담신청 처리 메소드]
	 * @param counselApplyVO
	 * @param req
	 * @return 상담신청 성공시 OK, 실패시 NG
	 */
	@PostMapping(value = "/counselApply.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String apply(CounselApplyVO counselApplyVO, HttpServletRequest req) {
		log.info((String)req.getSession().getAttribute("userId"));
		
		counselApplyVO.setSmem_no((String)req.getSession().getAttribute("userId"));
		
		log.info("apply : {}", counselApplyVO);
		
		int res = counselService.apply(counselApplyVO);
		int updateRes = counselService.updateState(counselApplyVO.getCnsl_code());
		// 삼담신청 후 해당 상담 교수 목록을 지우는 메소드
		
		String result = "";
		if(res >= 0) {
			result = "OK";
		}else {
			result = "NG";
		}
				
		return result;
	}
	

	/**
	 * [상담신청 취소]
	 * @param counselApplyVO
	 * @return 취소 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/counsel/return", produces = "text/plain;charset=utf-8")
	public String counselReturn(CounselApplyVO counselApplyVO) {
		log.info("학생 counselReturn 의 CounselApplyVO 값 {}", counselApplyVO);
		
		int res = counselService.counselReturn(counselApplyVO);
		
		log.info("counselReturn 반려 신청 후 값 변경 row수" + res);
		
		if(res > 0) {
			return "OK";
		}
		return "NG";
		
	}
	

	/**
	 * [신청가능 상담 검색하기]
	 * @param searchName
	 * @param searchDate
	 * @param searchSelect
	 * @return List<CounselVO> 
	 */
	@ResponseBody
	@PostMapping(value = "/counselApplySearch", produces = "application/json;charset=utf-8")
	public List<CounselVO> counselApplySearch(String searchName,
									String searchDate, 
									String searchSelect) {
		
		log.info("counselApplySearch의 searchName : {}", searchName);
		log.info("counselApplySearch의 searchDate : {}", searchDate);
		log.info("counselApplySearch의 searchSelect : {}", searchSelect);
		
		List<CounselVO> SearchCounselList = counselService.getSearchCounselList(searchName, searchDate, searchSelect);
		
		for (CounselVO counselVO : SearchCounselList) {
			counselVO.setCnsl_date(counselVO.getCnsl_date().substring(0, counselVO.getCnsl_date().indexOf(" "))); 
		}
		
		log.info("검색 쿼리문 결과 : {}", SearchCounselList);
		
		return SearchCounselList;
	}
	

	/**
	 * [신청한 상담 목록 검색하기]
	 * @param searchProfessorName
	 * @param searchState
	 * @param searchType
	 * @param req
	 * @return List<CounselApplyVO>
	 */
	@ResponseBody
	@PostMapping(value = "/counselApplyListSearch", produces = "application/json;charset=utf-8")
	public List<CounselApplyVO> counselApplyListSearch(String searchProfessorName,
														String searchState, 
														String searchType,
														HttpServletRequest req) {
		String userId = (String)req.getSession().getAttribute("userId");
		List<CounselApplyVO> counselApplyListSearch = counselService.counselApplyListSearch(searchProfessorName, searchState, searchType, userId);
		
		for (CounselApplyVO counselApplyVO : counselApplyListSearch) {
			counselApplyVO.setCnsla_date(counselApplyVO.getCnsla_date().substring(0, counselApplyVO.getCnsla_date().indexOf(" ")));
			counselApplyVO.setCnsl_date(counselApplyVO.getCnsl_date().substring(0, counselApplyVO.getCnsl_date().indexOf(" ")));
		}
		
		log.info("검색 쿼리문 결과 : {}", counselApplyListSearch);
		
		return counselApplyListSearch;
				
	}
	
	
}
