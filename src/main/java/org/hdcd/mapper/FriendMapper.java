package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

public interface FriendMapper {

	int searchFriend(String memNo);

	int insertFriend(Map<String, Object> dataMap);

	List<Map<String, Object>> getMyFriendList(String userId);

	List<Map<String, Object>> getMyFriendWait(String userId);

	List<Map<String, Object>> getMyFriendRequest(String userId);

	int deleteFriendRequest(Map<String, Object> dataMap);

	int updateRequest(Map<String, Object> dataMap);

	Map<String, Object> getOneFriendInfo(Map<String, Object> dataMap);
}


