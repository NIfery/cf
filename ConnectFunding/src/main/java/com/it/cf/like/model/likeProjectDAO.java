package com.it.cf.like.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.fdList.model.FundingListVO;

@Mapper
public interface likeProjectDAO {

	int insertLikeProject(likeProjectVO likeprojectVo);
	List<Map<String, Object>> selectLikeView(int userNo);
	int deleteLike(int likeNo);
	int selecLikeCheck(int projectNo);
	List<Map<String, Object>> searchlikeprojectList(likeProjectVO likeprojectVo);
	int selectLikeListTotalRecord(likeProjectVO likeprojectVo);
	int deleteLikeByName(String projectName);
}
