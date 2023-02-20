package org.hdcd.vo;

import lombok.Data;

@Data
public class CalendarVO {
	private String mem_no;
	private String cldr_category;
	private String cldr_code;
	private String cldr_title;
	private String cldr_memo;
	private String cldr_start;
	private String cldr_end;
	private int cldr_allday;
	private String cldr_color;
}
