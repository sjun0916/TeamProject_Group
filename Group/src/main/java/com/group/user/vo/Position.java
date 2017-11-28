package com.group.user.vo;

//직급
public class Position {
	private int ptCode;
	private String ptName;
	
	public int getPtCode() {
		return ptCode;
	}

	public void setPtCode(int ptCode) {
		this.ptCode = ptCode;
	}
	
	public String getPtName() {
		return ptName;
	}
	
	public void setPtName(String ptName) {
		this.ptName = ptName;
	}

	@Override
	public String toString() {
		return "Position [ptCode=" + ptCode + ", ptName=" + ptName + "]";
	}
}