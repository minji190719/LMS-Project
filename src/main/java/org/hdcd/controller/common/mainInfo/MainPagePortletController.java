package org.hdcd.controller.common.mainInfo;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mainPagePortlet")
public class MainPagePortletController {

	@Inject
	MainPageService mainPageService;
	
	@ResponseBody
	@PostMapping(value = "/update", produces = "text/plain;charset=UTF-8")
	public String updateMyPortlet(HttpServletRequest request, @RequestBody Map<String, String> savePortlet) {
		log.debug("updateMyPortlet");
		String userId = (String) request.getSession().getAttribute("userId");
		String portlet = savePortlet.get("savePortlet"); 
		log.debug("온 값은 : " + portlet);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_no", userId);
		map.put("mem_portlet", portlet);
		int cnt = mainPageService.updateMyPortlet(map);
		return  String.format("%s", cnt);
	}
}
