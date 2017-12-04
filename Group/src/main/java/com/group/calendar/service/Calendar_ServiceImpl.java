package com.group.calendar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.calendar.dao.Calendar_Dao;
import com.group.calendar.vo.Calendar_Vo;
import com.group.user.vo.UserVO;

@Service("calendar_Service")
public class Calendar_ServiceImpl implements Calendar_Service {
	
	@Resource(name = "calendar_Dao")
	Calendar_Dao dao;
	@Override
	public int insertCalendar(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.insertCalender(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Calendar_Vo selectCalendar(Calendar_Vo vo) {
		// TODO Auto-generated method stub
		System.out.println("service vo_num : "+vo.getCalendar_no());
		Calendar_Vo selectvo = null ;
		try {
			selectvo =dao.selectCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectvo;
	}

	@Override
	public int deleteCalendar(Calendar_Vo vo) throws SQLException{
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =dao.deleteCalender(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateCalendar(Calendar_Vo vo) throws SQLException {
	// TODO Auto-generated method stub
	
		return dao.updateCalender(vo);
	}

	@Override
	public List<Calendar_Vo> selectCalendarAll(int id) {
		// TODO Auto-generated method stub
		List<Calendar_Vo> list=null;
		try {
			list =dao.selectCalenderAll(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Calendar_Vo> dayCalendarList(UserVO user, Date date) {
		// TODO Auto-generated method stub
		System.out.println("service dayCalendarList start");
		List<Calendar_Vo> list=new ArrayList<Calendar_Vo>();
		List<Calendar_Vo> tmpList = selectCalendarKind(user);
		
		Iterator<Calendar_Vo> it = tmpList.iterator();
		while(it.hasNext()){
			Calendar_Vo tmp = it.next();
			System.out.println("date :"+date);
			System.out.println("calendadr_start : "+tmp.getCalendar_start());
			System.out.println("calendar_end : "+tmp.getCalendar_end());
			
			if(date.compareTo(tmp.getCalendar_start())>=0) { // date >= Start
				if(date.compareTo(tmp.getCalendar_end())<=0) {	// date <= end
					list.add(tmp);
					System.out.println(tmp.getCalendar_no());
				}
			}
		}
		System.out.println("service size : "+list.size());
		return list;
	}

	@Override
	public List<Calendar_Vo> selectCalendarKind(UserVO user) {
		System.out.println("selectCalendarKind start");
		// TODO Auto-generated method stub
		List<Calendar_Vo> list = null;
		list = new ArrayList<Calendar_Vo>();
		try {
			List<Calendar_Vo> tmpList = dao.selectCalenderT();
			Iterator<Calendar_Vo> it = tmpList.iterator();
			while(it.hasNext()) {
				Calendar_Vo tmp = it.next();
				System.out.println("service calendar_team : "+tmp.getCalendar_team());
				switch(tmp.getCalendar_kind()) {
				case "compony" : list.add(tmp);break;
				case "team" : if(tmp.getCalendar_team().equals(user.getTeamName()))
									list.add(tmp);
								break;
				case "person" : if(tmp.getCalendar_regid() == user.getEmployeeNo())
									list.add(tmp);
								break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(list==null || list.isEmpty())
			list = null;
		else {
			//confirm
			for(int i=0;i<list.size();i++) {
				System.out.println(
					list.get(i).getCalendar_no()+","+
					list.get(i).getCalendar_regid()+","+
					list.get(i).getCalendar_kind());
			}
		}
		
		return list;
	}

}
