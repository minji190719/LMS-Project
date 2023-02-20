package org.hdcd.controller.student.community;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.community.ICommunityService;
import org.hdcd.service.student.community.IMyCommunityService;
import org.hdcd.vo.CommunityLikeVO;
import org.hdcd.vo.CommunityVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
public class MyCommunityController {
	String smem_no = "";

	@Inject
	IMyCommunityService myCmntservice;
	
	@Inject
	ICommunityService CmntService;
	
	/**
	 * [학생] 나의 커뮤니티 게시글, 댓글, 좋아요한 게시글을 모아서 볼 수 있는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/my")
	public String myCommunityHome(HttpServletRequest request, Model model) {
		smem_no = (String) request.getSession().getAttribute("userId");
		
		List<CommunityVO> myPost = myCmntservice.getMyPost(smem_no);
		List<Map<String, Object>> myReply = myCmntservice.getMyReply(smem_no);
		List<CommunityVO> myLike = myCmntservice.getMyLike(smem_no);
		int myPostCnt = myCmntservice.getMyPostCnt(smem_no);
		int myReplyCnt = myCmntservice.getMyReplyCnt(smem_no);
		int myLikeCnt = myCmntservice.getMyLikeCnt(smem_no);
		
		log.debug("나의 myPost는" + myPost.toString());
		log.debug("나의 myReply는" + myReply.toString());
		log.debug("나의 myLike는" + myLike.toString());
		log.debug("나의 myPostCnt는" + myPostCnt);
		log.debug("나의 myReplyCnt는" + myReplyCnt);
		log.debug("나의 myLikeCnt는" + myLikeCnt);
		
		model.addAttribute("myPost", myPost);
		model.addAttribute("myReply", myReply);
		model.addAttribute("myLike", myLike);
		model.addAttribute("myPostCnt", myPostCnt);
		model.addAttribute("myReplyCnt", myReplyCnt);
		model.addAttribute("myLikeCnt", myLikeCnt);
		
		return "student/myCommunity";
	}
	
	/**
	 * [학생] 커뮤니티 좋아요를 처리하는 메소드
	 * @param smem_no
	 * @param cmnt_no
	 * @param like_code
	 * @return
	 */
	@ResponseBody
	@GetMapping(value = {"/my/like/{smem_no}/{cmnt_no}/{like_code}", "/my/like/{smem_no}/{cmnt_no}"}, produces = "text/plain;charset=UTF-8")
	public String pressLike(@PathVariable String smem_no, @PathVariable String cmnt_no,  @PathVariable(required = false) String like_code) {
		log.debug("pressLike 실행");
		log.debug("smem_no : " + smem_no);
		log.debug("cmnt_no : " + cmnt_no);
		
		CommunityLikeVO cmntLikeVO = new CommunityLikeVO();
		cmntLikeVO.setCmnt_no(cmnt_no);
		cmntLikeVO.setSmem_no(smem_no);

		if(like_code == null) { // like 이력이 없는 경우			
			log.debug("my_like는 null입니다");
			like_code = "";
			String plike_code = myCmntservice.insertCmntLike(cmntLikeVO);
			log.debug("업데이트된 like 번호는 " + plike_code + "입니다");
			return plike_code;
		}else{	// like 이력이 있는 경우	
			log.debug("like_code : " + like_code);
			cmntLikeVO.setLike_code(like_code);
			int cnt = myCmntservice.deleteCmntLike(cmntLikeVO);
			if(cnt > 0) {
				return "삭제성공";
			}else {
				return "삭제실패";
			}
		}
	}
	
	/**
	 * [학생] 나의 글을 1개 이상 삭제할 수 있는 메소드
	 * @param list
	 * @param request
	 * @return 삭제한 글의 개수
	 */
	@ResponseBody
	@PostMapping(value = "/my/delMyCmntPost", produces = "text/plain;charest=UFT-8")
	public String delMyCmntPost(@RequestBody List<String> list, HttpServletRequest request) {
		log.debug("▶delMyCmntPost");
		
		int checkCnt = 0;
		for (String post : list) {
			int check = CmntService.deleteCmnt(post);
			checkCnt += check;
		}
		return Integer.toString(checkCnt);
	}
	
	/**
	 * [학생] 나의 댓글을 1개 이상 삭제할 수 있는 메소드
	 * @param list
	 * @param request
	 * @return 삭제한 댓글의 개수
	 */
	@ResponseBody
	@PostMapping(value = "/my/delMyCmntReply", produces = "text/plain;charest=UFT-8")
	public String delMyCmntReply(@RequestBody List<String> list, HttpServletRequest request) {
		log.debug("▶delMyCmntReply");
		log.debug("list" + list.toString());
		
		int checkCnt = 0;
		for (String post : list) {
			int check = CmntService.deleteReplyOne(post);
			checkCnt += check;
		}
		return Integer.toString(checkCnt);
	}
	
	/**
	 * [학생] 내가 좋아요한 글을 1개 이상 해제할 수 있는 메소드
	 * @param list
	 * @param request
	 * @return 좋아요 해제한 글의 개수
	 */
	@ResponseBody
	@PostMapping(value = "/my/clearCmntLike", produces = "text/plain;charest=UFT-8")
	public String clearCmntLike(@RequestBody List<String> list, HttpServletRequest request) {
		log.debug("▶clearCmntLike");
		log.debug("list" + list.toString());
		
		String smem_no = (String) request.getSession().getAttribute("userId");
		log.debug("내 아이디는 " + smem_no);
		
		int checkCnt = 0;
		for (String cmnt_no : list) {
			myCmntservice.minusCmntLike(cmnt_no);
			CommunityLikeVO cmntLikeVO = new CommunityLikeVO();
			cmntLikeVO.setSmem_no(smem_no);
			cmntLikeVO.setCmnt_no(cmnt_no);
			checkCnt += myCmntservice.deleteCmntLikeByVO(cmntLikeVO);
		}
		
		return Integer.toString(checkCnt);
	}
	
	/**
	 * [학생] 비동기로 나의 글을 가져오는 메소드
	 * @param request
	 * @return List<CommunityVO>
	 */
	@ResponseBody
	@GetMapping(value="/my/getMyPost", produces = "application/json;charset=UTF-8")
	public List<CommunityVO> getMyPost(HttpServletRequest request) {
		log.debug("▶getMyPost");
		List<CommunityVO> myPost = myCmntservice.getMyPost(smem_no);
		return myPost;
	}
	
	/**
	 * [학생] 비동기로 나의 댓글을 가져오는 메소드
	 * @param request
	 * @return List<Map<String, Object>>
	 */
	@ResponseBody
	@GetMapping(value="/my/getmyReply", produces = "application/json;charset=UTF-8")
	public List<Map<String, Object>> getMyReply(HttpServletRequest request) {
		log.debug("▶getmyReply");
		List<Map<String, Object>> myReply = myCmntservice.getMyReply(smem_no);
		return myReply;
	}
	
	/**
	 * [학생] 비동기로 내가 좋아요한 글을 가져오는 메소드
	 * @param request
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/my/getMyLike", produces = "application/json;charset=UTF-8")
	public List<CommunityVO> getMyLike(HttpServletRequest request) {
		log.debug("▶getMyLike");
		List<CommunityVO> myLike = myCmntservice.getMyLike(smem_no);
		return myLike;
	}
}
