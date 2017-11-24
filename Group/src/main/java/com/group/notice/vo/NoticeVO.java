package com.group.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.group.board.common.utiletc;

public class NoticeVO {

	private String noticenum;
    private String title; 
    private String writer; 
    private String content; 
    private String regdate; 
    private String hit; 
    private String brddeleteflag; 
    private String filecnt;
    private String writerpos;
    private String departname;
    private String important;
    
    /* 첨부파일 */
    private List<MultipartFile> uploadfile;

    /**
     * 게시물 제목을 글자수에 맞추어 자르기.
     */
    public String getShortTitle(Integer len) {
        return utiletc.getShortString(title, len);
    }
    
    public String getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(String noticenum) {
		this.noticenum = noticenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	 public String getContent() {
	        return content.replaceAll("(?i)<script", "&lt;script");
	    }
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getBrddeleteflag() {
		return brddeleteflag;
	}
	public void setBrddeleteflag(String brddeleteflag) {
		this.brddeleteflag = brddeleteflag;
	}
	public String getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(String filecnt) {
		this.filecnt = filecnt;
	}
	public String getWriterpos() {
		return writerpos;
	}
	public void setWriterpos(String writerpos) {
		this.writerpos = writerpos;
	}
	public String getDepartname() {
		return departname;
	}
	public void setDepartname(String departname) {
		this.departname = departname;
	}
	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}
	

	
}
