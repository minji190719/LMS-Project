package org.hdcd.controller.common.mainInfo;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.hdcd.vo.CounselApplyVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/mainPageCounsel")
public class MainPageCounsselController {
	
	@Inject
	MainPageService mainPageService;  
	
	@ResponseBody
	@PostMapping(value = "/mainPageCounselapplyList", produces = "application/json;charset=utf-8")
	public List<CounselApplyVO> mainPageCounselapplyList(HttpServletRequest req){
		String userId = (String)req.getSession().getAttribute("userId");
		
		List<CounselApplyVO> mainPageCounselapplyList = mainPageService.mainPageCounselapplyList(userId);
		
		for (CounselApplyVO counselApplyVO : mainPageCounselapplyList) {
			counselApplyVO.setCnsla_date(counselApplyVO.getCnsla_date().substring(0, counselApplyVO.getCnsla_date().indexOf(" ") + 1));
		}
		
		return mainPageCounselapplyList;
	}
	
	
}
