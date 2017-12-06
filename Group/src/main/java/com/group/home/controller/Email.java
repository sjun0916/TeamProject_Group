package com.group.home.controller;
/*
 * 사원번호 및 비밀번호 찾기
 * 메일 전송 VO
 */
public class Email {
	 
    private String subject;
    private String content;
    private String receiver;
     
    public String getReceiver() {
        return receiver;
    }
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
 
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    @Override
    public String toString() {
        return "Email [subject=" + subject + ", content=" + content + ", receiver=" + receiver + "]";
    }
}
