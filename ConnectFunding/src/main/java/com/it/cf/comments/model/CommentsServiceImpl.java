package com.it.cf.comments.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService {
	
	private final CommentsDAO CommentsDao;

	@Override
	public List<CommentsVO> selectCommentsList(int BoardNo) {
		return CommentsDao.selectCommentsList(BoardNo);
	}

	@Override
	public int CommentsWrite(CommentsVO vo) {
		return CommentsDao.CommentsWrite(vo);
	}

	@Override
	public int CommentsUpdate(CommentsVO vo) {
		return CommentsDao.CommentsUpdate(vo);
	}

	@Override
	public int CommentsDelete(int CommentNo) {
		return CommentsDao.CommentsDelete(CommentNo);
	}

	@Override
	public int CommentsCount(int BoardNo) {
		return CommentsDao.CommentsCount(BoardNo);
	}

	@Override
	@Transactional
	public int CommentsReply(CommentsVO vo) {
		int cnt =  CommentsDao.UpdateSortNo(vo);
		cnt = CommentsDao.CommentsReply(vo);
		return cnt;
	}
	


}
