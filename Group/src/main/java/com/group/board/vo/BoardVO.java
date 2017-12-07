package com.group.board.vo;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.group.board.common.utiletc;

public class BoardVO {

    private String boardnum;
    private String title; 
    private String writer; 
    private String content; 
    private String regdate; 
    private String hit; 
    private String brddeleteflag; //글삭제여부
    private String filecnt;
    private String replycnt;
    private String writerpos;
    private String departname;
    private int membernum; //작성자 사원번호
    
    /* 첨부파일 */
    private List<MultipartFile> uploadfile;

    /**
     * 게시물 제목을 글자수에 맞추어 자르기.
     */
    public String getShortTitle(Integer len) {
        return utiletc.getShortString(title, len);
    }
    
    public String getBoardnum() {
        return boardnum;
    }

    public void setBoardnum(String boardnum) {
        this.boardnum = boardnum;
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

    public List<MultipartFile> getUploadfile() {
        return uploadfile;
    }

    public void setUploadfile(List<MultipartFile> uploadfile) {
        this.uploadfile = uploadfile;
    }

    public String getFilecnt() {
        return filecnt;
    }

    public void setFilecnt(String filecnt) {
        this.filecnt = filecnt;
    }

    public String getReplycnt() {
        return replycnt;
    }

    public void setReplycnt(String replycnt) {
        this.replycnt = replycnt;
    }



	public String getDepartname() {
		return departname;
	}

	public void setDepartname(String departname) {
		this.departname = departname;
	}

	public String getWriterpos() {
		return writerpos;
	}

	public void setWriterpos(String writerpos) {
		this.writerpos = writerpos;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
    
}
