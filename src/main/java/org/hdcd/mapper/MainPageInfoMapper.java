package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.BookVO;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.FoodCalendarVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.hdcd.vo.StudentVO;

public interface MainPageInfoMapper {

	Map<String, Object> getBookRental(String userId);

	List<BookVO> getBookList();

	List<CounselApplyVO> mainPageCounselapplyList(String userId);

	List<CounselApplyVO> professorMainPageCounselapplyList(String userId);
	
   //메인페이지 식단표
   List<FoodCalendarVO> getAllFoodList();
   
   // [학생] 메인 페이지 정보: 이름, 학과, 단과대학, 학적상태, 이수학점, 교내봉사시간, 교외봉사시간, 자격증승인이력, 도서반납일, 커뮤니티 내글, 최근 완료 상담
   MemberVO getName(String userId);
   StudentVO getStdentInfo(String userId);
   String getCollege(String dep);
   String getStuRecord(String userId);
   String getLhCredit(String userId);
   String getInsideVolh(String userId);
   String getSuburbVolh(String userId);
   String getLicenseEnroll(String userId);
   String getBookRentEnd(String userId);
   String getMyCommunity(String userId);
   String getCnslDate(String userId);

   // [관리자] 메인 페이지 정보: 학적변동 신청 / 개설과목 신청 / 등록금 / 등록금 납부율 / 자격증 신청 / 봉사 신청 / 장학금 신청 / 커뮤니티 신고 
   String getRecordApply();
   String getLecOpen();
   String getAnnouncedFee(int semester);
   String getPaidFee(int semester);
   String getLicense();
   String getVolunteer();
   String getScholar();
   String getCReport();

   List<Map<String, Object>> getGraduateInfo(String userId);
   // [교수] 메인 페이지 정보: 
   MemberVO getMemberInfo(String userId);
   ProfessorVO getProfessorInfo(String userId);
   DepartmentVO getDepartmentVO(String dep_code);
   String getCollegeName(String col_code);
   String getLecAverage(String userId);
   String getOpenLec(String userId);
   String getCStandBy(String userId);

   
   int updateMyPortlet(Map<String, String> map);

//   역량 차트

   int getVolunInTime(String userId);

   int getVolunOutTime(String userId);

   int getBookRentalCount(String userId);

   int getLicenseCount(String userId);

   double getGradeValue(String userId);

   int getCounselCount(String userId);

   int getCommunityCount(String userId);




   
	
}
