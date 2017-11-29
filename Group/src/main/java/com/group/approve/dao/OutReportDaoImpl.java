package com.group.approve.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.approve.vo.ConnectReportVo;
import com.group.approve.vo.ReportVo;


@Repository("outReportDao")
public class OutReportDaoImpl implements OutReportDao {
	@Autowired
	SqlSessionTemplate client;
	@Override
	public List<ReportVo> surch(Map<String, Object> keyword) throws SQLException{
		// TODO Auto-generated method stub
		return client.selectList("report.surch",keyword);
	}
	public int apply(ConnectReportVo vo)throws SQLException{
		return client.insert("reportout.addReportOut",vo);
	}
	@Override
	public int appluSurch(ConnectReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("reportout.surch",vo);
	}
	@Override
	public List<ConnectReportVo> stateList(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("reportout.applyList",id);
	}
	@Override
	public List<ConnectReportVo> checkList(String id) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("reportout.checkList",id);
	}
	@Override
	public int agreeReport(ConnectReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("reportout.agree",vo);
	}
	@Override
	public int disagreeReport(ConnectReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("reportout.disagree",vo);
	}
	@Override
	public String detailReport(int report_no) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectOne("reportout.detail",report_no);
	}



}
