package org.hdcd.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecOpenListVO {
	private String lol_code;
	private String pmem_no;
	private String lol_name;
	private String lol_date;
	private int lol_state;
	private int lol_limit;
	private int lol_credit;
	private int lol_schyear;
	private String major_cultural;
	private String choice_require;
	private int lol_year;
	private int lol_semester;
	private int lol_saved;
	private int lol_daycount;
	private String lol_day1;
	private String lol_startime1;
	private String lol_endtime1;
	private String lol_day2;
	private String lol_startime2;
	private String lol_endtime2;
	private String lol_reject;
	private String dep_name;
	private String lec_state;
	private int lol_studentnum;
}
