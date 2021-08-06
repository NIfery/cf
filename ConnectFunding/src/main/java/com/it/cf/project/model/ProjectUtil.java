package com.it.cf.project.model;

public interface ProjectUtil {
	//페이징 처리 관련 상수
	public static final int BLOCK_SIZE = 10;  //블럭 크기
	int RECORD_COUNT = 8; //한 페이지에 보여줄 레코드 개수

	
	//파일 업로드 처리 관련 상수 
	String FILE_UPLOAD_TYPE = "test"; 
	//String FILE_UPLOAD_TYPE = "deploy";
	
	
	//관리자 페이지 - 상품 등록 시 상품 이미지 저장 경로 
	String IMAGE_FILE_UPLOAD_PATH = "projectImg";
	String IMAGE_FILE_UPLOAD_PATH_TEST =
	//"E:\\팀프로젝트-2차\\git\\cf\\ConnectFunding\\src\\main\\webapp\\project_assets\\projectImg";
	"D:\\팀프로젝트-2차\\git\\cf\\ConnectFunding\\src\\main\\webapp\\project_assets\\projectImg";

	int UPLOAD_IMAGE_FLAG = 1; //상품 등록 시 이미지 업로드
}