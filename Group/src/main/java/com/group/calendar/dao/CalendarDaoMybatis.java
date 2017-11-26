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
	

	@Override
	public CalendarVO select(CalendarVO cal) throws SQLException{
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
