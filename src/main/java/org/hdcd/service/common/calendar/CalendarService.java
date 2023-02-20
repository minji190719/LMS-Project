package org.hdcd.service.common.calendar;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.CalendarVO;

public interface CalendarService {
	List<Map<String, Object>> getCalendarList(Map<String, Object> dataMap);
	List<Map<String, Object>> getCalendarList2(Map<String, Object> dataMap);
	Map<String, Object> getCalDetail(String groupId);
	int updateCal(Map<String, Object> dataMap);
	int updateCheckBox(Map<String, Object> dataMap);
	int deleteCal(Map<String, Object> dataMap);
	int insertCal(Map<String, Object> dataMap);
}

