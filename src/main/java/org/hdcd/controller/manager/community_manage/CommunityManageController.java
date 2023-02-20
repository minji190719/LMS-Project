package org.hdcd.controller.manager.community_manage;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.service.manager.community.IManagerCommunityService;
import org.hdcd.vo.CommunityVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community/manage")
public class CommunityManageController {

	@Inject
	IManagerCommunityService service;
	/**
	 * [관리자] 커뮤니티 관리 페이지를 요청하는 메소드
	 * 
	 * @return communityManage.jsp
	 */
	@GetMapping
	public String communityManageHome(Model model) {
		log.debug("▶ communityManageHome");
		int unhandledCnt = service.countUnhandled();
		int disposedCnt = service.countDisposed();
		int returnedCnt = service.countReturned();
		
		model.addAttribute("uCnt", unhandledCnt);
		model.addAttribute("dCnt", disposedCnt);
		model.addAttribute("rCnt", returnedCnt);
		return "manager/communityManage";
	}
	
	/**
	 * [관리자] 커뮤니티 신고 미처리 접수건을 조회하는 메소드
	 * 
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/unhandled", produces = "application/json;charset=UTF-8")
	public List<CommunityVO> getUnhandledList() {
		log.debug("▶ getUnhandledList");
		List<CommunityVO> unhandledList = service.getUnhandledList();
		log.debug("unhandledList" + unhandledList.toString());
		return unhandledList;
	}
	
	/**
	 * [관리자] 커뮤니티 신고 처리 접수건을 조회하는 메소드
	 * 
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/disposed", produces = "application/json;charset=UTF-8")
	public List<CommunityVO> getDisposedList() {
		log.debug("▶ getDisposedList");
		List<CommunityVO> disposedList = service.getDisposedList();
		return disposedList;
	}
	
	/**
	 * [관리자] 커뮤니티 신고 반려 건을 조회하는 메소드
	 * 
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/returned", produces = "application/json;charset=UTF-8")
	public List<CommunityVO> getReturnedList() {
		log.debug("▶ getReturnedList");
		List<CommunityVO> returnedList = service.getReturnedList();
		return returnedList;
	}
	
	/**
	 * [관리자] 커뮤니티 신고 미처리 접수건을 처리하는 메소드
	 * 
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/cmntDisposed/{cmnt_no}", produces = "text/plain;charset=UTF-8")
	public String cmntDisposed(@PathVariable String cmnt_no) {
		log.debug("▶ cmntDisposed");
		log.debug("cmnt_no: " + cmnt_no);
		int cnt = service.cmntDisposed(cmnt_no);
		return Integer.toString(cnt);
	}
	
	/**
	 * [관리자] 커뮤니티 신고 미처리 접수건을 반려하는 메소드
	 * 
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/cmntReturned/{cmnt_no}", produces = "text/plain;charset=UTF-8")
	public String cmntReturned(@PathVariable String cmnt_no) {
		log.debug("▶ cmntReturned");
		log.debug("cmnt_no: " + cmnt_no);
		int cnt = service.cmntReturned(cmnt_no);
		return Integer.toString(cnt);
	}
	
	
}
