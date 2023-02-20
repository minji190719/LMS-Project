package org.hdcd.service.manager.community;

import java.util.List;

import org.hdcd.vo.CommunityVO;

public interface IManagerCommunityService {

	List<CommunityVO> getUnhandledList();

	List<CommunityVO> getDisposedList();

	List<CommunityVO> getReturnedList();

	int cmntDisposed(String cmnt_no);

	int cmntReturned(String cmnt_no);

	int countUnhandled();

	int countDisposed();

	int countReturned();

}
