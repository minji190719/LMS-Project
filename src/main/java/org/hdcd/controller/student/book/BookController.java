package org.hdcd.controller.student.book;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.hdcd.service.student.book.BookService;
import org.hdcd.vo.BookVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student")
public class BookController {

	@Inject
	BookService bookService;
	
	/**
	 * [도서 목록 & 빌린 도서 목록]
	 * @param mav
	 * @param req
	 * @param selectCol
	 * @param serachWord
	 * @return student/book.jsp
	 */
	@GetMapping("/bookList")
	public ModelAndView bookList(ModelAndView mav, HttpServletRequest req,
								@RequestParam(value = "selectCol", required = false)String selectCol,
								@RequestParam(value = "serachWord", required = false)String serachWord) {
		
		log.info("들어온 셀렉트 컬럼 &&&&&&&&&&&%^&$%^#$%@$#%@ : {}", selectCol);
		
		log.info("들어온 셀렉트 워드 &&&&&&&&&&&%^&$%^#$%@$#%@ : {}", serachWord);
		
		String userSessionId = (String)req.getSession().getAttribute("userId");
		
		List<BookVO> bookList = bookService.bookList(selectCol, serachWord);
		
		List<Map<String, Object>> bookRentalList = bookService.getBookrentalList(userSessionId);
		
		log.info("도서목록 및 내가 빌린 도서 목록 세션값 : {}", userSessionId);
		
		log.info("도서 : bookList : {}", bookList);
		
		log.info("빌린 도서 목록 : {}", bookRentalList);
		
		// 날짜 포멧
		for (Map<String, Object> map : bookRentalList) {
			Date rentStart = (Date)map.get("RENT_START");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("RENT_START", sdf.format(rentStart));
		}
		
		for (Map<String, Object> map : bookRentalList) {
			Date rentEnd = (Date)map.get("RENT_END");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			map.put("RENT_END", sdf.format(rentEnd));
		}
		
		log.info("빌린 도서 목록 날짜 포멧 이후: {}", bookRentalList);
		
		mav.addObject("bookList", bookList);
		mav.addObject("bookRentalList", bookRentalList);
		mav.setViewName("student/book");
		
		return mav;
	}
	
	/**
	 * [도서 대출 신청]
	 * @param req
	 * @param book_code
	 * @param bookRental_cnt
	 * @return 대출 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/bookRental", produces = "text/plain;charset=utf-8")
	public String bookRental(HttpServletRequest req, String book_code, String bookRental_cnt) {
		String sessionId =  (String)req.getSession().getAttribute("userId");
		
		log.info("도서 대출 신청 들어온 세션값 : {}", sessionId);
		log.info("도서 대출 신청 들어온 book_code : {}", book_code);
		log.info("도서 대출 신청 들어온 bookRental_cnt : {}", bookRental_cnt);
		
		int res = bookService.bookRental(sessionId, book_code, bookRental_cnt);
		
		log.info("도서 대출 후 영향을 받은 row수 : {}", res);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	

	/**
	 * [도서 반납]
	 * @param rent_code
	 * @return 반납성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/bookReturn", produces = "text/plain;charset=utf-8")
	public String bookReturn(String rent_code) {
		log.info("도서 반납 신청 들어온 book_code: {}", rent_code);
		
		int res = bookService.bookReturn(rent_code);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	
	/**
	 * [도서 대출 연장]
	 * @param rent_code
	 * @return 연장 성공시 OK, 실패시 NG
	 */
	@ResponseBody
	@PostMapping(value = "/prolongBook", produces = "text/plain;charset=utf-8")
	public String prolongBook(String rent_code) {
		log.info("도서 대출 연장 신청 들어온 book_code: {}", rent_code);
		
		int res = bookService.prolongBook(rent_code);
		
		if(res > 0) {
			return "OK";
		}
		
		return "NG";
		
	}
	
}
