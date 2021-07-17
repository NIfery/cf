package com.it.cf.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDAO {
	int insertChat(MessageSendVO vo);
	List<MessageSendVO> sentAll(int userNo);
	int deleteChat(int messageNo);
	int sentCount(int userNo);
	int receiveCount(int userNo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	List<MessageSendVO> receiveAdmin();
}
