package com.group.approve.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group.approve.service.OutReportService;
import com.group.approve.vo.ConnectReportVo;
import com.group.calendar.controller.SessionUtil;



@Controller
public class OutReportMain {
	@Resource(name="outReportService")
	OutReportService service;
	
	@RequestMapping(value="/report/out/main")
	public String reportOut(HttpServletRequest request){
		request.setAttribute("page", "main");
		return "report/out/main";
	}
	@RequestMapping(value="/report/out/state")
	public String reportOutState(HttpServletRequest request){
		String id = null;
		try {
			id = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<ConnectReportVo> list =service.stateList(id);
		
		request.setAttribute("page", "state");
		request.setAttribute("list", list);
		
		return "report/out/state";
	}
	@RequestMapping(value="/report/out/check")
	public String reportOutCheck(HttpServletRequest request){
		String id = null;
		try {
			id = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<ConnectReportVo> list =service.checkList(id);
		request.setAttribute("page", "check");
		request.setAttribute("list", list);
		return "report/out/state";
	}
	@RequestMapping(value="/report/out/agree",method=RequestMethod.POST)
	public String reportOutAgree(ConnectReportVo vo){
		service.agreeReport(vo);
		return"redirect:/report/out/check";
	}
	@RequestMapping(value="/report/out/disagree")
	public String reportOutDisagree(ConnectReportVo vo){
		service.disagreeReport(vo);
		return"redirect:/report/out/check";
	}
	@RequestMapping(value="/report/out/detatilReport/{report_no}")
	public String detailReport(HttpServletRequest request,@PathVariable int report_no){
		String reg_cont=service.detailReport(report_no);
		request.setAttribute("reg_cont", reg_cont);
		return "report/getHTML";
	}
	
}
