package com.group.dao;

import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.group.vo.CalendarVO;

@Repository
public class CalendarDaoMybatis implements CalendarDao{
	
	private SqlSessionTemplate sqlSessionTemp;
	
	public void CalendarDaoMybatis(SqlSessionTemplate sqlSessionTemp) {
		this.sqlSessionTemp = sqlSessionTemp;
	}
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemp) {
		this.sqlSessionTemp = sqlSessionTemp;
	}
	@Override
	public List<CalendarVO> viewList() {
		// TODO Auto-generated method stub
		return sqlSessionTemp.selectList("list");
	}
	//num=1 회사; num=2 부서; num=3 개인
	public List<CalendarVO> kindList(int num, List<CalendarVO> listTemp){
		List<CalendarVO> list = viewList();
		CalendarVO temp = new CalendarVO();
		Iterator<CalendarVO> it = list.iterator();
		while(it.hasNext()) {
			temp = it.next();
			if(temp.getKind()==num) {
				listTemp.add(temp);
			}
		}
		return listTemp;
	}

	@Override
	public List<CalendarVO> viewSelected(CalendarVO cal) {
		// TODO Auto-generated method stub
		return sqlSessionTemp.selectList("select", cal.getCalNum());
	}

	@Override
	public void insert(CalendarVO cal) {
		// TODO Auto-generated method stub
		sqlSessionTemp.selectList("insert", cal);
	}

	@Override
	public void delete(CalendarVO cal) {
		// TODO Auto-generated method stub
		sqlSessionTemp.selectList("delete", cal.getCalNum());
	}

	@Override
	public void update(CalendarVO cal) {
		// TODO Auto-generated method stub
		sqlSessionTemp.selectList("update", cal);
	}
}
