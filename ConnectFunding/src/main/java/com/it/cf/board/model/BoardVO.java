package com.it.cf.board.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardFilename;
	private String boardOldfilename;
	private Long boardFilesize;
	private int boardDowncount;
	private Timestamp boardRegdate;
	private int boardReadcount;
	private String userName;
	
	private int newImg;
	private String delFlag;
	private int CommentCount;
}
