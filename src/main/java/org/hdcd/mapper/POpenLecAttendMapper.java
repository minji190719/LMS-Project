package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendanceVO;
import org.hdcd.vo.StudentVO;

public interface POpenLecAttendMapper {

	public List<Map<String, Object>> selectMyOpenLecList(String userId) throws Exception;

	public List<Map<String, Object>> selectMyLecNameNCode(String userId) throws Exception;

	public List<Map<String, Object>> selectLecStudentList(String lec_code) throws Exception;

	public Map<String, Object> selectLecStudentInfo(StudentVO studentVO) throws Exception;

	public Map<String, Object> selectLecWeekList(String lolCode) throws Exception;

	public int insertAttentance(AttendanceVO attendanceVO) throws Exception;

	public List<Map<String, Object>> selectAttendApplyList(String userId) throws Exception;

	public Map<String, Object> selectAttendApplyDetail(String aaCode) throws Exception;

	public int updateAttendApply(String aaCode) throws Exception;

	public int updateAttentReject(AttendApplyVO attendapplyVO) throws Exception;

	public int updateAttendanceState(String adCode) throws Exception;

	public List<Map<String, Object>> selectAttendStudentList(AttendanceVO attendanceVO);

	
	
	
}
