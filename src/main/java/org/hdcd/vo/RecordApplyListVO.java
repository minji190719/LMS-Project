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
public class RecordApplyListVO {
	private int rcrda_state;
	private int rcrda_record;
	private String rcrda_reason;
	private int rcrda_startyear;
	private int rcrda_startsemester;
	private int rcrda_endyear;
	private int rcrda_endsemester;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd")
	private Date rcrda_date;
	private String stu_dep;
	private int stu_schyear;
	private int stu_joinyear;
	private String smem_no;
	private String mem_name;
	private String mem_reg1;
	private String mem_tel;
	private String rcrda_reject;
}
