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

	@Override
	public int sentCount(int userNo) {
		return messageDao.sentCount(userNo);
	}

	@Override
	public int receiveCount(int userNo) {
		return messageDao.receiveCount(userNo);
	}

	@Override
	public MessageSendVO sentByMessageNo(int messageNo) {
		return messageDao.sentByMessageNo(messageNo);
	}

	@Override
	public int editMessage(MessageSendVO vo) {
		return messageDao.editMessage(vo);
	}

	@Override
	public List<MessageSendVO> receiveAdmin() {
		return messageDao.receiveAdmin();
	}

	@Override
	public MessageReceiveVO receiveByMessageNo(int messageNo) {
		return messageDao.receiveByMessageNo(messageNo);
	}

	@Override
	public int insertAdmin(MessageReceiveVO vo) {
		return messageDao.insertAdmin(vo);
	}

	
}
