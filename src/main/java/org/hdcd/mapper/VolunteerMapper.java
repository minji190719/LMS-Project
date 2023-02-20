package org.hdcd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.VolunteerFileVO;
import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerOutVO;
import org.hdcd.vo.VolunteerQuizVO;


public interface VolunteerMapper {
	
	//학생의 매퍼
	public List<VolunteerOutVO> selectOutList(String id);

	public Integer selectMyTime(String id);

	public int insertOutVol(VolunteerOutVO vo);

	public void deleteOutRegister(String volo_code);

	public List<VolunteerListVO> selectVolVideoList(String smem_no);

	public Integer selectMyInTime(String id);

	public int insertFiles(VolunteerFileVO fileVO);

	public void deleteFile(String volo_code);

	public VolunteerListVO selectOneVideo(String voll_code);
	
	public int insertVolTime(@Param("smem_no")String smem_no, @Param("voll_code")String voll_code, @Param("volh_time")String volh_time);
	
	public List<VolunteerQuizVO> selectQuizList(String voll_code);

	
	//관리자의 매퍼
	
	public List<Map<String, Object>> selectAllRegisterList();

	public Map<String, Object> selectDetail(String volo_code);

	public int updateVolState(String volo_code);

	public int updateVolDenied(@Param("volo_code") String volo_code,@Param("volo_reject") String volo_reject);

	public List<VolunteerFileVO> selectFileList(String volo_code);



	

//	public List<VolunteerHisVO> selectMyVideoHis(String smem_no);


}
