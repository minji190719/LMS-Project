package org.hdcd.service.student.friend;

import java.util.List;
import java.util.Map;

public interface FriendService {

	int searchFriend(String memNo);

	int insertFriend(Map<String, Object> dataMap);

	List<Map<String, Object>> getMyFriendList(String userId);

	List<Map<String, Object>> getMyFriendWait(String userId);

	List<Map<String, Object>> getMyFriendRequest(String userId);

	int deleteFriendRequest(Map<String, Object> dataMap);

	Map<String, Object> updateRequest(Map<String, Object> dataMap);

}
