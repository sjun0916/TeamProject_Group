package com.group.approve.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConvertHtml {
	// 서류 내용 읽어서 출력
	@RequestMapping(value ="/report/convertHTML", method=RequestMethod.POST)
    public String convertHTML(String regCont,HttpServletRequest request) {
		request.setAttribute("regCont", regCont);
		
		return "report/getHTML";
	}
}
