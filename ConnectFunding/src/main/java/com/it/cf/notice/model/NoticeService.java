package com.it.cf.notice.model;

import java.util.List;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	List<NoticeVO> selectNotice(String noticeCategory);
	List<NoticeVO> selectEvent(String noticeCategory);
	List<NoticeVO> selectNews(String noticeCategory);
	NoticeVO selectByNoticeNo(int noticeNo);
	int updateNotice(NoticeVO noticeVo);
	int deleteNotice(int noticeNo);
}
