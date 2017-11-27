package com.group.approval.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConvertHtml {
	@RequestMapping(value ="/report/convertHTML", method=RequestMethod.POST)
    public String convertHTML(String reg_cont,HttpServletRequest request) {
		request.setAttribute("reg_cont", reg_cont);
		
		return "content_approval/getHTML";
	}
}
