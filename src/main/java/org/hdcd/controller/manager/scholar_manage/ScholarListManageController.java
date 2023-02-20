package org.hdcd.controller.manager.scholar_manage;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.hdcd.service.manager.scholar.IManagerScholarService;
import org.hdcd.vo.ScholarListVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scholarListManage")
public class ScholarListManageController {

	@Inject
	IManagerScholarService service;
	
	/**
	 * [관리자] scholar_list를 관리하는 페이지 요청 메소드
	 * 
	 * @return manager/sholarListManage.jsp
	 */
	@GetMapping
	public String scholarListManageHome() {
		log.debug("▶ScholarListManageHome");
		return "manager/sholarListManage";
	}
	
	/**
	 * [관리자] 페이지 로딩시 scholar_list 전체 목록을 가져오는 메소드
	 * 
	 * @return List<ScholarListVO>
	 */
	@ResponseBody
	@GetMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public List<ScholarListVO> getTotalScholarList(){
		log.debug("▶getTotalScholarList");
		List<ScholarListVO> totalScholarList = service.getTotalScholarList();
		log.debug("totalScholarList.toString(): {}", totalScholarList.toString());
		return totalScholarList;
	}

	/**
	 * [관리자] scholar_list에 장학금 종류를 추가하는 메소드
	 * 
	 * @param scholarListVO 장학금종류VO
	 * @return 성공 시 1, 실패 시 0
	 */
	@ResponseBody
	@PostMapping(value = "/register", produces = "text/plain;charset=UTF-8")
	public String registerScholarList(ScholarListVO scholarListVO) {
		log.debug("▶registerScholarList");
		log.debug("scholarListVO.toString {}", scholarListVO.toString());
		
		int cnt = service.scholarListManageRegister(scholarListVO);
		
		return Integer.toString(cnt);
	}

}
