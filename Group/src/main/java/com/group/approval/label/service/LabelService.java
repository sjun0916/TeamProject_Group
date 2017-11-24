package com.group.approval.label.service;

import java.util.List;

import com.group.approval.label.vo.LabelVo;

public interface LabelService {
	public List<LabelVo> selectLabel(String id);
	
	public void insertlabel(LabelVo vo);
	
	public int selectone(int num);
	
	public List<LabelVo> highlabel(String id);
	
	public void insertlow(LabelVo vo);
	
	public List<LabelVo> lowinfo(int num);
	
	public LabelVo lowinfo2(int gnum);
	
	public void modifylabel(LabelVo vo);
	
	public LabelVo viewdetail(int num);
	
	public void deletelabel(int num);
	
	public void deletelabelGnum(int gnum);
	
	public int highModify(int gnum);
	
	public void updatedocu(LabelVo vo);
	
	public List<LabelVo> labelnumlist();
}
