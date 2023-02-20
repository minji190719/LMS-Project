package org.hdcd.service.common.pop_up;

import java.util.List;

import javax.inject.Inject;

import org.hdcd.mapper.PopUpMapper;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.PopupSurveyVO;
import org.hdcd.vo.PopupVO;
import org.springframework.stereotype.Service;

@Service
public class PopUpServiceImpl implements PopUpService{
	
	@Inject
	PopUpMapper popUpMapper;
	
	@Override
	public List<PopupVO> popUpOn() {
		
		return popUpMapper.popUpOn();
	}

	@Override
	public int popupSurveyChange(String userId, String popNum) {
		// TODO Auto-generated method stub
		return popUpMapper.popupSurveyChange(userId, popNum);
	}

	@Override
	public MemberVO popupSurveyState(String userId) {
		// TODO Auto-generated method stub
		return popUpMapper.popupSurveyState(userId);
	}

	@Override
	public int popupSurveySubmit(String userId, PopupSurveyVO popupSurveyVO) {
		// TODO Auto-generated method stub
		return popUpMapper.popupSurveySubmit(userId, popupSurveyVO);
	}



}
