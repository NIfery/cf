package com.it.cf.like.model;

import java.util.List;
import java.util.Map;

public interface likeProjectService {
	
	int LIKE_NO=0;
	int LIKE_OK=1;
	
	int insertLikeProject(likeProjectVO likeprojectVo);
	List<Map<String, Object>> selectLikeView(int userNo);
	int deleteLike(int likeNo);
	int selecLikeCheck(int projectNo);
	List<Map<String, Object>> searchlikeprojectList(likeProjectVO likeprojectVo);
	int selectLikeListTotalRecord(likeProjectVO likeprojectVo);
}
