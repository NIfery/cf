package com.it.cf.like.model;

import java.util.List;
import java.util.Map;

public interface likeProjectService {
	
	int insertLikeProject(likeProjectVO likeprojectVo);
	List<Map<String, Object>> selectLikeView(int userNo);
	int deleteLike(int likeNo);
}
