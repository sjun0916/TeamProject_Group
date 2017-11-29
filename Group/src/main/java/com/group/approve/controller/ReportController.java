package com.group.approve.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.approve.service.ReportService;
import com.group.approve.vo.ReportVo;
import com.group.calendar.controller.SessionUtil;
import com.group.user.vo.UserVO;




//	report/make서류 작성
//  report/state 서류 확인

//	report/apply 서류 권한신청
//	report/confirm 권한 신청확인
@Controller
public class ReportController {
	@Resource(name = "reportService")
	ReportService service;
	
//	private Logger logger = Logger.getLogger(this.getClass());
	@RequestMapping("/report/make")
	public String makeReport(HttpServletRequest request){
		request.setAttribute("title", "서류만들기");
		String path = request.getSession().getServletContext().getRealPath("/report");
		System.out.println("path______________" + path);
		File dir = new File(path);
		File[] fileList = dir.listFiles();
		List<String> fileNameList = new ArrayList<String>();
		for(int i=0;i<fileList.length;i++){
			File file = fileList[i];
			if(file.isFile()){
//				String fileName = file.getName();
				fileNameList.add(file.getName().substring(0,file.getName().lastIndexOf(".")));
			}
		}
		List<UserVO> memberList =service.getUser();
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("reportList", fileNameList);
		return "report/update";
	}
	@RequestMapping("/report/state")
	public String stateReport(HttpServletRequest request){
		request.setAttribute("title", "서류 현황");
		
		List<ReportVo> list = null;
		try {
			list=service.select((UserVO) SessionUtil.getAttribute("login"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list",list);
		return "report/state";
	}
	
	@RequestMapping("/report/apply")
	public String applyReport(HttpServletRequest request){
		request.setAttribute("title", "서류 권한 신청");
		return "report/state";
	}
	@RequestMapping("/report/confirm")
	public String confirmReport(HttpServletRequest request){
		request.setAttribute("title", "권한 신청 현황");
		return "report/state";
	}
	@RequestMapping("/report/waiting")
	public String waitReport(HttpServletRequest request){
		request.setAttribute("title", "승인대기중");
		
		List<ReportVo> list = null;
		try {
			list=service.check((UserVO) SessionUtil.getAttribute("login"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("list",list);
		return "report/state";
	}
	@RequestMapping(value="/report/make", method=RequestMethod.POST)
	public String makeImage(HttpServletRequest request){
		request.setAttribute("title", "서류만들기");
		String path = request.getSession().getServletContext().getRealPath("/report");
		File dir = new File(path);
		File[] fileList = dir.listFiles();
		List<String> fileNameList = new ArrayList<String>();
		for(int i=0;i<fileList.length;i++){
			File file = fileList[i];
			if(file.isFile()){
//				String fileName = file.getName();
				fileNameList.add(file.getName().substring(0,file.getName().lastIndexOf(".")));
			}
		}
		request.setAttribute("reportList", fileNameList);
		return "report/update";
	}
	
}
