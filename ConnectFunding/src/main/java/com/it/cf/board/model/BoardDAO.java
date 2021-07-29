package com.it.cf.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.common.SearchVO;

@Mapper
public interface BoardDAO {
	int boardWrite(BoardVO vo);
	List<BoardVO> selectAll(SearchVO searchVo);
	int updateReadCount(int boardNo);
	BoardVO selectByNo(int boardNo);
	int updateDownCount(int boardNo);
	int TotalRecord(SearchVO searchVo);
	int EditBoard(BoardVO vo);
	int DeleteBoard(BoardVO vo);
}
