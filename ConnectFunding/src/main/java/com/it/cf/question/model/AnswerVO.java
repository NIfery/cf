package com.it.cf.question.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AnswerVO {
	private int answerNo;
	private String answerContent;
	private Timestamp answerRegdate;
	private int questionNo;
}
