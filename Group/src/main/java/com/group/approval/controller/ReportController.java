package com.group.approval.controller;

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

import com.group.approval.label.service.LabelService;
import com.group.approval.label.vo.LabelVo;
import com.group.approval.service.ReportService;
import com.group.approval.vo.ReportVo;
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
	
	@Resource(name = "labelService")
	LabelService labelservice;
	
//	private Logger logger = Logger.getLogger(this.getClass());
	@RequestMapping("/report/make")
	public String makeReport(HttpServletRequest request){
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
		List<UserVO> memberList =service.getUser();
		List<LabelVo> labelList = null;
		try {
			labelList = labelservice.selectLabel((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("labelList", labelList);
		request.setAttribute("memberList", memberList);
		request.setAttribute("reportList", fileNameList);
		return "report/make";
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
		List<LabelVo> labellist = null;
		try {
			labellist = labelservice.selectLabel((String) SessionUtil.getAttribute("id"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("labellist", labellist);
		request.setAttribute("list",list);
		return "report/state";
	}
	
	
	@RequestMapping(value="/report/state2/{labelnum}",method=RequestMethod.GET)
	public String stateReport2(HttpServletRequest request,@PathVariable int labelnum){
		request.setAttribute("title", "서류 현황");
		
		List<ReportVo> list = null;
		try {
			list=service.select2(labelnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<LabelVo> labellist = null;
		try {
			labellist = labelservice.selectLabel((String) SessionUtil.getAttribute("id"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("labellist", labellist);
		request.setAttribute("list",list);
		return "report/state2";
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
		return "report/make";
	}
	
	@RequestMapping(value="/report/updatelabelnum", method=RequestMethod.POST)
	public  @ResponseBody Map<String,Object> updateLabelNum(@RequestParam String label_num,@RequestParam String report_no){
		
		ReportVo vo = new ReportVo();
		try {
			vo = service.selectOne(Integer.parseInt(report_no));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setReg_labelnum(Integer.parseInt(label_num));
		
		service.updateLabelNumPlus(vo);
		
		
		/*LabelVo vo2 = new LabelVo();
		vo2 = labelservice.viewdetail(Integer.parseInt(label_num));
		vo2.setLabel_num(Integer.parseInt(label_num));
		try {
			vo2.setReg_id_label((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		List<LabelVo> list = null;
				list = labelservice.labelnumlist();
		
		for(LabelVo x : list){
			LabelVo vo3 = new LabelVo();
			vo3.setLabel_num(x.getLabel_num());
			
			try {
				vo3.setReg_id_label((String) SessionUtil.getAttribute("id"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		labelservice.updatedocu(vo3);
		
		}
		
		
		//labelservice.updatedocu(vo2);
		
		
		Map<String, Object> map =new HashMap<String, Object>();
		
		return map;
	}
	
	
	@RequestMapping(value="/report/updatelabelnum22", method=RequestMethod.POST)
	public  @ResponseBody Map<String,Object> updateLabelNum22(@RequestParam String report_no){
		
		ReportVo vo = new ReportVo();
		try {
			vo = service.selectOne(Integer.parseInt(report_no));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setReg_labelnum(0);
		
		service.updateLabelNumMinus(vo);
		
		
				
		List<LabelVo> list = null;
				list = labelservice.labelnumlist();
		
		for(LabelVo x : list){
			LabelVo vo3 = new LabelVo();
			vo3.setLabel_num(x.getLabel_num());
			
			try {
				vo3.setReg_id_label((String) SessionUtil.getAttribute("id"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		labelservice.updatedocu(vo3);
		
		}
			
		
		Map<String, Object> map =new HashMap<String, Object>();
		
		return map;
	}
	
	
	
}
