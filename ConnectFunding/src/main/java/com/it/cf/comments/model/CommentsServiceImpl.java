package com.it.cf.comments.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.cf.common.SearchVO;

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
	@Transactional
	public int CommentsReply(CommentsVO vo) {
		int cnt =  CommentsDao.UpdateSortNo(vo);
		cnt = CommentsDao.CommentsReply(vo);
		return cnt;
	}

	
	  @Override public List<Map<Object, Object>> CommentsCount() {
	  return CommentsDao.CommentsCount();
	  }

	@Override
	public List<Map<Object, Object>> ShowProfileImg() {
		return CommentsDao.ShowProfileImg();
	}
	 


	


}
