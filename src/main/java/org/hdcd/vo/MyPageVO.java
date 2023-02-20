package org.hdcd.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPageVO {
	private String smem_no;
	private String mem_name;
	private String mem_pass;
	private String col_code;
	private int stu_joinyear;
	private String dep_code;
	private String dep_name;
	private int stu_schyear;
	private int stu_semester;
	private String stu_dep;
	private String mem_reg1;
	private String mem_sex;
	private String stu_record;
	@Pattern(regexp="/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/", message = "휴대폰번호는 숫자만입력할수있습니다.")
	private String mem_tel;
	@Email
	private String mem_email;
	private String mem_postnum;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_bank;
	private String mem_depo;
	private String mem_banknum;
	private String col_name;
	private String mem_photopath;
}
