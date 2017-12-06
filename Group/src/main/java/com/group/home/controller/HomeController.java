package com.group.home.controller;

import java.net.InetAddress;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group.approve.service.ReportService;
import com.group.approve.vo.ReportVo;
import com.group.board.service.BoardService;
import com.group.calendar.service.Calendar_Service;
import com.group.calendar.vo.Calendar_Vo;
import com.group.message.service.MessageService;
import com.group.message.vo.MessageVO;
import com.group.notice.service.NoticeService;
import com.group.photo.service.PhotoService;
import com.group.user.auth.AuthUser;
import com.group.user.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private NoticeService noticeSvc;
	@Autowired
	private PhotoService photoSvc;
	@Autowired
	private BoardService boardSvc;
	@Autowired
	private MessageService messageSvc;
	@Autowired
	private ReportService reportSvc;
	@Resource(name = "calendar_Service")
	Calendar_Service service;
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home")
	public String home(Locale locale, Model model, HttpServletRequest request,@AuthUser UserVO authUser) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		//메인공지
		List<?> listview2 = noticeSvc.selectNoticeList2();
		List<?> listview3 = noticeSvc.selectNoticeList3();
		model.addAttribute("listview2", listview2);
		model.addAttribute("listview3", listview3);
		//메인사진첩
		List<?> listview4 = photoSvc.selectPhotoList2(); 
		model.addAttribute("listview4", listview4);
		//메인부서게시판        
		List<?> listview5 = boardSvc.selectBoardList2(authUser.getTeamName());
		model.addAttribute("listview5", listview5);
		//메인 쪽지
		MessageVO messageVo= new MessageVO();
		messageVo.setEmployeeNo(authUser.getEmployeeNo());
		List<MessageVO> list = 
				messageSvc.getMessage2( messageVo );
		
		model.addAttribute( "list", list );
		//메인 결제
		List<ReportVo> list2 = reportSvc.select2(authUser);
		request.setAttribute("list2",list2);
		int waitCount = reportSvc.check2(authUser);
		request.setAttribute("waitCount", waitCount);
		
		/*---------------------------------------------------
		 * 메인 달력
		 ---------------------------------------------------*/
		int iYear=nullIntconv(request.getParameter("iYear"));
		int iMonth=nullIntconv(request.getParameter("iMonth"))-1;
		String option = request.getParameter("option");
		System.out.println("option : "+option);
		Calendar ca = new GregorianCalendar();
		
		//today
		int iTDay=ca.get(Calendar.DATE);
		int iTYear=ca.get(Calendar.YEAR);
		int iTMonth=ca.get(Calendar.MONTH);
		
		if(iYear==0)
		{
			  iYear=iTYear;
			  iMonth=iTMonth;
		}
		if(option != null) {
			if(option.equals("prev")) {
				if(iMonth==0) {
					iMonth=11;
					iYear--;
				}else
				iMonth--;
			}else if(option.equals("next")) {
				if(iMonth==11) {
					iMonth=0;
					iYear++;
				}else 
				iMonth++;		
			}
		}
		GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1);

		int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);

		cal = new GregorianCalendar (iYear, iMonth, days);
		int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);
		
		List<Calendar_Vo> todayList = getTodayList(iTYear, iTMonth, iTDay, authUser);
		
		request.setAttribute("weekStartDay", weekStartDay);
		request.setAttribute("iTotalweeks", iTotalweeks);
		request.setAttribute("days", days);
		request.setAttribute("iYear", iYear);
		request.setAttribute("iMonth", iMonth+1);
		request.setAttribute("iTYear", iTYear);
		request.setAttribute("iTMonth", iTMonth+1);
		request.setAttribute("calList", todayList);
		request.setAttribute("iTDay", iTDay);
		
		return "home";
	}

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST})
	public String loginForm() throws Exception {

		logger.info("-------------start loginForm [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		try {

		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end loginForm [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		return "user/login";
	}

	@RequestMapping("/user/auth")
	public String auth() {
		return "user/auth";
	}

	// 로그 아웃 세션 종료
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String mmLogoutCtrl(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	/*-----------------------------------------------------------------
	 * String -> int 변환
	 ------------------------------------------------------------------*/
	public int nullIntconv(String inv)
	{   
		int conv=0;
			
		try{
			System.out.println("nullIntconv_inv : "+inv); //confirm
			conv=Integer.parseInt(inv);
		}
		catch(Exception e)
		{}
		return conv;
	}
	
	/*-----------------------------------------------------------------------
	 * 메인 오늘 일정 출력 
	 -----------------------------------------------------------------------*/
	public List<Calendar_Vo> getTodayList(int iYear, int iMonth, int iDay, UserVO user){
		Date date = new Date(iYear-1900,iMonth,iDay);
		List<Calendar_Vo> tmpList = new ArrayList<Calendar_Vo>();
		
		try {	
			List<Calendar_Vo> list = service.selectCalendarKind(user);
			if(list!=null) {
				Iterator<Calendar_Vo> it = list.iterator();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				while(it.hasNext()) {
					Calendar_Vo temp = it.next();
					if(temp.getCalendar_start().compareTo(date)<=0) { 
						if(temp.getCalendar_end().compareTo(date)>=0) {
							if(temp.getCalendar_kind().equals("compony"))
								temp.setCalendar_kind("회사");
							else if(temp.getCalendar_kind().equals("team"))
								temp.setCalendar_kind("부서");
							else if(temp.getCalendar_kind().equals("person"))
								temp.setCalendar_kind("개인");
							tmpList.add(temp);
						}
					}
				}
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(tmpList.isEmpty())
			tmpList = null;
		return tmpList;
	}
}