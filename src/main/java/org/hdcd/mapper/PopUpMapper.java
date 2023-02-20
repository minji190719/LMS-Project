package org.hdcd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hdcd.vo.MemberVO;
import org.hdcd.vo.PopupSurveyVO;
import org.hdcd.vo.PopupVO;

public interface PopUpMapper {

	List<PopupVO> popUpOn();

	int popupSurveyChange(@Param("userId")String userId, @Param("popNum")String popNum);

	MemberVO popupSurveyState(String userId);

	int popupSurveySubmit(@Param("userId")String userId, @Param("popupSurveyVO")PopupSurveyVO popupSurveyVO);
	

}
