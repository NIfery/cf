package com.it.cf.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.common.SearchVO;


@Mapper
public interface MessageDAO {
	int insertChat(MessageSendVO vo);
	int insertAdmin(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(int userNo);
	List<MessageReceiveVO> receiveAll(int userNo);
	int deleteChat(int messageNo);
	int deleteReceive(int messageNo);
	int sentCount(int userNo);
	int receiveCount(int userNo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editAdmin(MessageReceiveVO vo);
	List<MessageSendVO> receiveAdmin(SearchVO searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVO searchVo);
}
