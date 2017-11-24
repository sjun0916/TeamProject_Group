package com.group.board.vo;

public class BoardReplyVO {

    private String boardnum;
    private String renum;
    private String rewriter;
    private String redeleteflag;
    private String rememo;
    private String redate;
    private String rewriterpos;
    private int membernum;
    public String getBoardnum() {
        return boardnum;
    }
    
    public void setBoardnum(String boardnum) {
        this.boardnum = boardnum;
    }
    
    public String getRenum() {
        return renum;
    }
    
    public void setRenum(String renum) {
        this.renum = renum;
    }
    
    public String getRewriter() {
        return rewriter;
    }
    
    public void setRewriter(String rewriter) {
        this.rewriter = rewriter;
    }
    
    public String getRedeleteflag() {
        return redeleteflag;
    }
    
    public void setRedeleteflag(String redeleteflag) {
        this.redeleteflag = redeleteflag;
    }
    
    public String getRememo() {
        return rememo;
    }
    
    public void setRememo(String rememo) {
        this.rememo = rememo;
    }
    
    public String getRedate() {
        return redate;
    }
    
    public void setRedate(String redate) {
        this.redate = redate;
    }

	public String getRewriterpos() {
		return rewriterpos;
	}

	public void setRewriterpos(String rewriterpos) {
		this.rewriterpos = rewriterpos;
	}

	public int getMembernum() {
		return membernum;
	}

	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
    
}
