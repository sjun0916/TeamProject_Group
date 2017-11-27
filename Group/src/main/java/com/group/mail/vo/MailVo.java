package com.group.mail.vo;

import java.sql.Timestamp;

public class MailVo {
	
	private int mailNum;
	private String senderMail;
	private String receiverMail;
	private String title;
	private String content;
	private Timestamp regdate;
	
	private String mailID;
	private String mailPW;
	
	public int getMailNum() {
		return mailNum;
	}
	public void setMailNum(int mailNum) {
		this.mailNum = mailNum;
	}
	public String getSenderMail() {
		return senderMail;
	}
	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}
	public String getReceiverMail() {
		return receiverMail;
	}
	public void setReceiverMail(String receiverMail) {
		this.receiverMail = receiverMail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	public String getMailID() {
		return mailID;
	}
	public void setMailID(String mailID) {
		this.mailID = mailID;
	}
	public String getMailPW() {
		return mailPW;
	}
	public void setMailPW(String mailPW) {
		this.mailPW = mailPW;
	}
	
	public String toString() {
		return "MailVo [mailID=" + mailID + ", mailPW=" + mailPW + "]";
	}
}
