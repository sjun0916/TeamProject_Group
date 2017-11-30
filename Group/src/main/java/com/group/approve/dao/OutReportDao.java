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
public class OutReportDao {
	
	@Autowired
	SqlSessionTemplate client;
	
	
	public List<ReportVo> surch(Map<String, Object> keyword) throws SQLException{
		return client.selectList("report.surch",keyword);
	}
	
	public int apply(ConnectReportVo vo)throws SQLException{
		return client.insert("reportout.addReportOut",vo);
	}
	
	public int appluSurch(ConnectReportVo vo) throws SQLException {
		return client.selectOne("reportout.surch",vo);
	}
	
	public List<ConnectReportVo> stateList(String id) throws SQLException {
		return client.selectList("reportout.applyList",id);
	}
	
	public List<ConnectReportVo> checkList(String id) throws SQLException {
		return client.selectList("reportout.checkList",id);
	}
	
	public int agreeReport(ConnectReportVo vo) throws SQLException {
		return client.update("reportout.agree",vo);
	}
	
	public int disagreeReport(ConnectReportVo vo) throws SQLException {
		return client.update("reportout.disagree",vo);
	}
	
	public String detailReport(int report_no) throws SQLException {
		return client.selectOne("reportout.detail",report_no);
	}



}
