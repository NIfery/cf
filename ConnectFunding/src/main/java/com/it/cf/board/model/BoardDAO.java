package com.it.cf.board.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int boardWrite(BoardVO vo);
}
