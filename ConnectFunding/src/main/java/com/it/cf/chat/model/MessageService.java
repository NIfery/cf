package com.it.cf.chat.model;

import java.util.List;

public interface MessageService {
	int insertChat(MessageSendVO vo);
	List<MessageSendVO> sentAll(int userNo);
	int deleteChat(int messageNo);
}
