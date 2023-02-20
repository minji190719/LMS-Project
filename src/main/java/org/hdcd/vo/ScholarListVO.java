package org.hdcd.vo;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholarListVO {
	private String schl_number;
	
	private String schl_code;
	private String schl_name;
	private int schl_price;
	private String schl_start;
	private String schl_end;
	private String schl_target;
	private String schl_document;
	private List<ScholarApplyVO> scholarApplyList;
}
