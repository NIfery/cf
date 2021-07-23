package com.it.cf.common;

public interface ConstUtil {
	
	int BLOCK_SIZE=10;	// 블럭 크기
	int RECORD_COUNT=10; // 페이지당 레코드 개수

	String FILE_UPLOAD_TYPE ="FileUp";
	
	String FILE_UPLOAD_PATH="boardUpload";
	String FILE_UPLOAD_PATH_BOARD="C:\\Users\\Chung\\git\\cf\\ConnectFunding\\src\\main\\webapp\\boardUpload";
	
	int UPLOAD_FILE_FLAG =1;	//게시판 자료 업로드
	int UPLOAD_IMAGE_FLAG =2;	//이미지 업로드
}
