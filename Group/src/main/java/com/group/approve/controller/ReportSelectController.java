package com.group.approve.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.approve.service.ReportService;
import com.group.approve.vo.ReportVo;
import com.group.user.auth.AuthUser;
import com.group.user.vo.UserVO;

@Controller
public class ReportSelectController {
	
	@Autowired
	ReportService service;

	@RequestMapping(value = "/report/select/{form}",method=RequestMethod.GET)
	public String formReport(@PathVariable String form, HttpServletRequest request,ReportVo reportVo) {
		
		request.setAttribute("vo", reportVo);
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

		return "report/reportEditor";
	}
	
	@RequestMapping(value = "/report/select/{form}",method=RequestMethod.POST)
	public String endReport(@PathVariable String form, HttpServletRequest request,ReportVo reportVo,@RequestParam("content")String content,
								@AuthUser UserVO authUser){
		
		reportVo.setReg_cont(content);
		reportVo.setReg_id(authUser.getEmployeeNo());
		reportVo.setReg_dep(authUser.getTeamId());
		reportVo.setReg_state("1");
		service.insert(reportVo);
		
		System.out.println("결재서류 작성 완료");
		
		return "report/endReport";
	}
	
	
	@RequestMapping(value = "/report/image", method=RequestMethod.POST)
	public String reportImage(Model model,@RequestParam("content")String content){
		
		model.addAttribute("content", content);
		
		return "report/toImage";
	}
	
	
	@RequestMapping(value = "/report/selectOne",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> selectReport(int reportNo){
		System.out.println("1111");
		System.out.println("data.report_no : " + reportNo);
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		try {
			ReportVo vo= service.selectOne(reportNo);
			System.out.println("4444");
			System.out.println("data.report_no : " + reportNo);
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
