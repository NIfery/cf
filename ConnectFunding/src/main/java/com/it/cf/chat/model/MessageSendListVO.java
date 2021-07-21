package com.it.cf.chat.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageSendListVO {
	private List<MessageSendVO> sMessage;
	private List<MessageReceiveVO> rMessage;
}
