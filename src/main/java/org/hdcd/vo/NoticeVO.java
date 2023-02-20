package org.hdcd.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private String notice_no;
	private String mmem_no;
	private String notice_title;
	private String notice_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd")
	private Date notice_date;
	private int notice_count;
	private String notice_category;
	private List<NoticeFileVO> noticeFileList;
}
