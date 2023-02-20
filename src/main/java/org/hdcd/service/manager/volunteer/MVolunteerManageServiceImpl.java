package org.hdcd.service.manager.volunteer;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hdcd.mapper.VolunteerMapper;
import org.hdcd.vo.VolunteerFileVO;
import org.springframework.stereotype.Service;

@Service
public class MVolunteerManageServiceImpl implements MVolunteerManageService{
	
	@Inject
	private VolunteerMapper mapper;
	
	@Override
	public List<Map<String, Object>> selectRegisterList() {
		// TODO Auto-generated method stub
		return mapper.selectAllRegisterList();
	}

	@Override
	public Map<String, Object> selectDetail(String volo_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectDetail(volo_code);
	}

	@Override
	public int updateVolunteerState(String volo_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateVolState(volo_code);
	}

	@Override
	public int updateVolunteerDenied(String volo_code, String volo_reject) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateVolDenied(volo_code,volo_reject);
	}

	@Override
	public List<VolunteerFileVO> selectFileList(String volo_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectFileList(volo_code);
	}

	
}
