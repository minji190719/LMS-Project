package org.hdcd.service.professor.lecture;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.ProfessorVO;

public interface LectureGradeService {

	List<Map<String, Object>> getGradeInfo(Map<String, Object> dataMap);

	List<Map<String, Object>> getMyLecList(ProfessorVO professor);

	int insertAllGrade(List<Map<String, Object>> jsonData);

	int checkGradeInsert(String lecCode);

}
