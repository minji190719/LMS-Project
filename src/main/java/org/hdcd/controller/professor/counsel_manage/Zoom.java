package org.hdcd.controller.professor.counsel_manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/zoom")
public class Zoom {
	
	@GetMapping("/openZoom")
	public String openZoom() {
		return "CDN/index";
	}
	
	@GetMapping("/openZoom2")
	public String openZoom2() {
		return "CDN/meeting";
	}
	
	@GetMapping("/openZoom3")
	public String openZoom3() {
		return "CDN/externalLinkPage";
	}
}
