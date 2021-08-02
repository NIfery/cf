package com.it.cf.notice.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeDAO noticeDao;

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	@Override
	public List<NoticeVO> selectNotice(String noticeCategory) {
		return noticeDao.selectNotice(noticeCategory);
	}

	@Override
	public List<NoticeVO> selectEvent(String noticeCategory) {
		return noticeDao.selectEvent(noticeCategory);
	}

	@Override
	public List<NoticeVO> selectNews(String noticeCategory) {
		return noticeDao.selectNews(noticeCategory);
	}

	@Override
	public NoticeVO selectByNoticeNo(int noticeNo) {
		return noticeDao.selectByNoticeNo(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}
}
