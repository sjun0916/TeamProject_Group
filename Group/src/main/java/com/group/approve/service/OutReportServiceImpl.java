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
public class OutReportServiceImpl implements OutReportService {
	@Resource(name="outReportDao")
	OutReportDao dao;
	@Override
	public List<ReportVo> surch(Map<String, Object> keyword){
		// TODO Auto-generated method stub
		List<ReportVo> list =null;
		
		try {
			list=dao.surch(keyword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	@Override
	public int appply(ConnectReportVo vo) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.apply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int appluSurch(ConnectReportVo vo) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result =dao.appluSurch(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<ConnectReportVo> stateList(String id) {
		// TODO Auto-generated method stub
		List<ConnectReportVo> list=null;
		try {
			list = dao.stateList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ConnectReportVo> checkList(String id) {
		// TODO Auto-generated method stub
		List<ConnectReportVo> list=null;
		try {
			list = dao.checkList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int agreeReport(ConnectReportVo vo) {
		// TODO Auto-generated method stub
		int result =0;
		try {
			result =dao.agreeReport(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int disagreeReport(ConnectReportVo vo){
		// TODO Auto-generated method stub
		int result =0;
		try {
			result =dao.disagreeReport(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public String detailReport(int report_no) {
		// TODO Auto-generated method stub
		String result = null;
		try {
			result = dao.detailReport(report_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
