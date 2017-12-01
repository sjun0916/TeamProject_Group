package com.group.approve.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group.approve.dao.ReportDao;
import com.group.approve.vo.ReportVo;
import com.group.user.vo.UserVO;

@Service
public class ReportService {
	
	@Autowired
	ReportDao dao;
	
	
	public int insert(ReportVo vo) {
		int result=0;
		try {
			result=dao.insert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<ReportVo> select(UserVO vo) {
		List<ReportVo> list = dao.select(vo);
		return list;
	}
	
	public List<ReportVo> check(UserVO vo) {
		List<ReportVo> list = dao.check(vo);
		return list;
	}
	
	public List<UserVO> getUser() {
		List<UserVO>list =null;
		try {
			list =dao.getUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ReportVo selectOne(int reportNo) throws SQLException {
		return dao.selectOne(reportNo);
	}
	
	public int check(int num) throws SQLException {
		return dao.check(num);
	}
	
	public int back(ReportVo vo) throws SQLException {
		return dao.back(vo);
	}
	
	
	public List<Integer> stateList(String id) {
		List<Integer> list = null;
		try {
			list = dao.stateList(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
