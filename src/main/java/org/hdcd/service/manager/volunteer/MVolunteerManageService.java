package org.hdcd.service.manager.volunteer;

import java.util.List;
import java.util.Map;

import org.hdcd.vo.VolunteerFileVO;

public interface MVolunteerManageService {

	public List<Map<String, Object>> selectRegisterList() throws Exception;

	public Map<String, Object> selectDetail(String volo_code) throws Exception;

	public int updateVolunteerState(String volo_code)throws Exception;

	public int updateVolunteerDenied(String volo_code, String volo_reject) throws Exception;

	public List<VolunteerFileVO> selectFileList(String volo_code)throws Exception;
	
}
