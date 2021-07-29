package com.it.cf.comments.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	List<CommentsVO> selectCommentsList(int BoardNo);
	int CommentsWrite(CommentsVO vo);
	int CommentsUpdate(CommentsVO vo);
	int CommentsDelete(int CommentNo);
	int CommentsCount(int BoardNo);
	int CommentsReply(CommentsVO vo);
	int UpdateSortNo(CommentsVO vo);
}
