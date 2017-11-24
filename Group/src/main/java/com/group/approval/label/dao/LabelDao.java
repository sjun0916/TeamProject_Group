package com.group.approval.label.dao;

import java.sql.SQLException;
import java.util.List;

import com.group.approval.label.vo.LabelVo;

public interface LabelDao {
	public List<LabelVo> selectLabel(String id) throws SQLException;
	
	public void insertlabel(LabelVo vo) throws SQLException;
	
	public int selectone(int num) throws SQLException;
	
	public List<LabelVo> highlabel(String id) throws SQLException;
	
	public void insertlow(LabelVo vo) throws SQLException;
	
	public List<LabelVo> lowinfo(int num) throws SQLException;
	
	public LabelVo lowinfo2(int gnum) throws SQLException;
	
	public void modifylabel(LabelVo vo) throws SQLException;
	
	public LabelVo viewdetail(int num) throws SQLException; 
	
	public void deletelabel(int num) throws SQLException;
	
	public void deletelabelGnum(int gnum) throws SQLException;
	
	public int highModify(int gnum) throws SQLException;
	
	public void updatedocu(LabelVo vo) throws SQLException;
	
	public List<LabelVo> labelnumlist() throws SQLException;
	
	
}
