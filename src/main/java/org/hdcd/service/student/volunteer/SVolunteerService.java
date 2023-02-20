package org.hdcd.service.student.volunteer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerOutVO;
import org.springframework.web.multipart.MultipartFile;

public interface SVolunteerService {

	public List<VolunteerOutVO> volunteerOutSelectList(String id) throws Exception;

	public Integer countMyTime(String id) throws Exception;

	public int registerOutVol(VolunteerOutVO vo, List<MultipartFile> volo_rfiles, HttpServletRequest req) throws Exception;

	public void deleteOutRegister(String volo_code)  throws Exception;

	public VolunteerListVO selectOneVideo(String voll_code)  throws Exception;

	public Integer selectMyInnerTime(String id)  throws Exception;




}
