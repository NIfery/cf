package com.it.cf.comments.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentsVO {
	private int CommentNo;/* 댓글번호 */
	private String CommentContent;/* 내용 */
	private Timestamp CommentRegdate; /* 작성일 */
	private int CommentGroupNo; /* 그룹 */
	private int CommentStep; /* 스텝 */
	private int CommentSortNo; /* 정렬 */
	private String CommentDelflag; /* 삭제여부 */
	private int BoardNo; /* 게시글번호 */
	private String userNickName;/* 회원닉네임 */
}
