package com.group.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group.message.service.MessageService;
import com.group.message.vo.MessageVO;
import com.group.user.auth.Auth;
import com.group.user.auth.AuthUser;
import com.group.user.common.JSONResult;
import com.group.user.vo.UserVO;

@Auth
@Controller
@RequestMapping( "/message" )
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	/*
	 * 쪽지를 작성하기 위한 폼
	 * 기본키인 사원번호를 가져와서
	 * 리스트 출력
	 * 리스트에서 쪽지 보내기 버튼으로 보내기 가능
	 */
	@RequestMapping( "")
	public String message(@AuthUser UserVO authUser, 
											Model model) {
		MessageVO messageVo= new MessageVO();
		messageVo.setEmployeeNo(authUser.getEmployeeNo());
		List<MessageVO> list = 
				messageService.getMessage( messageVo );
		
		model.addAttribute( "list", list );
		
		
		return "message/messageform";
	}
	
	// 쪽지 상세보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String view(@RequestParam(value = "messageId", required = true) String messageId,
			Model model) {
		
		MessageVO messageVo = new MessageVO();
		messageVo.setMessageId(messageId);
		MessageVO resVo = messageService.getDetailMessage(messageVo);
		
		
		
		model.addAttribute("sender", resVo.getSender());
		model.addAttribute("message", resVo.getMessage());
		return "message/view";
	}
	
	// 쪽지 삭제
	@RequestMapping( value="/deleteMessage", method=RequestMethod.POST)
	public String deleteMessage(@ModelAttribute MessageVO messageVo) {
		int count = messageService.deleteMessage(messageVo);
		return "message/messageform";
	}
	
	// 쪽지 보내기
	@ResponseBody
	@RequestMapping( value="/sendMessage", method=RequestMethod.POST )
	public JSONResult sendMessage(@ModelAttribute MessageVO messageVo) {
		int count = messageService.sendMessage(messageVo);
		return JSONResult.success(count);
	}
	
	// 답장 기능
	@ResponseBody
	@RequestMapping( value="/answerMessage", method=RequestMethod.POST )
	public JSONResult answerMessage(@ModelAttribute MessageVO messageVo) {
		
		int count = messageService.answerMessage(messageVo);
		
		return JSONResult.success(count);
	}
}