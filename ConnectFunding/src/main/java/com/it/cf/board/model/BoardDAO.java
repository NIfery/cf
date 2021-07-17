package com.it.cf.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int boardWrite(BoardVO vo);
	List<BoardVO> selectAll();
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateDownCount(int boardNo);
}
