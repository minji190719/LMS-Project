package org.hdcd.controller.student.community;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.community.ICommunityService;
import org.hdcd.service.student.community.IMyCommunityService;
import org.hdcd.vo.CommunityVO;
import org.hdcd.vo.ReplyVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
public class CommunityController {

	@Inject
	ICommunityService service;
	
	@Inject
	IMyCommunityService myCmntservice;
	
	/**
	 * [학생] 커뮤니티 페이지를 요청하는 메소드
	 * 
	 * @param HttpServletRequest, Model
	 * @return community.jsp
	 */
	@GetMapping
	public String communityHome(HttpServletRequest request, Model model) {
		log.debug("▶student communityHome");		
		String userId = (String) request.getSession().getAttribute("userId");
		model.addAttribute("smem_no", userId);
		
		// 하트가 가장 많은 게시물 12개 가져오는 메소드
		Map<String, Object> cmnt = service.getCmntPopularList();
		
		// 게시글 수, 댓글수, 좋아요수 가져오는 메소드
		int myPostCnt = myCmntservice.getMyPostCnt(userId);
		int myReplyCnt = myCmntservice.getMyReplyCnt(userId);
		int myLikeCnt = myCmntservice.getMyLikeCnt(userId);
		
		model.addAttribute("popular", cmnt.get("cmntList"));
		model.addAttribute("pFile", cmnt.get("cmntFileList"));
		log.debug("pFile: " + cmnt.get("cmntFileList").toString());
		model.addAttribute("myPostCnt", myPostCnt);
		model.addAttribute("myReplyCnt", myReplyCnt);
		model.addAttribute("myLikeCnt", myLikeCnt);
		
		return "student/community";
	}
	
