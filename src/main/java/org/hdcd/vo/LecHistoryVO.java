package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecHistoryVO {
	private String lhCode;
	private int lh_semester;
	private int lh_year;
	private String lh_lecname;
	private String lh_professor;
	private int lh_credit;
	private String lh_grade;
	private int lh_retake_lec;
//	private String lol_code;
	private int lh_acquire;
//	private String laCode;
	private String lec_code;
	private String smem_no;
}
