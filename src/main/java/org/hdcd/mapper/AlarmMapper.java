package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

public interface AlarmMapper {

	int inertAlarm(Map<String, Object> dataMap);

	List<Map<String, Object>> getAlarmList(String userId);

	int deleteAlarm(String state);

}
