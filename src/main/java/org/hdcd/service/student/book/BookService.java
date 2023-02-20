package org.hdcd.service.student.book;


import java.util.List;
import java.util.Map;

import org.hdcd.vo.BookVO;

public interface BookService {

	List<BookVO> bookList(String selectCol, String serachWord);

	List<Map<String, Object>> getBookrentalList(String userSessionId);

	int bookRental(String sessionId, String book_code, String bookRental_cnt);

	int bookReturn(String rent_code);

	int prolongBook(String rent_code);

}
