package com.group.home.controller;

import java.net.InetAddress;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.group.board.service.BoardService;
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
//		int mainBoardCount = 3;  //메인 부서게시판 출력량
		List<?> listview5 = boardSvc.selectBoardList2(authUser.getTeamName());
//		System.out.println("listsize: "+listview5.size());
//		if(listview5.size()>mainBoardCount) {
//			List<?> tmplistview5 = listview5;
//			listview5.clear();
//			listview5=tmplistview5.subList(0, mainBoardCount);
//		}
//		
		model.addAttribute("listview5", listview5);

		//calendar
		Calendar ca = new GregorianCalendar();

		//calendar : today
		int iTYear=ca.get(Calendar.YEAR);
		int iTMonth=ca.get(Calendar.MONTH);
		GregorianCalendar cal = new GregorianCalendar (iTYear, iTMonth, 1); 

		int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("view info\n days : "+days+"\n WeekStartDay : "+weekStartDay); // confirm 

		cal = new GregorianCalendar (iTYear, iTMonth, days);
		int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);

		request.setAttribute("weekStartDay", weekStartDay);
		request.setAttribute("iTotalweeks", iTotalweeks);
		request.setAttribute("days", days);
		request.setAttribute("iTYear", iTYear);
		request.setAttribute("iYear", iTYear);
		request.setAttribute("iMonth", iTMonth+1);

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
}
