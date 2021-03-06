package com.it.cf.chat.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private static final Logger logger=LoggerFactory.getLogger(MessageServiceImpl.class);
	private final MessageDAO messageDao;

	@Override
	public int insertChat(MessageSendVO vo) {
		return messageDao.insertChat(vo);
	}

	@Override
	public List<MessageSendVO> sentAll(SearchVOChat searchVo) {
		return messageDao.sentAll(searchVo);
	}

	@Override
	public int deleteChat(int messageNo) {
		return messageDao.deleteChat(messageNo);
	}

	@Override
	public int sentCount(SearchVOChat searchVo) {
		return messageDao.sentCount(searchVo);
	}

	@Override
	public int receiveCount(SearchVOChat searchVo) {
		return messageDao.receiveCount(searchVo);
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
	public MessageReceiveVO receiveByMessageNo(int messageNo) {
		return messageDao.receiveByMessageNo(messageNo);
	}

	@Override
	public int insertAdmin(MessageReceiveVO vo) {
		return messageDao.insertAdmin(vo);
	}

	@Override
	public int deleteReceive(int messageNo) {
		return messageDao.deleteReceive(messageNo);
	}

	@Override
	@Transactional
	public int deleteMessageMulti(List<MessageSendVO> list) {
		logger.info("deleteMessageMulti list.size={}",list.size());
		int cnt=0;
		try {
			for(MessageSendVO vo : list) {
				int messageNo=vo.getMessageNo();
				logger.info("deleteMessageMulti messageNo={}",messageNo);
				if(messageNo!=0) {  //체크한 상품만 삭제
					logger.info("deleteMessageMulti, messageNo={}",messageNo);
					cnt=messageDao.deleteReceive(messageNo);
					cnt=messageDao.deleteChat(messageNo);
					logger.info("deleteMessageMulti cnt={}",cnt);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		logger.info("cnt={}",cnt);
		return cnt;
	}

	@Override
	public List<MessageReceiveVO> receiveAll(SearchVOChat searchVo) {
		return messageDao.receiveAll(searchVo);
	}

	@Override
	public int editAdmin(MessageReceiveVO vo) {
		return messageDao.editAdmin(vo);
	}

	@Override
	public List<MessageSendVO> receiveAdmin(SearchVOChat searchVo) {
		return messageDao.receiveAdmin(searchVo);
	}

	@Override
	public int totalReceive(SearchVOChat searchVo) {
		return messageDao.totalReceive(searchVo);
	}

	@Override
	public List<MessageReceiveVO> sentAdmin(SearchVOChat searchVo) {
		return messageDao.sentAdmin(searchVo);
	}

	
}
