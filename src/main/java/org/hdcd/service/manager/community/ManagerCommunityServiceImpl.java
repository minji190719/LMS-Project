package org.hdcd.service.manager.community;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.CommunityMapper;
import org.hdcd.vo.CommunityVO;
import org.springframework.stereotype.Service;

@Service
public class ManagerCommunityServiceImpl implements IManagerCommunityService {

	@Inject
	CommunityMapper mapper;

	@Override
	public List<CommunityVO> getUnhandledList() {
		return mapper.getUnhandledList();
	}

	@Override
	public List<CommunityVO> getDisposedList() {
		return mapper.getDisposedList();
	}

	@Override
	public List<CommunityVO> getReturnedList() {
		return mapper.getReturnedList();
	}

	@Override
	public int cmntDisposed(String cmnt_no) {
		return mapper.cmntDisposed(cmnt_no);
	}

	@Override
	public int cmntReturned(String cmnt_no) {
		return mapper.cmntReturned(cmnt_no);
	}

	@Override
	public int countUnhandled() {
		return mapper.countUnhandled();
	}

	@Override
	public int countDisposed() {
		return mapper.countDisposed();
	}

	@Override
	public int countReturned() {
		return mapper.countReturned();
	}

}
