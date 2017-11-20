package com.group.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.group.vo.CalendarVO;
import com.group.vo.MemberVO;

@Repository
public class CalendarDaoMybatis implements CalendarDao{
	
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
	//num=1 회사; num=2 부서; num=3 개인
	public List<CalendarVO> kindList(int[] num, MemberVO member) throws SQLException{
		List<CalendarVO> tmpList = new ArrayList<CalendarVO>();
		List<CalendarVO> list = viewList();
		CalendarVO temp = null;
		Iterator<CalendarVO> it = list.iterator();
		while(it.hasNext()) {
			temp = it.next();
			for(int i=0;i<num.length;i++) {
				switch(num[i]) {
				case 1 : tmpList.add(temp);break;
				/*
				case 2 :
					//미완: 회원id로 회원 정보 확인, 부서가 같은지 확인하여 추가
					if(member.getDepartname()==temp.getMemberNum());break;
				*/
				case 3 : if(member.getMembernum()==temp.getMemberNum())
							tmpList.add(temp);break;
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
