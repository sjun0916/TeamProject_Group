package com.group.calendar.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.group.calendar.dao.CalendarDao;
import com.group.calendar.vo.CalendarVO;
import com.group.user.dao.SearchEmployeeDao;
import com.group.user.dao.UserDao;
import com.group.user.vo.UserVO;

@Service("calendarService") // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class CalendarServiceImpl implements CalendarService{
	//..
	@Autowired
	private CalendarDao calendarDao;
	
	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		List<CalendarVO> tmp = null;
		try {
			tmp = calendarDao.viewList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}

	@Override
	public CalendarVO viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		CalendarVO temp = null;
		try {
			temp = calendarDao.viewSelected(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}
	
	@Override
	public List<CalendarVO> viewDay(String date, String team) {
		// TODO Auto-generated method stub
		
		List<CalendarVO> tmp = null;
		
		try {
			tmp = calendarDao.dayList(date, team);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	@Override
	public List<CalendarVO> kindList(int[] num, UserVO user) {
		// TODO Auto-generated method stub
		List<CalendarVO> tmp = null;
		try {
			tmp = calendarDao.kindList(num, user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;
	}
	

	@Override
	public int insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = calendarDao.insert(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int delete(CalendarVO cal) throws SQLException{
		int result = 0;
		// TODO Auto-generated method stub
		try {
			result = calendarDao.delete(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		int result =0;
		try {
			result = calendarDao.update(cal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	/*
	 * 양력 -> 음력 변환
	 * @param String 양력날짜(20170122)
	 * @return String 음력날짜
	 */
	@Override
	public String getLunar(String sDate) {
		System.out.println("calendarDao : start getLunar");
		System.out.println("getLunar sun date: "+sDate);
		String year = sDate.substring(0, 4);
		String day = sDate.substring(6,sDate.length());
		String month = sDate.substring(4,6);
		System.out.println("year : "+year);
		System.out.println("month : "+month);
		System.out.println("day : "+day);
		
		String serviceKey = "tuM3dAwhoBec0v61TL%2FiSW78Q6feKZUNd2xWr2EF81IFOq8QeqN%2B4Z4KWTp5mUrkt1iCejz7%2BsWpyQQzCusBAQ%3D%3D";
		String strUrl = "http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getLunCalInfo?solYear="
						+year+"&solMonth="+month+"&solDay="+day+"&ServiceKey="+serviceKey;
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		try {
			builder = factory.newDocumentBuilder();
			Document document;
			document = builder.parse(strUrl);
			
			NodeList result = document.getElementsByTagName("resultCode");
			NodeList lunMonth = document.getElementsByTagName("lunMonth");
			NodeList lunDay = document.getElementsByTagName("lunDay");
			NodeList lunYear = document.getElementsByTagName("lunYear");
			NodeList solLeapYear = document.getElementsByTagName("solLeapyear");
			NodeList lunLeapMonth = document.getElementsByTagName("lunLeapmonth");
			
			int resultCode = -1; // 성공여부(0:성공,-1:실패)
			String sLeap = null;
			String lLeap = null;
			
			for(int i=0;i<result.getLength();i++) {
				resultCode = Integer.parseInt(result.item(i).getFirstChild().getNodeValue());
				if(resultCode!=0)
					break;
				
				sLeap = solLeapYear.item(i).getFirstChild().getNodeValue();
				lLeap = lunLeapMonth.item(i).getFirstChild().getNodeValue();
				
				//윤달, 윤년 구별
				if(sLeap.equals("윤") || lLeap.equals("윤")) 
					sLeap = "1";
				else
					sLeap = "0";
				
				year = lunYear.item(i).getFirstChild().getNodeValue();
				month = lunMonth.item(i).getFirstChild().getNodeValue();
				day = lunDay.item(i).getFirstChild().getNodeValue();
				
				return sLeap+year+month+day;
			}
			
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/*
	 * input sunDate -> output lunarDate
	 * @param sDate 양력일자
	 * @return 행사이름
	 */
	@Override
	public String isLunar(String sDate){
		HashMap<String, String> lunar= new HashMap<String,String>();
		lunar.put("01-01", "설날");
		lunar.put("01-02", "설날");
		lunar.put("04-08", "부처님 오신 날");
		lunar.put("08-14", "추석");
		lunar.put("08-15", "추석");
		lunar.put("08-16", "추석");
		lunar.put("12-30", "설날");
		
		String lunarDate = null; 
		String confirm = null;
		String date = "";
		
		lunarDate = getLunar(sDate);
		confirm = lunarDate.substring(0,1);
		
		date += lunarDate.substring(5,7);
		date += "-";
		date += lunarDate.substring(7,lunarDate.length());
		System.out.println("isLunar date : "+date); //confirm 
		if(confirm.equals("0"))
			return lunar.get(date);
		else
			return null;
	}
	@Override
	public String isSun(String sDate){
		String result = null;
		HashMap<String, String> sun = new HashMap<String, String>();
		sun.put("01-01", "새해");
		sun.put("03-01", "삼일절");
		sun.put("05-01", "근로자의 날");
		sun.put("05-05", "어린이날");
		sun.put("06-06", "현충일");
		sun.put("08-15", "광복절");
		sun.put("10-03", "개천절");
		sun.put("10-09", "한글날");
		sun.put("12-25", "크리스마스");
		
		int month = Integer.parseInt(sDate.substring(4,6));
		int day = Integer.parseInt(sDate.substring(6,sDate.length()));
		
		String date = "";
		date += zeroNumber(month);
		date += "-";
		date += zeroNumber(day);
		System.out.println("isSun date : "+date); //confirm
		result = sun.get(date);
		
		return result;
	}
	@Override
	public String zeroNumber(int num) {
		String strNum = "";
		if(num < 10)
			strNum += "0" + Integer.toString(num);
		else
			strNum += Integer.toString(num);
		return strNum;
	}
}
