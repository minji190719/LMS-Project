package org.hdcd.service.student.volunteer;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.VolunteerMapper;
import org.hdcd.vo.VolunteerListVO;
import org.hdcd.vo.VolunteerQuizVO;
import org.springframework.stereotype.Service;

import android.util.Log;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class SVolunteerInServiceImpl implements SVolunteerInService{

	@Inject
	public VolunteerMapper mapper;
	
	@Override
	public List<VolunteerListVO> volunteerVideoList(String smem_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectVolVideoList(smem_no);
	}

//	@Override
//	public int countMyInTime(String id) throws Exception {
//		// TODO Auto-generated method stub
//		Integer res = mapper.selectMyInTime(id);
//		if(res == 0 || res == null) {
//			return 0;
//		}
//		return res;
//	}

	@Override
	public List<VolunteerQuizVO> selectQuizList(String voll_code) throws Exception {
		// TODO Auto-generated method stub
		return mapper.selectQuizList(voll_code);
	}

	@Override
	public int insertVolTime(String smem_no, String voll_code, String volh_time) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insertVolTime(smem_no,voll_code,volh_time);
	}

	@Override
	public Integer selectMyInnerTime(String id) throws Exception {
		// TODO Auto-generated method stub
		Integer res;
		res = mapper.selectMyInTime(id);
		if(res == null) {
			res = 0;
		}
		log.debug("SVolunteerInServiceImpl selectMyInnerTime 값 확인 : "+res);
		return res;
	}

	@Override
	public Integer countMyTime(String id) throws Exception {
		// TODO Auto-generated method stub
		Integer res;
		res = mapper.selectMyTime(id);
		if(res == null) {
			res = 0;
		}
		log.debug("SVolunteerInServiceImpl countMyTime 값 확인 : "+res);
		return res;
	}



//	@Override
//	public List<VolunteerHisVO> selectMyVideoHis(String smem_no) throws Exception {
//		// TODO Auto-generated method stub
//		return mapper.selectMyVideoHis(smem_no);
//	}

}
