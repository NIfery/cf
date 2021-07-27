package com.it.cf.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MessageDAO {
	int insertChat(MessageSendVO vo);
	int insertAdmin(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVOChat searchVo);
	List<MessageReceiveVO> receiveAll(SearchVOChat searchVo);
	int deleteChat(int messageNo);
	int deleteReceive(int messageNo);
	int sentCount(SearchVOChat searchVo);
	int receiveCount(SearchVOChat searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editAdmin(MessageReceiveVO vo);
	List<MessageSendVO> receiveAdmin(SearchVOChat searchVo);
	List<MessageReceiveVO> sentAdmin(SearchVOChat searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVOChat searchVo);
}
