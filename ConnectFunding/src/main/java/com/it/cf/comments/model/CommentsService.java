package com.it.cf.comments.model;

import java.util.List;

public interface CommentsService {
	List<CommentsVO> selectCommentsList(int BoardNo);
	int CommentsWrite(CommentsVO vo);
	int CommentsUpdate(CommentsVO vo);
	int CommentsDelete(int CommentNo);
	int CommentsCount(int BoardNo);
	int CommentsReply(CommentsVO vo);
}
