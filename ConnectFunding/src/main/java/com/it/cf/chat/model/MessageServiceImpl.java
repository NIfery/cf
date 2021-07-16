package com.it.cf.chat.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private final MessageDAO messageDao;

	@Override
	public int insertChat(MessageSendVO vo) {
		return messageDao.insertChat(vo);
	}

	@Override
	public List<MessageSendVO> sentAll(int userNo) {
		return messageDao.sentAll(userNo);
	}

	@Override
	public int deleteChat(int messageNo) {
		return messageDao.deleteChat(messageNo);
	}

	
}
