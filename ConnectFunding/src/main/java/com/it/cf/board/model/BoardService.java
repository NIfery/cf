package com.it.cf.board.model;

import java.util.List;
import java.util.Map;

import com.it.cf.common.SearchVO;

public interface BoardService {
	int boardWrite(BoardVO vo);
	List<BoardVO> selectAll(SearchVO searchVo);
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateDownCount(int boardNo);
	int TotalRecord(SearchVO searchVo);
	int EditBoard(BoardVO vo);
	int DeleteBoard(BoardVO vo);
	BoardVO SelectNextAndPre(int boardNo);
	List<Map<Object, Object>> UserBoard(SearchVO searchVO);
	int TotalRecord2(SearchVO saerchVo);
}
