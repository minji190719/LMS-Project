package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendProveVO;

@Mapper
public interface AttendApplyMapper {

	public List<Map<String, Object>> selectMyAbsentList(String userId) throws Exception;

	public int insertAttendApply(AttendApplyVO attendApplyVO) throws Exception;

	public int insertAttendProve(AttendProveVO attendProveVO) throws Exception;

	public List<Map<String, Object>> selectMyAttendApplyList(String userId) throws Exception;

	public int deleteAttendApply(String aaCode) throws Exception;
	
	
}
