package com.group.approval.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.approval.service.ReportService;
import com.group.approval.vo.ReportVo;
import com.group.calendar.controller.SessionUtil;
import com.group.user.vo.UserVO;


@Controller
public class ReportSelectController {
	@Resource(name = "reportService")
	ReportService service;

	@RequestMapping(value = "/report/select/{form}",method=RequestMethod.GET)
	public String formReport(@PathVariable String form, HttpServletRequest request,ReportVo vo) {
		
		request.setAttribute("vo", vo);
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String path = request.getSession().getServletContext().getRealPath("/report/"+form+".txt");
		 File file = new File(path);
		 StringBuffer formHtml = new StringBuffer();	

		try {

			
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(file),"euc-kr"));
			String line;

			while ((line = in.readLine()) != null) {
								
			
				formHtml.append(line);
			}
			in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("formHtml", formHtml.toString());

		return "content_approval/reportEditor";
	}
	
	@RequestMapping(value = "/report/select/{form}",method=RequestMethod.POST)
	public String endReport(@PathVariable String form, HttpServletRequest request,ReportVo vo,@RequestParam("content")String content){
		UserVO user = null;
		try {
			user = (UserVO) SessionUtil.getAttribute("login");
	
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		vo.setReg_cont(content);
		System.out.println(user.getEmployeeName());
		vo.setReg_id(Integer.toString(user.getEmployeeNo()));
		vo.setReg_dep(user.getPositionName());
		vo.setReg_state("1");
		service.insert(vo);		
		return "content_approval/endReport";
	}
	@RequestMapping(value = "/report/image", method=RequestMethod.POST)
	public String reportImage(Model model,@RequestParam("content")String content){
		
		model.addAttribute("content", content);
		
		return "content_approval/toImage";
	}
	@RequestMapping(value = "/report/selectOne",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> selectReport(int data){
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			ReportVo vo= service.selectOne(data);
			jsonObject.put("state", "success");
			jsonObject.put("data",vo);
			
		} catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/report/check",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateReport(int num){
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		int result =0;
		try {
			result=service.check(num) ;
	         System.out.println(result);
			jsonObject.put("state", "success");
		}  catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
	@RequestMapping(value = "/report/back",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateReport(ReportVo vo){
		System.out.println(vo.getReport_no());
		System.out.println(vo.getReport_no());
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		int result =0;
		try {
			result=service.back(vo);
			System.out.println(result);
			jsonObject.put("state", "success");
		}  catch (SQLException e) {
			jsonObject.put("state", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}
}
