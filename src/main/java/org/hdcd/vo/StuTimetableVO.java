package org.hdcd.vo;

import lombok.Data;

@Data
public class StuTimetableVO {
	private String st_code;
	private String smem_no;
	private String lec_code;
	private String st_day1;
	private String st_starttime1;
	private String st_endtime1;
	private String st_day2;
	private String st_starttime2;
	private String st_endtime2;
	private int st_year;
	private int st_semester;
}
