package org.hdcd.service.common.calendar;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.CalendarMapper;
import org.hdcd.vo.CalendarVO;
import org.springframework.stereotype.Service;

@Service
public class ICalendarServiceImpl implements CalendarService{
	
	@Inject
	CalendarMapper mapper;

	@Override
	public List<Map<String, Object>> getCalendarList(Map<String, Object> dataMap) {
		return mapper.getCalendarList(dataMap);
	}

	@Override
	public List<Map<String, Object>> getCalendarList2(Map<String, Object> dataMap) {
		return mapper.getCalendarList2(dataMap);
	}

	@Override
	public Map<String, Object> getCalDetail(String groupId) {
		return mapper.getCalDetail(groupId);
	}

	@Override
	public int updateCal(Map<String, Object> dataMap) {
		return mapper.updateCal(dataMap);
	}

	@Override
	public int updateCheckBox(Map<String, Object> dataMap) {
		return mapper.updateCheckBox(dataMap);
	}

	@Override
	public int deleteCal(Map<String, Object> dataMap) {
		return mapper.deleteCal(dataMap);
	}

	@Override
	public int insertCal(Map<String, Object> dataMap) {
		return mapper.insertCal(dataMap);
	}

}
