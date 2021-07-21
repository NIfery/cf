package com.it.cf.chat.model;

import java.util.List;

public interface MessageService {
	int insertChat(MessageSendVO vo);
	int insertAdmin(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(int userNo);
	List<MessageReceiveVO> receiveAll(int userNo);
	int deleteChat(int messageNo);
	int deleteReceive(int messageNo);
	int deleteMessageMulti(List<MessageSendVO> list);
	int sentCount(int userNo);
	int receiveCount(int userNo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editAdmin(MessageReceiveVO vo);
	List<MessageSendVO> receiveAdmin();
	MessageReceiveVO receiveByMessageNo(int messageNo);
	
}
