package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.AssignRoomVO;
import org.hdcd.vo.LecOpenListVO;
import org.hdcd.vo.LectureRoomVO;
import org.hdcd.vo.LectureVO;

public interface MLecOpenManagementMapper {

	public List<Map<String, Object>> selectLecOpenApplyList() throws Exception;

	public LecOpenListVO selectRejectContent(String lolCode) throws Exception;

	public Map<String, Object> selectAllLecOpenApplyContents(String lolCode) throws Exception;

	public int updateLecOpenListState(String lolCode) throws Exception;

	public int updateLecOpenListStateNReject(LecOpenListVO lecOpenListVO) throws Exception;

	public List<Map<String, Object>> selectRoomList() throws Exception;

	public void insertAssignRoom(AssignRoomVO assignRoom) throws Exception;

	public void insertLecture(LectureVO lectureVO) throws Exception;
	
}
