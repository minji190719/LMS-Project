package org.hdcd.service.common.alarm;

import java.util.List;
import java.util.Map;

public interface AlarmService {

	List<Map<String, Object>> getAlarmList(String userId);

	int deleteAlarm(String state);

}
