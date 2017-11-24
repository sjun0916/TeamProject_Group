package com.group.approval.label.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.approval.label.vo.LabelVo;


@Repository("labelDao")
public class LabelDaoImpl implements LabelDao {
	
	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public List<LabelVo> selectLabel(String id) throws SQLException {
		
		return client.selectList("label.selectlabel",id);
	
	}

	@Override
	public void insertlabel(LabelVo vo) throws SQLException {

		client.insert("label.insertlabel", vo);
	}

	@Override
	public int selectone(int num) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("label.selectone", num);
	}

	@Override
	public List<LabelVo> highlabel(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("label.highlabel",id);
	}

	@Override
	public void insertlow(LabelVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.insert("label.insertlow",vo);
		//위에 파라미터 안넣은 어이없는 실수를 ㅜ_ㅜ;
	}

	@Override
	public List<LabelVo> lowinfo(int num) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("label.lowInfo", num);
	}

	@Override
	public void modifylabel(LabelVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("label.modifylabel", vo);
	}

	@Override
	public LabelVo viewdetail(int num) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("label.viewDetail", num);
	}

	@Override
	public void deletelabel(int num) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("label.deletelabel",num);
	}

	@Override
	public int highModify(int gnum) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("label.highModify", gnum);
	}

	@Override
	public LabelVo lowinfo2(int gnum) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("label.lowInfo2", gnum);
	}

	@Override
	public void deletelabelGnum(int gnum) throws SQLException {
		// TODO Auto-generated method stub
		client.delete("label.deletelabelGnum", gnum);
	}

	@Override
	public void updatedocu(LabelVo vo) throws SQLException {
		// TODO Auto-generated method stub
		client.update("label.updatedocu",vo);
	}

	@Override
	public List<LabelVo> labelnumlist() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("label.labelnumlist");
	}
	

}
