package com.it.cf.notice.model;

public interface NoticeUtil {
	
	//페이징 처리 관련 상수
	int BLOCK_SIZE = 5;  //블럭 크기
	int RECORD_COUNT = 5; //한 페이지에 보여줄 레코드 개수
	
	//파일 업로드 처리 상수
	String FILE_UPLOAD_TYPE = "test";
	
	//공지사항 관련 이미지 저장
	String IMAGE_FILE_UPLOAD_PATH = "noticeImg";
	String IMAGE_FILE_UPLOAD_PATH_TEST =
	"C:\\Users\\hsee0\\OneDrive\\문서\\Git\\cf\\ConnectFunding\\src\\main\\webapp\\project_assets\\noticeImg";

	int UPLOAD_IMAGE_FLAG = 1;
}
