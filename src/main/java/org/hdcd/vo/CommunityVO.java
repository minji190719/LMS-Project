package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommunityVO {
	private String cmnt_category;
	private String cmnt_feeling;
	
	private String cmnt_no;
	private String smem_no;
	private String cmnt_title; 
	private String cmnt_content; 
	private String cmnt_date;
	private int cmnt_count;
	private int cmnt_like;
	private int cmnt_anony; 
	private String cmnt_report;
	
	private int reply_count; // db에 없음
	private String criteria_date;
}
