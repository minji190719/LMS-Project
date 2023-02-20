package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.BookVO;

public interface BookMapper {

	List<BookVO> bookList(@Param("selectCol")String selectCol, @Param("serachWord")String serachWord);

	List<Map<String, Object>> getBookrentalList(String userSessionId);

	int bookRental(@Param("sessionId")String sessionId, @Param("book_code")String book_code, @Param("bookRental_cnt")String bookRental_cnt);

	int bookStockDown(@Param("book_code")String book_code, @Param("bookRental_cnt")String bookRental_cnt);

	int bookReturn(String rent_code);

	void bookStockIncrement(String rent_code);

	int prolongBook(String rent_code);

	int rentExpandUpdate(String rent_code);
	
}
