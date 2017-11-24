package com.group.approval.label.vo;

public class LabelVo {
	
	private int label_num;
	private String label_name;
	private String label_color;
	private int label_document;
	private int label_gnum;
	private int label_onum;
	private int label_nested;
	private String reg_id_label;
	
	
	public String getReg_id_label() {
		return reg_id_label;
	}
	public void setReg_id_label(String reg_id_label) {
		this.reg_id_label = reg_id_label;
	}
	public int getLabel_num() {
		return label_num;
	}
	public void setLabel_num(int label_num) {
		this.label_num = label_num;
	}
	public String getLabel_name() {
		return label_name;
	}
	public void setLabel_name(String label_name) {
		this.label_name = label_name;
	}
	public String getLabel_color() {
		return label_color;
	}
	public void setLabel_color(String label_color) {
		this.label_color = label_color;
	}
	public int getLabel_document() {
		return label_document;
	}
	public void setLabel_document(int label_document) {
		this.label_document = label_document;
	}
	public int getLabel_gnum() {
		return label_gnum;
	}
	public void setLabel_gnum(int label_gnum) {
		this.label_gnum = label_gnum;
	}
	public int getLabel_onum() {
		return label_onum;
	}
	public void setLabel_onum(int label_onum) {
		this.label_onum = label_onum;
	}
	public int getLabel_nested() {
		return label_nested;
	}
	public void setLabel_nested(int label_nested) {
		this.label_nested = label_nested;
	}
	
	@Override
	public String toString() {
		return "LabelVo [label_num=" + label_num + ", label_name=" + label_name + ", label_color=" + label_color
				+ ", label_document=" + label_document + ", label_gnum=" + label_gnum + ", label_onum=" + label_onum
				+ ", label_nested=" + label_nested + "]";
	}
	
	
}
