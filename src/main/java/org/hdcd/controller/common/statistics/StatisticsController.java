package org.hdcd.controller.common.statistics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	
	
	@GetMapping(value = "/main")
	public String statisticsMain() {
		return "student/statistics/main";
	}
}
