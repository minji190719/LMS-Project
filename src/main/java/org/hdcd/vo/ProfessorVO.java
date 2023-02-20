package org.hdcd.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfessorVO {
	private String pmem_no;
	private String dep_code;
	private String join_date;
	private String leave_date;
	private String position;
	private int roomnum;
}
