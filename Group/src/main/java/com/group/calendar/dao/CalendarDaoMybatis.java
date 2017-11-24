package com.group.calendar.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.group.calendar.vo.CalendarVO;
import com.group.user.dao.UserDao;
import com.group.user.vo.UserVO;

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
	
}
