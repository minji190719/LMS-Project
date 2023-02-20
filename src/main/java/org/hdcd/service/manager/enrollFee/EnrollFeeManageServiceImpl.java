package org.hdcd.service.manager.enrollFee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hdcd.mapper.EnrollFeeMapper;
import org.hdcd.vo.EnrollFeeVO;
import org.hdcd.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EnrollFeeManageServiceImpl implements IEnrollFeeManageService{

	@Autowired
	EnrollFeeMapper mapper;

	@Override
	public int checkTuiOpen(Map<String, String> map) {
		return mapper.checkTuiOpen(map);
	}

	@Override
	public int notifyTuiEnrolled(Map<String, String> map) {
		int enrl_year = Integer.parseInt(map.get("enrl_year"));
		int enrl_semester = Integer.parseInt(map.get("enrl_semester"));
		
		int totalCnt = 0;
		
		List<Map<String, Object>> studentList = mapper.getEnrolledStudents(map); // 등록금 고지 대상인 재학생의 리스트를 조회한다.
		for (Map<String, Object> student : studentList) {
			log.debug("학생 정보 : " + student.toString());

			int enrl_fee = Integer.parseInt(String.valueOf(student.get("DEP_FEE")));
			// 오라클 데이터타입이 number인 경우, 형변환시 java.math.BigDecimal cannot be cast to java.lang.Integer 에러 발생
			// 고로 String valueof로 형변환 후 사용
			String smem_no = (String) student.get("SMEM_NO");
			int scholarship = 0;
			List<Map<String, Object>> scholarInfoList = mapper.getScholarUnpaidInfo(smem_no);
			if(scholarInfoList.size() != 0) {			
				for (Map<String, Object> unpaid : scholarInfoList) {
					int unpaidScholar = Integer.parseInt(String.valueOf(unpaid.get("SCHL_PRICE")));
					scholarship +=  unpaidScholar; // 장학금 정보를 더함
				}	
				log.debug("학생 " + smem_no + "의 누적 장학금은" + scholarship + "원입니다.");
			}
			int enrl_total = enrl_fee - scholarship;
			if(enrl_total < 0) {
				enrl_total = 0;
			}
			EnrollFeeVO enrollFeeVO = new EnrollFeeVO(smem_no, enrl_year, enrl_semester, enrl_fee, scholarship, enrl_total);
			int cnt = mapper.registerEnrollfee(enrollFeeVO);
			totalCnt += cnt;
			log.debug("totalCnt는 " + totalCnt );
		}
		return totalCnt;
	}

	@Override
	public List<EnrollFeeVO> getUnannouncedTui(String enrl_year, String enrl_semester) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("enrl_year", enrl_year);
		map.put("enrl_semester", enrl_semester);

		List<Map<String, Object>> studentList = mapper.getEnrolledStudents(map); // 등록금 고지 대상인 재학생의 리스트를 조회한다.
		log.debug("처음 가져온 리스트: " + studentList.toString());
		log.debug("처음 가져온 리스트 사이즈 : " + studentList.size());
		
		int year = Integer.parseInt(String.valueOf(enrl_year));
		int semester = Integer.parseInt(String.valueOf(enrl_semester));
		
		List<EnrollFeeVO> unannouncedEnrollFeeList = new ArrayList<EnrollFeeVO>(); 
		
		EnrollFeeVO enrollFeeVO = new EnrollFeeVO();
		enrollFeeVO.setEnrl_year(Integer.parseInt(String.valueOf(enrl_year)));
		enrollFeeVO.setEnrl_semester(Integer.parseInt(String.valueOf(enrl_semester)));
		
		for(Map<String, Object> student : studentList) {
			String smem_no = (String) student.get("SMEM_NO");
			enrollFeeVO.setSmem_no(smem_no);
			int cnt = mapper.checkUnannouncedTui(enrollFeeVO);	
			if(cnt == 0) {
				log.debug("재학생인데 등록금 고지가 안된 사람은 " + smem_no);
				
				int enrl_fee = Integer.parseInt(String.valueOf(student.get("DEP_FEE")));
				// 오라클 데이터타입이 number인 경우, 형변환시 java.math.BigDecimal cannot be cast to java.lang.Integer 에러 발생
				// 고로 String valueof로 형변환 후 사용
				int scholarship = 0;
				List<Map<String, Object>> scholarInfoList = mapper.getScholarUnpaidInfo(smem_no);
				if(scholarInfoList.size() != 0) {			
					for (Map<String, Object> unpaid : scholarInfoList) {
						int unpaidScholar = Integer.parseInt(String.valueOf(unpaid.get("SCHL_PRICE")));
						scholarship +=  unpaidScholar; // 장학금 정보를 더함
					}	
					log.debug("학생 " + smem_no + "의 누적 장학금은" + scholarship + "원입니다.");
				}
				
				int enrl_total = enrl_fee - scholarship;
				if(enrl_total < 0) {
					enrl_total = 0;
				}
				
				EnrollFeeVO unannouncedEnrollFeeVO = new EnrollFeeVO(smem_no, year, semester, enrl_fee, scholarship, enrl_total);
				unannouncedEnrollFeeList.add(unannouncedEnrollFeeVO);
			}
		}
		log.debug("미납부 학생들 : " + unannouncedEnrollFeeList.toString());
		return unannouncedEnrollFeeList;
	}

	@Override
	public List<EnrollFeeVO> getAnnouncedTui(Map<String, String> map) {
		List<EnrollFeeVO> announcedTuiList =  mapper.getAnnouncedTui(map);
		return announcedTuiList;
	}
	
	// 회원 번호에 맞는 개인 정보를 불러오는 메소드
	public MemberVO getMemberInfo(String mem_no) {
		return mapper.getMemberInfo(mem_no);
	}

	@Override
	public int registerEnrollfee(EnrollFeeVO enrollFeeVO) {
		return mapper.registerEnrollfee(enrollFeeVO);
	}

	@Override
	public int checkPaidPeople(EnrollFeeVO enrollFeeVO) {
		return mapper.checkPaidPeople(enrollFeeVO);
	}
	
}
