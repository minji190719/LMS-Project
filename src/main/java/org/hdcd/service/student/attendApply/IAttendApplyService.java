package org.hdcd.service.student.attendApply;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendProveVO;

public interface IAttendApplyService {

	public List<Map<String, Object>> selectMyAbsentList(String userId) throws Exception;

	public int insertAttendApply(AttendApplyVO attendApplyVO) throws Exception;

	public int insertAttendProve(AttendProveVO attendProveVO) throws Exception;

	public List<Map<String, Object>> selectMyAttendApplyList(String userId) throws Exception;

	public int deleteAttendApply(String aaCode) throws Exception;

}
