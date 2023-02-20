package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecGradeVO {
	private String lg_code;
	private int lg_year;
	private int lg_semester;
	private String lg_area;
	private String lg_name;
	private int lg_apply_credit;
	private int lg_acq_credit;
	private int lg_score;
	private double lg_rating;
	private String lg_grade;
	private int lg_giveup;
	private String lec_code;
	private String smem_no;
	private String lh_code;
	private int lg_schyear;
	private String ls_state;
}
