package org.hdcd.service.student.lecture;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hdcd.mapper.SLectrueMapper;
import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.LecApplyVO;
import org.hdcd.vo.LecGradeVO;
import org.hdcd.vo.LecHistoryVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecSurveyVO;
import org.hdcd.vo.LecturePlanVO;
import org.hdcd.vo.LectureVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.hdcd.vo.StuTimetableVO;
import org.springframework.stereotype.Service;

@Service
public class StudenLectureServiceImpl implements StudentLectureService{

	@Inject
	SLectrueMapper mapper;
	
	// 강좌 전체 리스트
	@Override
	public List<LecOpenListVO> selectAll() {
		return mapper.selectLolAll();
	}

	// 교수 정보
	@Override
	public ProfessorVO selectPmem(String pMemNo) {
		return mapper.selectPmem(pMemNo);
	}

	// 맴버 정보 
	@Override
	public MemberVO selectMem(String pMemNo) {
		return mapper.selectMem(pMemNo);
	}

	// 학과정보
	@Override
	public DepartmentVO selectDep(String depCode) {
		return mapper.selectDep(depCode);
	}

	// 강의 계획 정보
	@Override
	public LecturePlanVO selectLecP(String lolCode) {
		return mapper.selectLecP(lolCode);
	}

	// 강의 개설 정보
	@Override
	public LecOpenListVO selectLecOpen(String lol_code) {
		return mapper.selectLecOpen(lol_code);
	}

	// 강의 전체 조회
	@Override
	public List<LectureVO> selectLecAll() {
		
		List<LectureVO> lectureList = mapper.selectLecAll();
		
		return lectureList;
	}

	
	// 강의목록 전체 출력
	@Override
	public List<Map<String, Object>> selectLecList() {
		
		List<Map<String, Object>> dataList = mapper.selectAllInfo();

		return dataList;
	}
	
	// 예비수강 바구니 추가
	@Override
	public void inserApply(LecApplyVO lecApply) {
		mapper.inserApply(lecApply);
	}
	
	// 내 수강바구니 전체 출력
	@Override
	public List<LecApplyVO> selectLecApplyAll(String userId) {
		return mapper.selectLecApplyAll(userId);
	}

	@Override
	public List<Map<String, Object>> selectMyLecApply(String userId) {
		
		
		// userId
		List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
		dataList = mapper.selectAllmyLecInfo(userId);
		
		return dataList;
	}

	@Override
	public Map<String, Object> deleteLecApply(LecApplyVO lecApply) {
		
		Map<String, Object> dataMap = mapper.getDeleteInfo(lecApply);
		
		mapper.deleteLecApply(lecApply.getLa_code());
		
		return dataMap;
	}

	@Override
	public LectureVO selectLec(String lec_code) {
		return mapper.selectLec(lec_code);
	}

	@Override
	public LecApplyVO selectLecApplyOne(LecApplyVO lecApply) {
		return mapper.selectLecApplyOne(lecApply);
	}

	@Override
	public Map<String, Object> insertHis(LecApplyVO tmpLecApply) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		// 컨트롤러에서 상태값을 받아옴
		if(tmpLecApply.getLa_state() == 1) {
			mapper.updateLecApply(tmpLecApply);
		}else if(tmpLecApply.getLa_state() == 0) {
			// 여기서 그냥 1 매핑해서 넘긴다
			tmpLecApply.setLa_state(1);
			mapper.inserApply(tmpLecApply);
		}
		//여기서 맵으로 담아야 합니다
		// tmpLecApply 객체에 담긴걸 이용해서 모든정보 가져온다.
		dataMap = mapper.getAllAboutlecHisInfo(tmpLecApply);
		
		LecHistoryVO lecHistory = new LecHistoryVO();
//		lecHistory.setLol_code((String)dataMap.get("LOL_CODE"));
//		lecHistory.setLaCode((String)dataMap.get("LA_CODE"));
		lecHistory.setLec_code((String)dataMap.get("LEC_CODE"));
		lecHistory.setLh_semester(Integer.parseInt(String.valueOf(dataMap.get("LOL_SEMESTER"))));
		lecHistory.setLh_year(Integer.parseInt(String.valueOf(dataMap.get("LOL_YEAR"))));
		lecHistory.setLh_lecname((String)dataMap.get("LOL_NAME"));
		lecHistory.setLh_professor((String)dataMap.get("MEM_NAME"));
		lecHistory.setSmem_no((String)dataMap.get("SMEM_NO"));
		
		int cnt = mapper.insertHis(lecHistory);
		
		return dataMap;
	}

	@Override
	public List<LecGradeVO> getMyGradeList(LecGradeVO lecGrade) {
		return mapper.getMyGradeList(lecGrade);
	}

	@Override
	public List<Map<String, Object>> getMyEvalList(LecGradeVO lecGrade) {
		return mapper.getMyEvalList(lecGrade);
	}

	@Override
	public Map<String, Object> checkEvalState(LecGradeVO lecGrade) {
		return mapper.checkEvalState(lecGrade);
	}

	@Override
	public int insertLecSurvey(LecSurveyVO lecSurvey) {
		
		int cnt = mapper.insertLecSurvey(lecSurvey);
		if(cnt > 0) {
			mapper.updateLecGradeState(lecSurvey);
		}
		
		return cnt;
	}

	@Override
	public int insertTimeTable(StuTimetableVO stuTimeTable) {
		return mapper.insertTimeTable(stuTimeTable);
	}

	@Override
	public void deleteTimeTable(Map<String, Object> dataMap) {
		mapper.deleteTimeTable(dataMap);
	}

	@Override
	public Map<String, Object> selectLecInfo(LecApplyVO lecApply) {
		return mapper.selectLecInfo(lecApply);
	}

	@Override
	public void deleteLecHistory(Map<String, Object> dataMap) {
		mapper.deleteLecHistory(dataMap);
	}

	@Override
	public List<Map<String, Object>> getNowMyGrade(Map<String, Object> dataMap) {
		return mapper.getNowMyGrade(dataMap);
	}

	@Override
	public Map<String, Object> getAllPlanInfo(String lolCode) {
		return mapper.getAllPlanInfo(lolCode);
	}




	

	
	

}
