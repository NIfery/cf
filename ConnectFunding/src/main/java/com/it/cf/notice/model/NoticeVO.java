package com.it.cf.notice.model;

import java.sql.Timestamp;

import com.it.cf.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO extends SearchVO {

	private int noticeNo;
	private int adminNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCategory;
	private String noticeFilename;
	private String noticeOldfilename;
	private Timestamp noticeRegdate;
	private int noticeCount;
	private Timestamp endday;
}