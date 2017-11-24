package com.group.approval.label.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.approval.label.service.LabelService;
import com.group.approval.label.vo.LabelVo;
import com.group.approval.service.ReportService;
import com.group.calendar.controller.SessionUtil;


@Controller
//@SessionAttributes("highlist")
public class LabelController {
	@Resource(name="labelService")
	LabelService service;
	
	@Resource(name = "reportService")
	ReportService reportservice;
	
	@RequestMapping(value="label/select")
	public String labelList(Model model){
		
	
		List<LabelVo> list=null;
		try {
			list = service.selectLabel((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<LabelVo> list2 = null;
		try {
			list2 = service.highlabel((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		model.addAttribute("highlist", list2);
		model.addAttribute("list", list);
		
				
		return "label/labelManage";
	}
	
	
	
		
	
	@RequestMapping(value="label/side",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> sideList(Model model){
		
		
		List<LabelVo> list=null;
		try {
			list = service.selectLabel((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
		return list;
	}

	
	
	
	
	
	@RequestMapping(value="label/insertlabel",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> insertLabel(@RequestParam String label_name,Model model){
		LabelVo vo = new LabelVo();
		vo.setLabel_name(label_name);
		vo.setLabel_color("#3bc1c5");
		try {
			vo.setReg_id_label((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.insertlabel(vo);

		List<LabelVo> list = new ArrayList<>(); 
				//service.selectLabel();
		return list;
		
	}
	
	@RequestMapping(value="label/insertlow/{highnum}",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertlow(@RequestParam String label_name,Model model,@PathVariable int highnum){
		LabelVo vo = new LabelVo();
		vo.setLabel_name(label_name);
		vo.setLabel_color("#3bc1c5");
		
		try {
			vo.setReg_id_label((String) SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int highGnum = service.selectone(highnum);
		
		vo.setLabel_gnum(highGnum);
		
		vo.setLabel_onum(vo.getLabel_onum()+1);
		vo.setLabel_nested(1);
		service.insertlow(vo);
		
		//List<LabelVo> listlow = service.selectLabel();
		//return listlow;
		Map<String, Object> map =new HashMap<String, Object>();
		//List<LabelVo> listlow = service.selectLabel();
		//map.put("data", listlow);
		return map;
		
	}
	
	@RequestMapping(value="label/modifyhighlabel/{highnum}",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> highmodify(@RequestParam String label_name,@RequestParam String label_num,@PathVariable int highnum){
		LabelVo vo = new LabelVo();
		
		
		vo = service.viewdetail(Integer.parseInt(label_num));
		
		vo.setLabel_name(label_name);
		
		
		int highGnum = service.selectone(highnum);
		
		vo.setLabel_gnum(highGnum);
		int a =vo.getLabel_onum()+1;
		int b = vo.getLabel_nested() +1;
		vo.setLabel_onum(a);
		vo.setLabel_nested(b);
		
		service.modifylabel(vo);
		
		//List<LabelVo> listlow = service.selectLabel();
		//return listlow;
		List<LabelVo> listhigh = new ArrayList<>();  
				//service.selectLabel();
		return listhigh;
		
	}
	
	
	
	@RequestMapping(value="label/modifylabel",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> modifylabel(@RequestParam String label_name, @RequestParam String label_num){
		
		LabelVo vo = new LabelVo();
		vo = service.viewdetail(Integer.parseInt(label_num));
		vo.setLabel_name(label_name);
		vo.setLabel_gnum(vo.getLabel_num());
		vo.setLabel_onum(0);
		vo.setLabel_nested(0);
		
		service.modifylabel(vo);
		
		List<LabelVo> list = new ArrayList<>();  
				//service.selectLabel();
		return list;
		//ajax! jquery success로 반환
	}
	
	@RequestMapping(value="label/modifylabel3/{labelgnum}",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> modifylabel3(@RequestParam String label_name, @RequestParam String label_num, @PathVariable int labelgnum){
		
		LabelVo vo = new LabelVo();
		vo = service.viewdetail(Integer.parseInt(label_num));
		vo.setLabel_name(label_name);
		vo.setLabel_gnum(labelgnum);
		service.modifylabel(vo);
		
		List<LabelVo> list = new ArrayList<>();  
				//service.selectLabel();
		return list;
		//ajax! jquery success로 반환
	}
	
	@RequestMapping(value="label/modifylabel2",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> modifylabel2(@RequestParam String label_color, @RequestParam String label_num){
		
		LabelVo vo = new LabelVo();
		vo = service.viewdetail(Integer.parseInt(label_num));
		vo.setLabel_color(label_color);
		
		service.modifylabel(vo);
		
		List<LabelVo> list = new ArrayList<>();  
				//service.selectLabel();
		return list;
		
	}
	
	
	@RequestMapping(value="label/highmodify",method=RequestMethod.POST)
	public @ResponseBody int hoghmodify(@RequestParam int label_gnum){
		int a = 0;
		
		
		a=service.highModify(label_gnum);
		
		
		return a;
		
	}
	
	
	@RequestMapping(value="label/deletelist",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> deletelist(@RequestParam int label_gnum){
		
		
			List<LabelVo> list = service.lowinfo(label_gnum);
			
			
		
		return list;
		
		
		
	}
	@RequestMapping(value="label/deletelist2",method=RequestMethod.POST)
	public @ResponseBody LabelVo deletelist2(@RequestParam int label_gnum){
		
		
			LabelVo vo = new LabelVo();
			vo = service.lowinfo2(label_gnum);
			
			
			
			return vo;
			
		
		
	}
	
		
	
	@RequestMapping(value="label/deletelabel",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> deletelabel(@RequestParam int label_num){
		
				service.deletelabel(label_num);

				
				
				List<LabelVo> list = new ArrayList<>();  
						//service.selectLabel();
		
		return list;
	}
	

	@RequestMapping(value="label/deletelabelGnum/{gnum}",method=RequestMethod.POST)
	public @ResponseBody List<LabelVo> deletelabelGnum(@PathVariable String gnum){
		
				
		service.deletelabelGnum(Integer.parseInt(gnum));
		
		
		
		List<LabelVo> list = new ArrayList<>();  
				//service.selectLabel();
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@RequestMapping(value="label/select2")
	public @ResponseBody StringBuffer labelList2(Model model){
		StringBuffer str = new StringBuffer();
		
		List<LabelVo> list = service.selectLabel();
		str.append("<tbody><tr><th>색</th><th>라벨명</th><th>문서수</th><th>작업</th><th>라벨넘</th></tr>");
		for(LabelVo x : list){
			str.append("<tr><td><span class='label' style='background-color:"+x.getLabel_color()+"; vertical-align: middle; margin-right: 10px;'>");
			str.append("</span></td><td>"+x.getLabel_name()+"</td><td>"+x.getLabel_document()+"</td><td>");
			str.append("<button class='btn btn-main2 btn-sm disable displayBtn' style='height:27px;'>수정</button>");
			str.append("<button class='btn btn-o2 btn-default  btn-sm displayBtn' style='height:27px; vertical-align: middle;'>삭제</button>");
			str.append("</td><td>"+x.getLabel_num()+"</td><tr>");
			
		}
		str.append("</tbody>");
		
		
		//model.addAttribute("list", list);
		
		return str;
	}*/
	

	
	
/*	
	@RequestMapping(value="label/select2/{value}")
	public String labelList2(Model model,@PathVariable String value){
		LabelVo vo = new LabelVo();
		
		//vo = service.selectone(value);
//		List<LabelVo> list = service.selectLabel();
//		
//		model.addAttribute("list2", list);
		
		model.addAttribute("labelvo", vo);
		System.out.println(vo.toString());
		return "label/labelManage";
	}*/
	
	
}
