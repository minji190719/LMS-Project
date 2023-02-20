package org.hdcd.controller.common.mainInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.community.IMyCommunityService;
import org.hdcd.vo.CommunityVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mainPageCommunity")
public class MainPageCommunityController {

	@Inject
	IMyCommunityService service;
	
	@ResponseBody
	@GetMapping(produces = "application/json;charset=UTF-8")
	public Map<String, List<CommunityVO>> mainPageCommunity(HttpServletRequest request) {
		String smem_no = (String) request.getSession().getAttribute("userId");
		
		List<CommunityVO> myPost = service.getMyPost(smem_no);
		List<CommunityVO> myLike = service.getMyLike(smem_no);
		
		Map<String, List<CommunityVO>> myCommunity = new HashMap<String, List<CommunityVO>>();
		myCommunity.put("myPost", myPost);
		myCommunity.put("myLike", myLike);
		return myCommunity;
	}
}
