package com.group.approve.vo;

//문서
public class Document {
	private int docCode;
	private String docFileGroup;
	private String docFileName;
	private String docFilePath;
	private String docFileExtention;
	private String docFileOri;

	public int getDocCode() {
		
		return docCode;
	}

	public void setDocCode(int docCode) {
		
		this.docCode = docCode;
	}

	public String getDocFileName() {
		
		return docFileName;
	}

	public void setDocFileName(String docFileName) {
		
		this.docFileName = docFileName;
	}

	public String getDocFilePath() {
		
		return docFilePath;
	}

	public void setDocFilePath(String docFilePath) {
		
		this.docFilePath = docFilePath;
	}

	public String getDocFileExtention() {
		
		return docFileExtention;
	}

	public void setDocFileExtention(String docFileExtention) {
		
		this.docFileExtention = docFileExtention;
	}

	public String getDocFileOri() {
		
		return docFileOri;
	}

	public void setDocFileOri(String docFileOri) {
		
		this.docFileOri = docFileOri;
	}

	public String getDocFileGroup() {
		
		return docFileGroup;
	}

	public void setDocFileGroup(String docFileGroup) {
		
		this.docFileGroup = docFileGroup;
	}

	@Override
	public String toString() {
		
		return "Document [docCode=" + docCode + ", docFileGroup=" + docFileGroup + ", docFileName=" + docFileName
				+ ", docFilePath=" + docFilePath + ", docFileExtention=" + docFileExtention + ", docFileOri="
				+ docFileOri + "]";
	}
}