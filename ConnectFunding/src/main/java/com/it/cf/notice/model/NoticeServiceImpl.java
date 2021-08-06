package com.it.cf.notice.model;

import java.util.List;
import java.util.Map;

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
	public List<NoticeVO> selectNotice(NoticeVO noticeVo) {
		return noticeDao.selectNotice(noticeVo);
	}


	@Override public NoticeVO selectByNo(int noticeNo) {
		return noticeDao.selectByNo(noticeNo); }
	 
	@Override
	public Map<String, Object> selectByNoticeNo(NoticeVO noticeVo) {
		return noticeDao.selectByNoticeNo(noticeVo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	public int deleteNotice(NoticeVO noticeVo) {
		return noticeDao.deleteNotice(noticeVo);
	}

	@Override
	public int selectTotalCount(NoticeVO noticeVo) {
		return noticeDao.selectTotalCount(noticeVo);
	}

	@Override
	public List<NoticeVO> selectAll(NoticeVO noticeVo) {
		return noticeDao.selectAll(noticeVo);
	}

	@Override
	public int TotalCountByCate(String noticeCategory) {
		return noticeDao.TotalCountByCate(noticeCategory);
	}

}
