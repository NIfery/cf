package com.it.cf.common;

public interface AdminConstUtil {
	
	//페이징 처리관련 상수
	int BLOCK_SIZE=5;	// 블럭 크기
	int RECORD_COUNT=5; // 페이지당 레코드 개수
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE ="FileUp";
	
	//게시판 - 파일 저장 경로
	String FILE_UPLOAD_PATH="boardUpload";
	String FILE_UPLOAD_PATH_BOARD="C:\\Users\\Chung\\git\\cf\\ConnectFunding\\src\\main\\webapp\\boardUpload";
	
	//업로드 자료 형태
	int UPLOAD_FILE_FLAG =1;	//게시판 자료 업로드
	int UPLOAD_IMAGE_FLAG =2;	//이미지 업로드
}
