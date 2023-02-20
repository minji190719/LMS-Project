package org.hdcd.controller.common.mainInfo;

import java.net.URLEncoder;

import org.apache.hc.client5.http.fluent.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/news")
public class MainPageNewController {
	
	/**
	 * [메인페이지] 뉴스크롤링 메서드
	 * @param searchWord
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@GetMapping(value = "/crolling",produces = "text/plain;charset=UTF-8")
	public String newsCrolling(String searchWord) throws Exception {
		log.debug("newsCrolling 시작합니다!");
		
		String forUrl = URLEncoder.encode(searchWord,"utf-8");
		
		return Request.get("https://news.google.com/rss/search?q=" + forUrl +"&hl=ko&gl=KR&ceid=KR:ko").execute().returnContent().asString();
	}
	
	
	
	
	
	
}
