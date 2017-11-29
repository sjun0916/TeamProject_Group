package com.group.approve.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.approve.dao.OutReportDao;
import com.group.approve.vo.ConnectReportVo;
import com.group.approve.vo.ReportVo;

@Service("outReportService")
public class OutReportService {
	
	@Resource(name="outReportDao")
	OutReportDao dao;
	
	
	public List<ReportVo> surch(Map<String, Object> keyword){
		List<ReportVo> list =null;
		
		try {
			list=dao.surch(keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return list;
	}
	
	public int appply(ConnectReportVo vo) {
		int result=0;
		try {
			result=dao.apply(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int appluSurch(ConnectReportVo vo) {
		int result=0;
		try {
			result =dao.appluSurch(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ConnectReportVo> stateList(String id) {
		List<ConnectReportVo> list=null;
		try {
			list = dao.stateList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ConnectReportVo> checkList(String id) {
		List<ConnectReportVo> list=null;
		try {
			list = dao.checkList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int agreeReport(ConnectReportVo vo) {
		int result =0;
		try {
			result =dao.agreeReport(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int disagreeReport(ConnectReportVo vo){
		int result =0;
		try {
			result =dao.disagreeReport(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String detailReport(int report_no) {
		String result = null;
		try {
			result = dao.detailReport(report_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
