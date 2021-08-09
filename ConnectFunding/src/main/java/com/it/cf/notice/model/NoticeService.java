package com.it.cf.notice.model;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	List<NoticeVO> selectNotice(NoticeVO noticeVo);
	List<NoticeVO> selectAll(NoticeVO noticeVo);
	NoticeVO selectByNo(int noticeNo);
	Map<String, Object> selectByNoticeNo(NoticeVO noticeVo);
	int updateNotice(NoticeVO noticeVo);
	int deleteNotice(NoticeVO noticeVo);
	int selectTotalCount(NoticeVO noticeVo);
	int TotalCountByCate(String noticeCategory);
}