package com.it.cf.common;

public interface ConstUtil {
	
	int BLOCK_SIZE=10;	// 블럭 크기
	int RECORD_COUNT=10; // 페이지당 레코드 개수
	
	//파일 업로드 처리 관련 상수

	String FILE_UPLOAD_TYPE ="FileUp";
	
	String FILE_UPLOAD_PATH="boardUpload";
	String FILE_UPLOAD_PATH_BOARD="C:\\Users\\Chung\\git\\cf\\ConnectFunding\\src\\main\\webapp\\boardUpload";
	
	//프로필 사진 업로드
	String PROFILE_FILE_UPLOAD_PATH="profile_img";
	String PROFILE_FILE_UPLOAD_INFO="C:\\Users\\hsee0\\OneDrive\\문서\\Git\\cf\\ConnectFunding\\src\\main\\webapp\\profile_img";
	
	//업로드 자료 형태
	int UPLOAD_FILE_FLAG =1;	//게시판 자료 업로드
	int UPLOAD_IMAGE_FLAG =2;	//이미지 업로드
	int UPLOAD_PROFILE_FLAG =3;	//이미지 업로드
}
