package org.hdcd.controller.common.mainInfo;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/capability")
@Controller
public class MainPageCapabilityController {
	
	@Inject
	private MainPageService service;
	
	
	/**
	 * [메인페이지] 역량 차트 데이터 불러오는 메서드
	 * @param req
	 * @return resMap
	 */
	@ResponseBody
	@GetMapping(value = "/getData",produces = "application/json;charset=UTF-8")
	public Map<String, Object> getDataForChart(HttpServletRequest req) {
		log.debug("getDataForChart 실행합니다!");
		
		String userId = (String)req.getSession().getAttribute("userId");
		
		List<Integer> resultList = service.getChartData(userId);
		
		//최대 최소값
		int maxValue = Collections.max(resultList);
		int minValue = Collections.min(resultList);
		
		//최대최소값의 index
		int maxIndex = resultList.indexOf(maxValue);
		int minIndex = resultList.indexOf(minValue);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("resultList",resultList);
		resMap.put("maxIndex", maxIndex);
		resMap.put("minIndex", minIndex);
		
		
		return resMap;
	}
	
	
	
	
	
	
	
}