	/**
	 * [학생] 커뮤니티 게시글을 등록하는 메소드
	 * @param HttpServletRequest
	 * @param communityVO
	 * @param List<MultipartFile>
	 * @return 등록 성공 시 1, 실패시 0 
	 */
	@PostMapping(value="/register", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int registerCmntPost(HttpServletRequest request, CommunityVO communityVO, @Nullable List<MultipartFile> files) throws IllegalStateException, IOException {
		log.debug("▶student registerCmntPost");
		log.debug("communityVO : {}", communityVO.toString());
		
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resources/uploads");
		log.debug("realPath : " + realPath );
		
		int cnt = service.registerCmntPost(request, communityVO, files);
		return cnt;
	}
	
	/** [학생] 커뮤니티 전체 게시글을 가져오는 메소드
	 * 
	 * @return cmntMap(cmntList, cmntFileList)
	 */
	@ResponseBody
	@GetMapping(value = "/getCmntTotalList/{startNum}/{endNum}", produces = "application/json;charset=UTF-8")
	public Map<String, Object> getCmntTotalList(@PathVariable String startNum, @PathVariable String endNum) {
		log.info("▶ getCmntTotalList");
		log.debug("startNum" + startNum);
		log.debug("endNum" + endNum);
		
		Map<String, String> scrollNumbers = new HashMap<String, String>();
		scrollNumbers.put("startNum", startNum);
		scrollNumbers.put("endNum", endNum);
		
		Map<String, Object> cmntMap = service.getCmntTotalList(scrollNumbers);
		log.debug("cmntMap: " + cmntMap.toString());
		return cmntMap;
	}
	
	/**
	 * [학생] 커뮤니티 게시글을 상세 조회하는 메소드
	 * 
	 * @param HttpServletRequest, 글 번호(cmnt_no), Model
	 * @return communityMap(cmntVO, cmntFileVOList, replyVOList), userId
	 */
	@GetMapping(value = "/detail/{cmnt_no}", produces = "application/json;charset=UTF-8")
	public String getCmntDetail(HttpServletRequest request, @PathVariable String cmnt_no, Model model) {
		log.debug("▶ getCmntDetail");
		
		String userId = (String) request.getSession().getAttribute("userId");
		log.debug("내 아이디는 " + userId);
		
		Map<String, Object> communityMap = service.getCmntDetail(request, cmnt_no);
		log.info("communityVO.toString() : {}", communityMap.toString());
		model.addAttribute("communityMap", communityMap);
		model.addAttribute("userId", userId);
		return "student/communityDetail";	
	}
	
	/**
	 * [학생] 글을 삭제하는 메소드(글에 딸린 파일과 댓글도 모두 삭제)
	 * 
	 * @param cmnt_no가 담긴 Map
	 * @return 성공 시 1, 실패 시 0
	 */
	@ResponseBody
	@DeleteMapping(value = "/delete",  produces = "text/plain;charset=UTF-8")
	public String deleteCmnt(@RequestBody Map<String, String> map) {
		log.debug("▶ deleteCmnt");
		log.debug("cmnt_no는 " + map.get("cmnt_no")); // cmnt_no는 CMNT173
		String cmnt_no = map.get("cmnt_no");
		int cnt = service.deleteCmnt(cmnt_no);
		return Integer.toString(cnt);
	}
	
	/**
	 * [학생] 커뮤니티 게시글을 수정하는 메소드
	 * 
	 * @param request, communityVO, files
	 * @return
	 * @throws IOException 
	 * @throws Illegal
	 * 
	 * StateException 
	 */
	@ResponseBody
	@PostMapping(value = "/update", produces = "text/plain;charset=UTF-8")
	public String updateCmnt(HttpServletRequest request, CommunityVO communityVO, @Nullable List<MultipartFile> files, @Nullable String[] cmntf_codes) throws IllegalStateException, IOException {
		log.debug("▶ updateCmnt 실행");
		log.debug("communityVO: {}", communityVO.toString());
		log.debug("files:{}", files.get(0).getOriginalFilename() + files.get(0).getName());
		log.debug("cmntf_code : {}", cmntf_codes);
		
		int cnt = service.updateCmnt(request, communityVO, files, cmntf_codes);
		return String.format("%s", cnt);
	}
	
	/**
	 * [학생] 현재 보고 있는 게시글의 이전 게시글을 조회하는 메소드
	 * 
	 * @param 현재의 cmnt_no가 담긴 Map
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/getPrePost", produces = "text/plain;charset=UTF-8")
	public String getPrePost(@RequestBody Map<String, String> map) {
		log.debug("▶ getPrePost");
		log.debug("map은 제대로 들어왔을까? cmnt_no 값: " + map.toString());
		String cmnt_no = map.get("cmnt_no");
		String result = service.getPrePost(cmnt_no);
		log.debug("돌려받은 값은 무엇일까? : " + result);
		return result;
	}
	
	/**
	 * [학생] 현재 보고 있는 게시글의 다음 게시글을 조회하는 메소드
	 * 
	 * @param 현재의 cmnt_no가 담긴 Map
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/getNextPost", produces = "text/plain;charset=UTF-8")
	public String getNextPost(@RequestBody Map<String, String> map) {
		log.debug("▶ getNextPost");
		log.debug("map은 제대로 들어왔을까? cmnt_no 값: " + map.toString());
		String cmnt_no = map.get("cmnt_no");
		String result = service.getNextPost(cmnt_no);
		log.debug("돌려받은 값은 무엇일까? : " + result);
		return result;
	}
	
	/**
	 * [학생] 댓글을 등록하는 메소드
	 * 
	 * @return 성공 시 1, 실패 시 0
	 */
	@ResponseBody
	@PostMapping(value = "/reply/register", produces = "application/json;charset=utf-8")
	public String registerReply(@RequestBody ReplyVO replyVO){
		log.info("▶ registerReply");
		log.debug("replyVO: " + replyVO.toString());
		String reply_no = service.registerReply(replyVO);
		log.debug("cnt는 "+ reply_no);
		return "REPLY" + reply_no;
	}
	
	@ResponseBody
	@GetMapping(value = "/reply/delete/{reply_no}", produces = "text/align;charset=UTF-8")
	public String deleteReplyOne(@PathVariable String reply_no) {
		log.debug("▶ deleteReply");
		log.debug("넘어온 댓글번호는 " + reply_no);
		int cnt = service.deleteReplyOne(reply_no);
		return Integer.toString(cnt);
	}
	
	
	
	/**
	 * [학생] 커뮤니티 게시글을 신고하는 메소드
	 * @param Map (신고글번호, 신고내용, 신고자아이디)
	 * @return 성공 시 1, 실패 시 0
	 */
	@ResponseBody
	@PostMapping(value = "/report", produces = "text/plain;charset=UTF-8")
	public String reportPost(@RequestBody Map<String, String> map) {
		log.debug("▶ reportPost");
		log.debug("온 내용 : " + map.toString());
		int cnt = service.reportPost(map);
		return Integer.toString(cnt);	
	}
	
	/**
	 * [학생] 커뮤니티 게시글을 신고 전 이전 신고여부를 확인하는 메소드
	 * @param 
	 * @return 신고내역 없을 시 0, 있을 시 1
	 */
	@ResponseBody
	@GetMapping(value = "/report/check/{cmnt_no}", produces = "text/plain;charset=UTF-8")
	public String reportPostCheck(@PathVariable String cmnt_no) {
		log.debug("▶ reportPostCheck");
		log.debug("온 내용 : " + cmnt_no);
		CommunityVO communityVO = service.getCmnt(cmnt_no);
		log.debug("toString 출력: " + communityVO.toString());
		if(communityVO.getCmnt_report() == null) {
			return Integer.toString(0); // 신고 내역 없음
		}
		return Integer.toString(1);	// 신고내역 존재
	}
	
	/**
	 * [학생] 커뮤니티 말머리 선택 후 키워드를 넣어 검색, 그 결과값을 목록으로 보여주는 메소드
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@PostMapping(value = "/search", produces = "application/json;charset=utf-8")
	public Map<String, Object> searchCmnt(@RequestBody Map<String, String> map) {
		log.debug("▶ searchCmnt");
		log.debug("searchType: " + map.get("searchType"));
		log.debug("keyword: " + map.get("keyword"));
		Map<String, Object> searchMap = service.searchCmnt(map);
		return searchMap;
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cmntUploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		log.debug("▶ CmntUploadSummernoteImageFile");
		String ImagePath = service.cmntUploadSummernoteImageFile(multipartFile, request);
		return ImagePath;
	}

}
