package com.it.cf.project.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectVO extends PageVO{
	private int projectNo; /* 프로젝트번호 */
	private String projectName; /* 프로젝트명 */
	private String projectSummary; /* 프로젝트요약 */
	private String projectContent; /* 프로젝트내용 */
	private String projectImage; /* 대표이미지 */
	private String projectFilename; /* 변경전파일명 */
	private int totalAmount; /* 목표금액 */
	private Timestamp projectStartdate; /* 등록일 */
	private Timestamp projectEnddate; /* 마감일 */
	private int userNo; /* 회원번호 */
	private int fundingNo; /* 투자금액번호 */
	private int secondCategoryNo;
	
	private int totalFundingAmount;
}
