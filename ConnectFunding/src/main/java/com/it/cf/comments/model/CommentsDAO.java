package com.it.cf.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	List<CommentsVO> selectCommentsList(int BoardNo);
	int CommentsWrite(CommentsVO vo);
	int CommentsUpdate(CommentsVO vo);
	int CommentsDelete(int CommentNo);
	List<Map<Object, Object>> CommentsCount();
	int CommentsReply(CommentsVO vo);
	int UpdateSortNo(CommentsVO vo);
	List<Map<Object, Object>> ShowProfileImg();
	int UserCommentsCount(String userNickName);
}
