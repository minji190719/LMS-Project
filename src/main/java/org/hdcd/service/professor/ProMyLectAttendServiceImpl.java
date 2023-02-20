package org.hdcd.service.professor;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.POpenLecAttendMapper;
import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendanceVO;
import org.hdcd.vo.StudentVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProMyLectAttendServiceImpl implements IProMyLecAttendService{

	@Inject
	private POpenLecAttendMapper mapper;
	
	@Override
	public List<Map<String, Object>> selectMyOpenLecList(String userId) throws Exception {
		return mapper.selectMyOpenLecList(userId);
	}

	@Override
	public List<Map<String, Object>> selectMyLecNameNCode(String userId) throws Exception {
		return mapper.selectMyLecNameNCode(userId);
	}

	@Override
	public List<Map<String, Object>> selectLecStudentList(String lec_code) throws Exception {
		return mapper.selectLecStudentList(lec_code);
	}

	@Override
	public Map<String, Object> selectLecStudentInfo(StudentVO studentVO) throws Exception {
		return mapper.selectLecStudentInfo(studentVO);
	}

	@Override
	public Map<String, Object> selectLecWeekList(String lolCode) throws Exception {
		return mapper.selectLecWeekList(lolCode);
	}

	@Override
	public int insertAttentance(AttendanceVO attendanceVO) throws Exception {
		int cnt =  mapper.insertAttentance(attendanceVO);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAttendApplyList(String userId) throws Exception {
		return mapper.selectAttendApplyList(userId);
	}

	@Override
	public Map<String, Object> selectAttendApplyDetail(String aaCode) throws Exception {
		return mapper.selectAttendApplyDetail(aaCode);
	}

	@Override
	public int updateAttendApply(String aaCode) throws Exception {
		return mapper.updateAttendApply(aaCode);
	}

	@Override
	public int updateAttentReject(AttendApplyVO attendapplyVO) throws Exception {
		return mapper.updateAttentReject(attendapplyVO);
	}

	@Override
	public int updateAttendanceState(String adCode) throws Exception {
		return mapper.updateAttendanceState(adCode);
	}

	@Override
	public List<Map<String, Object>> selectAttendStudentList(AttendanceVO attendanceVO) {
		return mapper.selectAttendStudentList(attendanceVO);
	}
 
//	@Transactional
//	public int attendAllUpdate(String adCode, String aaCode) throws Exception {
//		mapper.updateAttendApply(aaCode);
//		mapper.updateAttendanceState(adCode);
//		return 1;
//	}

	
}
