package com.group.approval.vo;

//결재라인
public class Approval {
	private int aprCode;
	private int mmCode;
	private int aprApproval1;
	private int aprApproval2;
	private int aprApproval3;
	
	//view
	private String aprName1;
	private String aprName2;
	private String aprName3;
	
	
	public int getAprCode() {
		
		return aprCode;
	}
	
	public void setAprCode(int aprCode) {
		
		this.aprCode = aprCode;
	}

	public int getMmCode() {
		
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		
		this.mmCode = mmCode;
	}
	
	public int getAprApproval1() {
		
		return aprApproval1;
	}
	
	public void setAprApproval1(int aprApproval1) {
		
		this.aprApproval1 = aprApproval1;
	}

	public int getAprApproval2() {
		
		return aprApproval2;
	}

	public void setAprApproval2(int aprApproval2) {
		
		this.aprApproval2 = aprApproval2;
	}
	
	public int getAprApproval3() {
		
		return aprApproval3;
	}
	
	public void setAprApproval3(int aprApproval3) {
		
		this.aprApproval3 = aprApproval3;
	}
	
	// view
	public String getAprName1() {
		
		return aprName1;
	}

	public void setAprName1(String aprName1) {
		
		this.aprName1 = aprName1;
	}

	public String getAprName2() {
		
		return aprName2;
	}

	public void setAprName2(String aprName2) {
		
		this.aprName2 = aprName2;
	}

	public String getAprName3() {
		
		return aprName3;
	}

	public void setAprName3(String aprName3) {
		
		this.aprName3 = aprName3;
	}

	@Override
	public String toString() {
		
		return "Approval [aprCode=" + aprCode + ", mmCode=" + mmCode + ", aprApproval1=" + aprApproval1
				+ ", aprApproval2=" + aprApproval2 + ", aprApproval3=" + aprApproval3 + ", aprName1=" + aprName1
				+ ", aprName2=" + aprName2 + ", aprName3=" + aprName3 + "]";
	}
}