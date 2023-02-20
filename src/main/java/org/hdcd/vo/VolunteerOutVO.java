package org.hdcd.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class VolunteerOutVO {
	private String volo_code;
	private String smem_no;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volo_start;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volo_end;
	
	private String volo_time;
	private String volo_company;
	private String volo_content;
	private int volo_state;
	private String volo_reject;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volo_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date volo_regidate;
	
	private int volo_semester;
	private int volo_year;
}
