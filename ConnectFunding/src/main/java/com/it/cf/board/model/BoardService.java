package com.it.cf.board.model;

import java.util.List;

public interface BoardService {
	int boardWrite(BoardVO vo);
	List<BoardVO> selectAll();
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateDownCount(int boardNo);
}
