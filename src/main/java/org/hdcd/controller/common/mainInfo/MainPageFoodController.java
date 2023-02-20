package org.hdcd.controller.common.mainInfo;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.hdcd.vo.FoodCalendarVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mainPageFood")
public class MainPageFoodController {
	
	@Inject
	MainPageService service;
	
	/**
	 * [메인페이지] 식단표 불러오는 메서드
	 * @return foodList
	 */
	@ResponseBody
	@GetMapping(value = "/getFoodList",produces = "application/json;charset=UTF-8")
	public List<FoodCalendarVO> getFoodCalendar() {
		log.debug("getFoodCalendar 실행합니다");
		
		List<FoodCalendarVO> foodList = service.getAllFoodList();
		
		return foodList;
	}
	
}
