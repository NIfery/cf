package com.it.cf.question.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QuestionVO {
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private char questionFlag;
	private Timestamp questionRegdate;
	private int userNo;
	private int projectNo;
}
