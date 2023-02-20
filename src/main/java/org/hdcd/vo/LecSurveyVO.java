package org.hdcd.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecSurveyVO {
	private String ls_code;
	private int ls_question1;
	private int ls_question2;
	private int ls_question3;
	private int ls_question4;
	private int ls_question5;
	private String ls_content;
	private String ls_note;
	private String lec_code;
	private String smem_no;
}
