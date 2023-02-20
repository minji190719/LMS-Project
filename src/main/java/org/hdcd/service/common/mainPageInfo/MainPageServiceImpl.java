package org.hdcd.service.common.mainPageInfo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.MainPageInfoMapper;
import org.hdcd.vo.BookVO;
import org.hdcd.vo.CounselApplyVO;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.FoodCalendarVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.hdcd.vo.StudentVO;
import org.springframework.stereotype.Service;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MainPageServiceImpl implements MainPageService{

	@Inject
	MainPageInfoMapper mainPageInfoMapper; 
	
	@Override
	public Map<String, Object> getBookRental(String userId) {
		return mainPageInfoMapper.getBookRental(userId);
	}

	@Override
	public List<BookVO> getBookList() {
		return mainPageInfoMapper.getBookList();
	}

	@Override
	public List<CounselApplyVO> mainPageCounselapplyList(String userId) {
		
		if(userId.length() == 6) {
			List<CounselApplyVO> professorMainPageCounselapplyList = mainPageInfoMapper.professorMainPageCounselapplyList(userId);
			return professorMainPageCounselapplyList;
		}else {
			List<CounselApplyVO> mainPageCounselapplyList = mainPageInfoMapper.mainPageCounselapplyList(userId);
			return mainPageCounselapplyList;
		}
		
	}
	
   //메인페이지 식단표
   @Override
   public List<FoodCalendarVO> getAllFoodList() {
      return mainPageInfoMapper.getAllFoodList();
   }

   // [학생] 메인 페이지 정보: 사진, 이름, 학과, 단과대학, 학적상태, 이수학점, 교내봉사시간, 교외봉사시간, 자격증승인이력, 도서반납일, 커뮤니티 내글, 최근 완료 상담
	@Override
	public Map<String, String> getMainStudentInfo(String userId) {
		MemberVO memberVO = mainPageInfoMapper.getName(userId);
		StudentVO student = mainPageInfoMapper.getStdentInfo(userId);
		String department = student.getStu_dep();
		String college = mainPageInfoMapper.getCollege(department);
		String stuRecord = mainPageInfoMapper.getStuRecord(userId);
		String lhCredit = mainPageInfoMapper.getLhCredit(userId);
		String insideVolh = mainPageInfoMapper.getInsideVolh(userId);
		String suburbVolh = mainPageInfoMapper.getSuburbVolh(userId);
		String license = mainPageInfoMapper.getLicenseEnroll(userId);
		String bookRentEnd = mainPageInfoMapper.getBookRentEnd(userId);
		String myCommunity = mainPageInfoMapper.getMyCommunity(userId);
		String cnslDate = mainPageInfoMapper.getCnslDate(userId);
		
		Map<String, String> info = new HashMap<String, String>();
		info.put("photo", memberVO.getMem_photopath());
		info.put("name", memberVO.getMem_name());
		info.put("portlet", memberVO.getMem_portlet());
		info.put("department", department);
		info.put("college", college);
		info.put("s1", stuRecord);
		info.put("s2", lhCredit);
		info.put("s3", insideVolh);
		info.put("s4", suburbVolh);
		info.put("s5", license);
		info.put("s6", bookRentEnd);
		info.put("s7", myCommunity);
		info.put("s8", cnslDate);
		
		return info;
	}

	// [관리자] 메인 페이지 정보: 학적변동 신청 / 개설과목 신청 / 등록금 / 등록금 납부율 / 자격증 신청 / 봉사 신청 / 장학금 신청 / 커뮤니티 신고 
	@Override
	public Map<String, String> getMainAdminInfo(String userId) {
		MemberVO memberVO = mainPageInfoMapper.getMemberInfo(userId);
		String portlet = memberVO.getMem_portlet();
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int semester = (month < 7) ? 1 : 2;

		String record = mainPageInfoMapper.getRecordApply();
		String lec= mainPageInfoMapper.getLecOpen();		
		String announced = mainPageInfoMapper.getAnnouncedFee(semester);
		String paid = mainPageInfoMapper.getPaidFee(semester);
		
		String license = mainPageInfoMapper.getLicense();
		String volunteer = mainPageInfoMapper.getVolunteer();
		String scholar = mainPageInfoMapper.getScholar();
		String cReport = mainPageInfoMapper.getCReport();
		
		Map<String, String> info = new HashMap<String, String>();
		info.put("portlet", portlet);
		info.put("a1", record);
		info.put("a2", lec);
		info.put("a3", announced);
		info.put("a4", paid);
		info.put("a5", license);
		info.put("a6", volunteer);
		info.put("a7", scholar);
		info.put("a8", cReport);
		
		log.debug("관리자의 정보 " + info.toString());
		return info;
	}

	@Override
	public List<Map<String, Object>> getGraduateInfo(String userId) {
		return mainPageInfoMapper.getGraduateInfo(userId);
	}
	// [교수] 
	@Override
	public Map<String, String> getMainProfessorInfo(String userId) throws ParseException {
		MemberVO memberVO = mainPageInfoMapper.getMemberInfo(userId);
		String photo = memberVO.getMem_photopath();
		String name = memberVO.getMem_name();
		String portlet = memberVO.getMem_portlet();
		log.info("memberVO : " + memberVO.toString());
		
		ProfessorVO professorVO = mainPageInfoMapper.getProfessorInfo(userId);
		String position = professorVO.getPosition();
		String room = Integer.toString(professorVO.getRoomnum());
		String join = professorVO.getJoin_date();
		String joinDay = join.substring(0, 10);
		
		Date criteria = new SimpleDateFormat("yyyy-MM-dd").parse(joinDay);
		Date today = new Date();
		
		long diffSecond = (today.getTime() - criteria.getTime()) / 1000; 
		long diffDays = diffSecond / (24*60*60); 
		log.debug("차이가 나는 날은 : " + diffDays);
		
		// 재직한 지 ~일
		log.info("professorVO : " + professorVO.toString());

		DepartmentVO departmentVO = mainPageInfoMapper.getDepartmentVO(professorVO.getDep_code());
		String department = departmentVO.getDep_name();
		String college = mainPageInfoMapper.getCollegeName(departmentVO.getCol_code());
		String average = mainPageInfoMapper.getLecAverage(userId);
		String openLec = mainPageInfoMapper.getOpenLec(userId);
		String cStandBy = mainPageInfoMapper.getCStandBy(userId);
		
		Map<String, String> info = new HashMap<String, String>();
		info.put("photo", photo);
		info.put("name", name);
		info.put("portlet", portlet);
		info.put("department", department);
		info.put("college", college);
		info.put("p1", position); 
		info.put("p2", room);
		info.put("p3", join);
		info.put("p4", Long.toString(diffDays));
		info.put("p5", average);
		info.put("p6", openLec);
		info.put("p7", cStandBy);
		log.debug("info : " + info.toString());
		// 안 읽은 메일수 없음.
		return info;
	}

	@Override
	public int updateMyPortlet(Map<String, String> map) {
		return mainPageInfoMapper.updateMyPortlet(map);
	}

	@Override
	public List<Integer> getChartData(String userId) {
		// TODO Auto-generated method stub
		
		int volunTimeInRes = mainPageInfoMapper.getVolunInTime(userId);
		int volunTimeOutRes = mainPageInfoMapper.getVolunOutTime(userId);
		int volunRes = ((volunTimeInRes + volunTimeOutRes)*100) / 72; 
		
		int bookCount = mainPageInfoMapper.getBookRentalCount(userId);
		int bookCountRes = bookCount * 10;
		
		int licenseCount = mainPageInfoMapper.getLicenseCount(userId);
		int licenseCountRes = licenseCount * 10;
		
		double gradeValue = mainPageInfoMapper.getGradeValue(userId);
		int gradeValueRes = (int) ((gradeValue * 100) / 4.5);
		
		int counselCount = mainPageInfoMapper.getCounselCount(userId);
		int communityCount = mainPageInfoMapper.getCommunityCount(userId);
		
		int commuRes = (counselCount + communityCount) * 10;
		
//		Map<String, Object> chartResult = new HashMap<String, Object>();
		List<Integer> chartResult = new ArrayList<Integer>();
		chartResult.add(licenseCountRes);
		chartResult.add(volunRes);
		chartResult.add(gradeValueRes);
		chartResult.add(bookCountRes);
		chartResult.add(commuRes);
		
//		chartResult.put("licenseCountRes", licenseCountRes);
//		chartResult.put("volunRes", volunRes);
//		chartResult.put("gradeValueRes", gradeValueRes);
//		chartResult.put("bookCountRes", bookCountRes);
//		chartResult.put("commuRes", commuRes);
		
//		log.debug("결과를 확인해봅시다 {}",chartResult.toString());
		
		return chartResult;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}












