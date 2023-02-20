package org.hdcd.service.student.schedule;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.SScheduleMapper;
import org.hdcd.vo.StuTimetableVO;
import org.springframework.stereotype.Service;

@Service
public class IScheduleServiceImpl implements ScheduleService{

	@Inject
	SScheduleMapper mapper;
	
	@Override
	public List<Map<String,Object>> getMyTimeTable(Map<String, Object> dataMap) {
		return mapper.getMyTimeTable(dataMap);
	}

	@Override
	public List<Map<String, Object>> getYS(String userId) {
		return mapper.getYS(userId);
	}

	@Override
	public List<Map<String, Object>> getMyTimeTableAll(String userId) {
		return mapper.getMyTimeTableAll(userId);
	}

}
