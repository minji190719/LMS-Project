package org.hdcd.service.professor.lecture;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.PLectureMapper;
import org.hdcd.mapper.SLectrueMapper;
import org.hdcd.vo.ProfessorVO;
import org.springframework.stereotype.Service;

@Service
public class ILectureGradeServiceImpl implements LectureGradeService{
	
	@Inject
	PLectureMapper mapper;

	@Override
	public List<Map<String, Object>> getGradeInfo(Map<String, Object> dataMap) {
		return mapper.getGradeInfo(dataMap);
	}

	@Override
	public List<Map<String, Object>> getMyLecList(ProfessorVO professor) {
		return mapper.getMyLecList(professor);
	}

	@Override
	public int insertAllGrade(List<Map<String, Object>> jsonData) {
		
		for(Map<String, Object> student : jsonData) {
			int cnt = mapper.insertGrade(student);
		}
		
		return 0;
	}

	@Override
	public int checkGradeInsert(String lecCode) {
		return mapper.checkGradeInsert(lecCode);
	}

}
