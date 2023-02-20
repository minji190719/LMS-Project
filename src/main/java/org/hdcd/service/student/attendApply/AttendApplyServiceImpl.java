package org.hdcd.service.student.attendApply;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.AttendApplyMapper;
import org.hdcd.vo.AttendApplyVO;
import org.hdcd.vo.AttendProveVO;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendApplyServiceImpl implements IAttendApplyService{

	@Inject
	private AttendApplyMapper mapper;

	@Override
	public List<Map<String, Object>> selectMyAbsentList(String userId) throws Exception {
		return mapper.selectMyAbsentList(userId);
	}

	@Override
	public int insertAttendApply(AttendApplyVO attendApplyVO) throws Exception {
		return mapper.insertAttendApply(attendApplyVO);
	}

	@Override
	public int insertAttendProve(AttendProveVO attendProveVO) throws Exception {
		return mapper.insertAttendProve(attendProveVO);
	}

	@Override
	public List<Map<String, Object>> selectMyAttendApplyList(String userId) throws Exception {
		return mapper.selectMyAttendApplyList(userId);
	}

	@Override
	public int deleteAttendApply(String aaCode) throws Exception {
		return mapper.deleteAttendApply(aaCode);
	}
	
}
