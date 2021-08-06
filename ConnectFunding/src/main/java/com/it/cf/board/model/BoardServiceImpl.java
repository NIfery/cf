package com.it.cf.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.cf.common.SearchVO;

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
	public List<BoardVO> selectAll(SearchVO searchVo) {
		return boardDao.selectAll(searchVo);
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

	@Override
	public int TotalRecord(SearchVO searchVo) {
		return boardDao.TotalRecord(searchVo);
	}

	@Override
	public int EditBoard(BoardVO vo) {
		return boardDao.EditBoard(vo);
	}

	@Override
	public int DeleteBoard(BoardVO vo) {
		return boardDao.DeleteBoard(vo);
	}

	@Override
	public BoardVO SelectNextAndPre(int boardNo) {
		return boardDao.SelectNextAndPre(boardNo);
	}

	@Override
	public List<Map<Object, Object>> UserBoard(SearchVO searchVO) {
		return boardDao.UserBoard(searchVO);
	}

	@Override
	public int TotalRecord2(SearchVO searchVo) {
		return boardDao.TotalRecord2(searchVo);
	}

}
