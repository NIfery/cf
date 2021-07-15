package com.it.cf.chat.model;

import java.sql.Timestamp;

public class MessageReceiveVO {
	private int messageNo; /* 번호 */
	private String messageTitle; /* 제목 */
	private String messageContent; /* 내용 */
	private Timestamp messageRegdate; /* 작성일 */
}
