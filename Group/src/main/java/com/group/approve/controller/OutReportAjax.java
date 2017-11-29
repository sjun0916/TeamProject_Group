package com.group.approve.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.approve.service.OutReportService;
import com.group.approve.vo.ConnectReportVo;
import com.group.approve.vo.ReportVo;
import com.group.calendar.controller.SessionUtil;

@Controller
public class OutReportAjax {
	@Resource(name="outReportService")
	OutReportService service;
	
	@RequestMapping(value="/report/out/search")
	public @ResponseBody Map<String, Object> search(String reprt_No){
		Map<String, Object> jsonMain=new HashMap<String, Object>();
		Map<String, Object> search = new HashMap<String, Object>();
		System.out.println(reprt_No);
		String sessionID = "";
		try {
			sessionID = (String) SessionUtil.getAttribute("id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		search.put("sessionid", sessionID);
		search.put("keyword", reprt_No);
		
		List<ReportVo> list =service.surch(search);
		jsonMain.put("data", list);
		jsonMain.put("state", "success");
		return jsonMain;
	}
	@RequestMapping(value="/report/out/apply")
	public @ResponseBody Map<String, Object> apply (ConnectReportVo vo){
		try {
			vo.setReg_id((String) SessionUtil.getAttribute("id"));
			vo.setReg_result("1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> jsonMain=new HashMap<String, Object>();
		int result =service.appluSurch(vo);
		if(result==0){
			service.appply(vo);
			jsonMain.put("state", "success");
		}else{
			jsonMain.put("state", "중복된 데이터");
		}
		
		return jsonMain;
	}
}
