package org.hdcd.service.common.alarm;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.AlarmMapper;
import org.springframework.stereotype.Service;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Inject
	AlarmMapper mapper;
	
	@Override
	public List<Map<String, Object>> getAlarmList(String userId) {
		return mapper.getAlarmList(userId);
	}

	@Override
	public int deleteAlarm(String state) {
		return mapper.deleteAlarm(state);
	}

	
	
}
