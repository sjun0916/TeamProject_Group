package com.group.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.group.vo.CalendarVO;
import com.group.vo.UserVO;


@Repository
public class CalendarDaoMybatis implements CalendarDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemp;
	
	public CalendarDaoMybatis(SqlSessionTemplate sqlSessionTemp) {
		this.sqlSessionTemp = sqlSessionTemp;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemp) {
		this.sqlSessionTemp = sqlSessionTemp;
	}
	@Override
	public List<CalendarVO> viewList() throws SQLException{
		// TODO Auto-generated method stub
		return sqlSessionTemp.selectList("list");
	}
	//개인별 일정 추가
	public List<CalendarVO> kindList(int[] num, UserVO user) throws SQLException{
		List<CalendarVO> tmpList = new ArrayList<CalendarVO>();
		List<CalendarVO> list = viewList();
		CalendarVO temp = null;
		UserDao userDao = new UserDao();
		Iterator<CalendarVO> it = list.iterator();

		if(num.length != 0) {
			//전체 일정 list의 회원 list에 추가 확인
			while(it.hasNext()) {
				temp = it.next();
				//선택된 kinds 확인
				for(int i=0;i<num.length;i++) {
					switch(num[i]) {
					//전체 일정 list에 추가
					case 1 : tmpList.add(temp);break;
					
					case 2 :
						//부서 일정 list에 추가
						//회원id로 회원 정보 확인, 부서가 같은지 확인하여 list에 추가
						UserVO tmpUser = userDao.get(temp.getEmployee_no());
						if(user.getTeamName().equals(tmpUser.getTeamName()))
							tmpList.add(temp);
						break;
					
					//개인 일정 list에 추가
					case 3 : if(user.getEmployeeNo() == (temp.getEmployee_no()))
								tmpList.add(temp);break;
					}
				}
			}
		}
		return tmpList;
	}

	@Override
	public CalendarVO viewSelected(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		List<CalendarVO> tmpList = new ArrayList<CalendarVO>();
		tmpList = sqlSessionTemp.selectList("select", cal.getCalNum());
		if(tmpList.isEmpty())
			return null;
		else { 
			cal = tmpList.iterator().next();
			return cal;
		}
	}
	@Override
	public List<CalendarVO> dayList(String date) throws SQLException{
		// TODO Auto-generated method stub
		List<CalendarVO> tmpList = new ArrayList<CalendarVO>();
		List<CalendarVO> allList = viewList();
		Iterator<CalendarVO> it = allList.iterator();
		int searchDate = Integer.parseInt(date.substring(0,7));
		
		while(it.hasNext()) {
			CalendarVO tmp = it.next();
			int startDate = Integer.parseInt(tmp.getStartDate().substring(0, 7));
			int endDate = Integer.parseInt(tmp.getEndDate().substring(0,3)); 
			if(searchDate>=startDate && searchDate<=endDate) {
				tmpList.add(tmp);
			}
		}
		return tmpList;
	}

	@Override
	public int insert(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		return sqlSessionTemp.insert("insert", cal);
	}

	@Override
	public int delete(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		return sqlSessionTemp.delete("delete", cal.getCalNum());
	}

	@Override
	public int update(CalendarVO cal) throws SQLException{
		// TODO Auto-generated method stub
		return sqlSessionTemp.update("update", cal);
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
	
	/*
	 * 양력 -> 음력 변환
	 * @param String 양력날짜(20170122)
	 * @return String 음력날짜
	 */
	@Override
	public String getLunar(String sDate) {
		
		String year = sDate.substring(0, 4);
		String day = sDate.substring(6,sDate.length());
		
		String month = sDate.substring(4,6);
		int intMonth = Integer.parseInt(month)+1;
		month = zeroNumber(intMonth); 
		
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
	public String isLunar(String sDate) throws Exception{
		
		HashMap<String, String> lunar= new HashMap<String,String>();
		lunar.put("01-01", "설날");
		lunar.put("01-02", "설날");
		lunar.put("04-08", "부처님 오신 날");
		lunar.put("08-14", "추석");
		lunar.put("08-15", "추석");
		lunar.put("08-16", "추석");
		lunar.put("12-30", "설날");
		
		String lunarDate = null; //
		String confirm = null;
		String date = "";
		
		lunarDate = getLunar(sDate);
		confirm = lunarDate.substring(0,1);
		
		date += lunarDate.substring(5,7);
		date += "-";
		date += lunarDate.substring(7,lunarDate.length());
		
		if(confirm.equals("0"))
			return lunar.get(date);
		else
			return null;
	}
	@Override
	public String isSun(String sDate) throws Exception{
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
		
		int month = Integer.parseInt(sDate.substring(4,6))+1;
		int day = Integer.parseInt(sDate.substring(6,sDate.length()));
		
		String date = "";
		date += zeroNumber(month);
		date += "-";
		date += zeroNumber(day);
		
		result = sun.get(date);
		
		return result;
	}
	
}
