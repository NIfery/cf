package com.it.cf.project.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 검색 정보를 담고있는 Bean
 * 페이징 처리 관련 변수 포함
*/

@Getter
@Setter
@ToString
public class PageVO {
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
    /**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize;
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
}
 