package org.hdcd.service.student.lecture;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.DepartmentVO;
import org.hdcd.vo.LecApplyVO;
import org.hdcd.vo.LecGradeVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LecSurveyVO;
import org.hdcd.vo.LecturePlanVO;
import org.hdcd.vo.LectureVO;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.ProfessorVO;
import org.hdcd.vo.StuTimetableVO;

public interface StudentLectureService {
	
	public List<LecOpenListVO> selectAll();

	public ProfessorVO selectPmem(String pMemNo);

	public MemberVO selectMem(String pMemNo);

	public DepartmentVO selectDep(String depCode);

	public LecturePlanVO selectLecP(String lolCode);

	public LecOpenListVO selectLecOpen(String lol_code);

	public List<LectureVO> selectLecAll();

	public List<Map<String, Object>> selectLecList();

	public void inserApply(LecApplyVO lecApply);

	public List<LecApplyVO> selectLecApplyAll(String userId);

	public List<Map<String, Object>> selectMyLecApply(String userId);

	public Map<String, Object> deleteLecApply(LecApplyVO lecApply);

	public LectureVO selectLec(String lec_code);

	public LecApplyVO selectLecApplyOne(LecApplyVO lecApply);

	public Map<String, Object> insertHis(LecApplyVO tmpLecApply);

	public List<LecGradeVO> getMyGradeList(LecGradeVO lecGrade);

	public List<Map<String, Object>> getMyEvalList(LecGradeVO lecGrade);

	public Map<String, Object> checkEvalState(LecGradeVO lecGrade);

	public int insertLecSurvey(LecSurveyVO lecSurvey);

	public int insertTimeTable(StuTimetableVO stuTimeTable);

	public void deleteTimeTable(Map<String, Object> dataMap);

	public Map<String, Object> selectLecInfo(LecApplyVO lecApply);

	public void deleteLecHistory(Map<String, Object> dataMap);

	public List<Map<String, Object>> getNowMyGrade(Map<String, Object> dataMap);

	public Map<String, Object> getAllPlanInfo(String lolCode);



}
