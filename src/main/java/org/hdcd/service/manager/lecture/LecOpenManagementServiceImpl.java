package org.hdcd.service.manager.lecture;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.MLecOpenManagementMapper;
import org.hdcd.vo.AssignRoomVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LectureRoomVO;
import org.hdcd.vo.LectureVO;
import org.springframework.stereotype.Service;

@Service
public class LecOpenManagementServiceImpl implements ILecOpenManagementService{
	
	@Inject
	private MLecOpenManagementMapper mapper;

	@Override
	public List<Map<String, Object>> selectLecOpenApplyList() throws Exception {
		return mapper.selectLecOpenApplyList();
	}

	@Override
	public LecOpenListVO selectRejectContent(String lolCode) throws Exception {
		return mapper.selectRejectContent(lolCode);
	}

	@Override
	public Map<String, Object> selectAllLecOpenApplyContents(String lolCode) throws Exception {
		return mapper.selectAllLecOpenApplyContents(lolCode);
	}

	@Override
	public int updateLecOpenListState(String lolCode) throws Exception {
		return mapper.updateLecOpenListState(lolCode);
	}

	@Override
	public int updateLecOpenListStateNReject(LecOpenListVO lecOpenListVO) throws Exception {
		return mapper.updateLecOpenListStateNReject(lecOpenListVO);
	}

	@Override
	public List<Map<String, Object>> selectRoomList() throws Exception {
		return mapper.selectRoomList();
	}

	@Override
	public void insertAssignRoom(AssignRoomVO assignRoom) throws Exception {
		mapper.insertAssignRoom(assignRoom);
		
	}

	@Override
	public void insertLecture(LectureVO lectureVO) throws Exception {
		mapper.insertLecture(lectureVO);
	}


}
