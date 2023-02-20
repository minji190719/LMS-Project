package org.hdcd.service.student.friend;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.FriendMapper;
import org.springframework.stereotype.Service;

@Service
public class IFriendServiceImpl implements FriendService{

	@Inject
	FriendMapper mapper;
	
	@Override
	public int searchFriend(String memNo) {
		return mapper.searchFriend(memNo);
	}

	@Override
	public int insertFriend(Map<String, Object> dataMap) {
		return mapper.insertFriend(dataMap);
	}

	@Override
	public List<Map<String, Object>> getMyFriendList(String userId) {
		return mapper.getMyFriendList(userId);
	}

	@Override
	public List<Map<String, Object>> getMyFriendWait(String userId) {
		return mapper.getMyFriendWait(userId);
	}

	@Override
	public List<Map<String, Object>> getMyFriendRequest(String userId) {
		return mapper.getMyFriendRequest(userId);
	}

	@Override
	public int deleteFriendRequest(Map<String, Object> dataMap) {
		return mapper.deleteFriendRequest(dataMap);
	}

	@Override
	public Map<String, Object> updateRequest(Map<String, Object> dataMap) {
		
		int cnt = mapper.updateRequest(dataMap);
		if(cnt > 0) {
			dataMap = mapper.getOneFriendInfo(dataMap);
		}else {
			dataMap = null;
		}
		
		return dataMap;
	}
	
}
