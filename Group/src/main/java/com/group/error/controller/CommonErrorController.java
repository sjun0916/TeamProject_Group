package com.group.error.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/*
 * 보안을 위하여 
 * 에러 페이지 처리
 */
@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
	private static final Logger logger = LoggerFactory.getLogger(CommonErrorController.class);
	
	//예외발생 오류
	@RequestMapping(value="/throwable")
	public String throwable(HttpServletRequest request, Model model) {
		logger.info("throwable");
		pageErrorLog(request);
		return "common/error";
	}
	
	//예외발생 오류
	@RequestMapping(value="/exception")
	public String exception(HttpServletRequest request, Model model) {
		logger.info("exception");
		pageErrorLog(request);
		return "common/error";
	}
	
	//400 에러
	@RequestMapping(value="/400")
	public String pageError400(HttpServletRequest request, Model model) {
		logger.info("page error code 400");
		pageErrorLog(request);
		return "common/comerror";
	}
	
	//403 에러
	@RequestMapping(value="/403")
	public String pageError403(HttpServletRequest request, Model model) {
		logger.info("page error code 403");
		pageErrorLog(request);
		return "common/comerror";
	}
	
	//404 에러
	@RequestMapping(value="/404")
	public String pageError404(HttpServletRequest request, Model model) {
		logger.info("page error code 404");
		pageErrorLog(request);
		return "common/error404";
	}
	
	//405 에러
	@RequestMapping(value="/405")
	public String pageError405(HttpServletRequest request, Model model) {
		logger.info("page error code 405");
		pageErrorLog(request);
		return "common/comerror";
	}
	
	//500 에러
	@RequestMapping(value="/500")
	public String pageError500(HttpServletRequest request, Model model) {
		logger.info("page error code 500");
		pageErrorLog(request);
		return "common/error500";
	}
	
	//503 에러
	@RequestMapping(value="/503")
	public String pageError503(HttpServletRequest request, Model model) {
		logger.info("page error code 503");
		pageErrorLog(request);
		return "common/comerror";
	}
	
	private void pageErrorLog(HttpServletRequest request) {
		logger.info("status_code : " + request.getAttribute("java.servlet.error.status_code"));
		logger.info("exception_type : " + request.getAttribute("java.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("java.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("java.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("java.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("java.servlet.error.servlet_name"));
	}
}
