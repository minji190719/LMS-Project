package org.hdcd.controller.common.mainInfo;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.common.mainPageInfo.MainPageService;
import org.hdcd.vo.BookVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mainPageBook")
public class MainPageBookController {
	
	@Inject
	MainPageService mainPageService; 
	
	// 회원이 대여한 대출중인 책 권수, 연체중인 책 권수
	@ResponseBody
	@PostMapping(value = "/getBookRental", produces = "application/json;charset=utf-8")
	public Map<String, Object> getBookRental(HttpServletRequest req){
		String userId = (String)req.getSession().getAttribute("userId");
		
		Map<String, Object> bookCount = mainPageService.getBookRental(userId);
		
		log.debug("회원의 책 대여 권수 : {}", bookCount);
		
		return bookCount;
	}
	
	@ResponseBody
	@PostMapping(value = "/getBookList", produces = "application/json;charset=utf-8")
	public List<BookVO> getBookList(){
		
		List<BookVO> bookList = mainPageService.getBookList();
		
		log.debug("도서 리스트 : {}", bookList);
		
		return bookList;
	}
	
}
