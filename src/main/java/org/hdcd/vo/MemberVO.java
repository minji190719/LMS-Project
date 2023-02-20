package org.hdcd.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String mem_no;
	private String mem_pass;
	private String mem_name;
	private String mem_tel;
	private String mem_sex;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_email;
	private String mem_reg1;
	private String mem_reg2;
	private String mem_bank;
	private String mem_depo;
	private String mem_banknum;
	private String mem_photonm;
	private String mem_postnum;
	private List<MemberAuthVO> authList;
	private int popup_reject;
	private int surv_reject;
	private String mem_photopath;
	private String mem_portlet;
}
