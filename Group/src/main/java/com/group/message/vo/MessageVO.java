package com.group.message.vo;

import org.apache.ibatis.type.Alias;

import com.group.user.vo.UserVO;

@Alias("messageVO")
public class MessageVO extends UserVO{
	private int senderemployeeNo;
	private String receiverEmail;
	private String message;
	private int receiverEmployeeNo;
	private int senderEmployeeNo;
	private String messageContent;
	private String writeDate;
	private int sender;
	private String messageId;
	
	public int getSenderemployeeNo() {
		return senderemployeeNo;
	}
	public void setSenderemployeeNo(int senderemployeeNo) {
		this.senderemployeeNo = senderemployeeNo;
	}
	public String getReceiverEmail() {
		return receiverEmail;
	}
	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getReceiverEmployeeNo() {
		return receiverEmployeeNo;
	}
	public void setReceiverEmployeeNo(int receiverEmployeeNo) {
		this.receiverEmployeeNo = receiverEmployeeNo;
	}
	public int getSenderEmployeeNo() {
		return senderEmployeeNo;
	}
	public void setSenderEmployeeNo(int senderEmployeeNo) {
		this.senderEmployeeNo = senderEmployeeNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	

	
	
}
