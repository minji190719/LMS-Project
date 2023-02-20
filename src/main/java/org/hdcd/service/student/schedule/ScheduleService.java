package org.hdcd.service.student.schedule;

import java.util.List;
import java.util.Map;


public interface ScheduleService{

	List<Map<String,Object>> getMyTimeTable(Map<String, Object> dataMap);

	List<Map<String, Object>> getYS(String userId);

	List<Map<String, Object>> getMyTimeTableAll(String userId);

}
