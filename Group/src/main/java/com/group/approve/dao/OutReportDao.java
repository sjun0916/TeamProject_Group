package com.group.approve.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.group.approve.vo.ConnectReportVo;
import com.group.approve.vo.ReportVo;


public interface OutReportDao {
	public List<ReportVo> surch(Map<String, Object> keyword) throws SQLException;
	public int appluSurch(ConnectReportVo vo) throws SQLException;
	public int apply(ConnectReportVo vo)throws SQLException;
	public List<ConnectReportVo> stateList(String id)throws SQLException;
	public List<ConnectReportVo> checkList(String id) throws SQLException;
	public int agreeReport(ConnectReportVo vo)throws SQLException;
	public int disagreeReport(ConnectReportVo vo)throws SQLException;
	public String detailReport(int report_no) throws SQLException;
}
