package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

public interface SScheduleMapper {

	List<Map<String, Object>> getMyTimeTable(Map<String, Object> dataMap);

	List<Map<String, Object>> getYS(String userId);

	List<Map<String, Object>> getMyTimeTableAll(String userId);

}
