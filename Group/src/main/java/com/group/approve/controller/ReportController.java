package com.group.approve.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group.approve.service.ReportService;
import com.group.approve.vo.ReportVo;
import com.group.user.auth.AuthUser;
import com.group.user.vo.UserVO;


@Controller
public class ReportController {
	
	@Autowired
	ReportService service;
	

//	서류 작성
	@RequestMapping("/report/make")
	public String makeReport(HttpServletRequest request){
		request.setAttribute("title", "서류만들기");
		String path = request.getSession().getServletContext().getRealPath("/report");
		System.out.println("서류 path1 : " + path);
		File dir = new File(path);
		File[] fileList = dir.listFiles();
		List<String> fileNameList = new ArrayList<String>();
		for(int i=0;i<fileList.length;i++){
			File file = fileList[i];
			if(file.isFile()){
				fileNameList.add(file.getName().substring(0,file.getName().lastIndexOf(".")));
			}
		}
		
		List<UserVO> userList =service.getUser();
		
		request.setAttribute("userList", userList);
		request.setAttribute("reportList", fileNameList);
		return "report/update";
	}
	
	
//   요청 서류 list
	@RequestMapping("/report/state")
	public String stateReport(HttpServletRequest request, @AuthUser UserVO authUser){
		request.setAttribute("title", "서류 현황");
		List<ReportVo> list = service.select(authUser);
		request.setAttribute("list",list);
		return "report/state";
	}

//  승인대기 서류 list	
	@RequestMapping("/report/waiting")
	public String waitReport(HttpServletRequest request, @AuthUser UserVO authUser){
		request.setAttribute("title", "승인대기중");
		List<ReportVo> list = service.check(authUser);
		System.out.println("LIST : " + list);
		request.setAttribute("list",list);
		return "report/state";
	}
	
	

	
}
