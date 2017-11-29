package com.group.approve.service;

import java.util.List;
import java.util.Map;

import com.group.approve.vo.ConnectReportVo;
import com.group.approve.vo.ReportVo;


public interface OutReportService {
	public List<ReportVo> surch(Map<String, Object> keyword);
	public int appluSurch(ConnectReportVo vo);
	public int appply(ConnectReportVo vo);
	public List<ConnectReportVo> stateList(String id);
	public List<ConnectReportVo> checkList(String id);
	public int agreeReport(ConnectReportVo vo);
	public int disagreeReport(ConnectReportVo vo);
	public String detailReport(int report_no);
}
