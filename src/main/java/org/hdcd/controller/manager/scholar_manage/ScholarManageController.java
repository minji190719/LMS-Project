package org.hdcd.controller.manager.scholar_manage;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.service.manager.scholar.IManagerScholarService;
import org.hdcd.vo.ScholarApplyVO;
import org.hdcd.vo.ScholarListVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scholarManage")
public class ScholarManageController {
	
	@Inject
	IManagerScholarService service;

	@GetMapping
	public String scholarManage() {
		log.info("▶manager scholarApproval 실행");
		return "manager/scholarManage";
	}
	
	// 전체 장학금 신청 리스트를 가져오는 메소드
	@GetMapping(value="/totalList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ScholarListVO> getScholarTotalList() {
		log.info("▶manager getScholarTotalList 실행");
		List<ScholarListVO> scholarTotalList = service.getScholarTotalList();
		log.info("scholarTotalList의 toString: {}", scholarTotalList);
		return scholarTotalList;
	}
	
	@PostMapping(value="/approveScholarship", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int approveScholarship(ScholarApplyVO scholarApplyVO) {
		log.info("▶manager approveScholarship 실행");
		log.info("scholarApplyVO.toString(): {}", scholarApplyVO.toString());
		int cnt = service.approveScholarship(scholarApplyVO);
		log.info("난 성공했을까? {}", cnt);
		return cnt;
	}
	
	
}
