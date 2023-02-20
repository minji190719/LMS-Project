package org.hdcd.controller.student.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheduling")
public class SchedulingController {

	
	@GetMapping(value = "/group")
	public String schedulingMain() {
		return "student/schedule/schedulingGroup";
	}
}
