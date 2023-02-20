package org.hdcd.service.student.book;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.BookMapper;
import org.hdcd.vo.BookVO;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {
	
	@Inject
	BookMapper bookMapper;
	
	@Override
	public List<BookVO> bookList(String selectCol, String serachWord) {
		// TODO Auto-generated method stub
		return bookMapper.bookList(selectCol, serachWord);
	}

	@Override
	public List<Map<String, Object>> getBookrentalList(String userSessionId) {
		// TODO Auto-generated method stub
		return bookMapper.getBookrentalList(userSessionId);
	}

	@Override
	public int bookRental(String sessionId, String book_code, String bookRental_cnt) {
		// TODO Auto-generated method stub
		
		bookMapper.bookStockDown(book_code, bookRental_cnt);
		
		return bookMapper.bookRental(sessionId, book_code, bookRental_cnt);
	}

	@Override
	public int bookReturn(String rent_code) {
		bookMapper.bookStockIncrement(rent_code);
		return bookMapper.bookReturn(rent_code);
	}

	@Override
	public int prolongBook(String rent_code) {
		// TODO Auto-generated method stub
		int res = bookMapper.rentExpandUpdate(rent_code);
		return bookMapper.prolongBook(rent_code);
	}

}
