package com.it.cf.board.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDAO boardDao;
	
	@Override
	public int boardWrite(BoardVO vo) {
		return boardDao.boardWrite(vo);
	}

}
