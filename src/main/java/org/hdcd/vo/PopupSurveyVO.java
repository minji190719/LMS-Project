package org.hdcd.vo;

import lombok.Data;

@Data
public class PopupSurveyVO {
	private String surv_code;
	private String mem_no;
	private int surv_answer1;
	private int surv_answer2;
	private int surv_answer3;
	private int surv_reject;
}
