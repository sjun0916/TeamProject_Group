package com.group.approval.vo;

//진행
public class Progress {
	private int proCode;
	private int dftCode;
	private String proTime;
	private String proReason;
	private int proState;
	private boolean proPersonState;
	private int proTurn;
	private String proRealTime;

	private String dftTitle;
	private String dftDate;
	private int proApproval;
	private int mmCode;

	public int getMmCode() {
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public int getDftCode() {
		return dftCode;
	}

	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
	}

	public String getProTime() {
		return proTime;
	}

	public void setProTime(String proTime) {
		this.proTime = proTime;
	}

	public String getProReason() {
		return proReason;
	}

	public void setProReason(String proReason) {
		this.proReason = proReason;
	}

	public int getProState() {
		return proState;
	}

	public void setProState(int proState) {
		this.proState = proState;
	}

	public boolean isProPersonState() {
		return proPersonState;
	}

	public void setProPersonState(boolean proPersonState) {
		this.proPersonState = proPersonState;
	}

	public int getProTurn() {
		return proTurn;
	}

	public void setProTurn(int proTurn) {
		this.proTurn = proTurn;
	}

	public String getProRealTime() {
		return proRealTime;
	}

	public void setProRealTime(String proRealTime) {
		this.proRealTime = proRealTime;
	}

	public String getDftTitle() {
		return dftTitle;
	}

	public void setDftTitle(String dftTitle) {
		this.dftTitle = dftTitle;
	}

	public String getDftDate() {
		return dftDate;
	}

	public void setDftDate(String dftDate) {
		this.dftDate = dftDate;
	}

	public int getProApproval() {
		return proApproval;
	}

	public void setProApproval(int proApproval) {
		this.proApproval = proApproval;
	}

	@Override
	public String toString() {
		return "Progress [proCode=" + proCode + ", dftCode=" + dftCode + ", proTime=" + proTime + ", proReason="
				+ proReason + ", proState=" + proState + ", proPersonState=" + proPersonState + ", proTurn=" + proTurn
				+ ", proRealTime=" + proRealTime + ", dftTitle=" + dftTitle + ", dftDate=" + dftDate + ", proApproval="
				+ proApproval + ", mmCode=" + mmCode + "]";
	}
}