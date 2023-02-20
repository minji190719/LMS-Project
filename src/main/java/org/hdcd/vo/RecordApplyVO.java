package org.hdcd.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecordApplyVO {
	private String rcrda_code;
	private String smem_no;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd")
	private Date rcrda_date;
	
	private int rcrda_state;
	private String rcrda_reason;
	private int rcrda_startyear;
	private int rcrda_endyear;
	private int rcrda_startsemester;
	private int rcrda_endsemester;
	private int rcrda_record;
	private String rcrda_start;
	private String rcrda_reject;
}
