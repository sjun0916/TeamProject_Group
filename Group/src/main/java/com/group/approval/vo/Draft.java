package com.group.approval.vo;

//기안
public class Draft {
	private int dftCode;
	private int aprCode;
	private int docCode;
	private int mmCode;
	private String dftTitle;
	private int dftDegree;
	private String dftDate;
	private int aprApproval1;
	private int aprApproval2;
	private int aprApproval3;
	private String dftFinalState;
	private String dftCheck;
	private String dftFileOri;
	private String dftFilePath;
	private String dftContent;

	// ----- view
	private int proApproval;
	private String proApprovalName;
	private String proReason;
	private String proRealTime;
	private String url;
	private String docFileGroup;
	private int proState;
	private String dpName;
	private String ptName;
	private String mmName;
	private String pDpName;
	private String pPtName;
	private String pMmName;

	public int getDftCode() {
		return dftCode;
	}

	public void setDftCode(int dftCode) {
		this.dftCode = dftCode;
	}

	public int getAprCode() {
		return aprCode;
	}

	public void setAprCode(int aprCode) {
		this.aprCode = aprCode;
	}

	public int getDocCode() {
		return docCode;
	}

	public void setDocCode(int docCode) {
		this.docCode = docCode;
	}

	public int getMmCode() {
		return mmCode;
	}

	public void setMmCode(int mmCode) {
		this.mmCode = mmCode;
	}

	public String getDftTitle() {
		return dftTitle;
	}

	public void setDftTitle(String dftTitle) {
		this.dftTitle = dftTitle;
	}

	public int getDftDegree() {
		return dftDegree;
	}

	public void setDftDegree(int dftDegree) {
		this.dftDegree = dftDegree;
	}

	public String getDftDate() {
		return dftDate;
	}

	public void setDftDate(String dftDate) {
		this.dftDate = dftDate;
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

	public String getDftFinalState() {
		return dftFinalState;
	}

	public void setDftFinalState(String dftFinalState) {
		this.dftFinalState = dftFinalState;
	}

	public String getDftCheck() {
		return dftCheck;
	}

	public void setDftCheck(String dftCheck) {
		this.dftCheck = dftCheck;
	}

	public String getDftFileOri() {
		return dftFileOri;
	}

	public void setDftFileOri(String dftFileOri) {
		this.dftFileOri = dftFileOri;
	}

	public String getDftFilePath() {
		return dftFilePath;
	}

	public void setDftFilePath(String dftFilePath) {
		this.dftFilePath = dftFilePath;
	}

	public String getDftContent() {
		return dftContent;
	}

	public void setDftContent(String dftContent) {
		this.dftContent = dftContent;
	}

	public int getProApproval() {
		return proApproval;
	}

	public void setProApproval(int proApproval) {
		this.proApproval = proApproval;
	}

	public String getProApprovalName() {
		return proApprovalName;
	}

	public void setProApprovalName(String proApprovalName) {
		this.proApprovalName = proApprovalName;
	}

	public String getProReason() {
		return proReason;
	}

	public void setProReason(String proReason) {
		this.proReason = proReason;
	}

	public String getProRealTime() {
		return proRealTime;
	}

	public void setProRealTime(String proRealTime) {
		this.proRealTime = proRealTime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDocFileGroup() {
		return docFileGroup;
	}

	public void setDocFileGroup(String docFileGroup) {
		this.docFileGroup = docFileGroup;
	}

	public String getDpName() {
		return dpName;
	}

	public void setDpName(String dpName) {
		this.dpName = dpName;
	}

	public String getPtName() {
		return ptName;
	}

	public void setPtName(String ptName) {
		this.ptName = ptName;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getpDpName() {
		return pDpName;
	}

	public void setpDpName(String pDpName) {
		this.pDpName = pDpName;
	}

	public String getpPtName() {
		return pPtName;
	}

	public void setpPtName(String pPtName) {
		this.pPtName = pPtName;
	}

	public String getpMmName() {
		return pMmName;
	}

	public void setpMmName(String pMmName) {
		this.pMmName = pMmName;
	}

	public int getProState() {
		return proState;
	}

	public void setProState(int proState) {
		this.proState = proState;
	}

	@Override
	public String toString() {
		return "Draft [dftCode=" + dftCode + ", aprCode=" + aprCode + ", docCode=" + docCode + ", mmCode=" + mmCode
				+ ", dftTitle=" + dftTitle + ", dftDegree=" + dftDegree + ", dftDate=" + dftDate + ", aprApproval1="
				+ aprApproval1 + ", aprApproval2=" + aprApproval2 + ", aprApproval3=" + aprApproval3
				+ ", dftFinalState=" + dftFinalState + ", dftCheck=" + dftCheck + ", dftFileOri=" + dftFileOri
				+ ", dftFilePath=" + dftFilePath + ", dftContent=" + dftContent + ", proApproval=" + proApproval
				+ ", proApprovalName=" + proApprovalName + ", proReason=" + proReason + ", proRealTime=" + proRealTime
				+ ", url=" + url + ", docFileGroup=" + docFileGroup + ", proState=" + proState + ", dpName=" + dpName
				+ ", ptName=" + ptName + ", mmName=" + mmName + ", pDpName=" + pDpName + ", pPtName=" + pPtName
				+ ", pMmName=" + pMmName + "]";
	}
}