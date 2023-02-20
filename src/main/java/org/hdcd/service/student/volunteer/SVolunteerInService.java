package org.hdcd.service.student.volunteer;

import java.util.List;

import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerQuizVO;

public interface SVolunteerInService {

	public List<VolunteerListVO> volunteerVideoList(String smem_no) throws Exception;

//	public Integer countMyInTime(String id) throws Exception;

	public List<VolunteerQuizVO> selectQuizList(String voll_code) throws Exception;

	public int insertVolTime(String smem_no, String voll_code, String volh_time) throws Exception;

	public Integer selectMyInnerTime(String smem_no) throws Exception;

	public Integer countMyTime(String id) throws Exception;

//	public List<VolunteerHisVO> selectMyVideoHis(String smem_no) throws Exception;

}
