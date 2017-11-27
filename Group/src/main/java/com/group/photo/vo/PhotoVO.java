package com.group.photo.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.group.board.common.utiletc;

public class PhotoVO {

	private String photonum;
    private String title; 
    private String writer; 
    private String regdate; 
    private String brddeleteflag; 
    private String filecnt;
    private String writerpos;
    private String departname;
 
    
    /* 첨부파일 */
    private List<MultipartFile> uploadfile;

    /**
     * 게시물 제목을 글자수에 맞추어 자르기.
     */
    public String getShortTitle(Integer len) {
        return utiletc.getShortString(title, len);
    }
    
    public String getPhotonum() {
		return photonum;
	}
	public void setPhotonum(String photonum) {
		this.photonum = photonum;
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

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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


	

	
}
