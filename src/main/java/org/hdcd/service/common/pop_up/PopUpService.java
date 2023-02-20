package org.hdcd.service.common.pop_up;

import java.util.List;

import org.hdcd.vo.MemberVO;
import org.hdcd.vo.PopupSurveyVO;
import org.hdcd.vo.PopupVO;

public interface PopUpService {

	List<PopupVO> popUpOn();

	int popupSurveyChange(String userId, String popNum);

	MemberVO popupSurveyState(String userId);

	int popupSurveySubmit(String userId, PopupSurveyVO popupSurveyVO);

}
