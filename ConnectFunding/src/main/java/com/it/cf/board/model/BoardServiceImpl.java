package com.it.cf.board.model;

import java.util.List;

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

	@Override
	public List<BoardVO> selectAll() {
		return boardDao.selectAll();
	}

	@Override
	public int updateReadCount(int boardNo) {
		return boardDao.updateReadCount(boardNo);
	}

	@Override
	public BoardVO selectByNo(int boardNo) {
		return boardDao.selectByNo(boardNo);
	}

	@Override
	public int updateDownCount(int boardNo) {
		return boardDao.updateDownCount(boardNo);
	}

}
