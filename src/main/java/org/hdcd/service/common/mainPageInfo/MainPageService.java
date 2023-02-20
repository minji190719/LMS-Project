package org.hdcd.service.common.mainPageInfo;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.hdcd.vo.BookVO;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.FoodCalendarVO;

public interface MainPageService {

	Map<String, Object> getBookRental(String userId);

	List<BookVO> getBookList();

	List<CounselApplyVO> mainPageCounselapplyList(String userId);
	
	//메인페이지 식단표 메소드 
	List<FoodCalendarVO> getAllFoodList();

	// 메인 페이지 개인 정보(학생)
	Map<String, String> getMainStudentInfo(String userId);

	// 메인 페이지 개인 정보(관리자)
	Map<String, String> getMainAdminInfo(String userId);

	List<Map<String, Object>> getGraduateInfo(String userId);
	
	// 메인 페이지 개인 정보(교수)
	Map<String, String> getMainProfessorInfo(String userId) throws ParseException;

	// 포틀릿 업데이트
	int updateMyPortlet(Map<String, String> map);

	List<Integer> getChartData(String userId);

}
