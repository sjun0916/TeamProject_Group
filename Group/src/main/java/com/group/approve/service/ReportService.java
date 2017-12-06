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
	
	//서류작성
	public int insert(ReportVo vo) {
		int result=0;
		try {
			result=dao.insert(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	//서류 list출력
	public List<ReportVo> select(UserVO vo) {
		List<ReportVo> list = dao.select(vo);
		return list;
	}
	//서류 list 출력(메인)
	public List<ReportVo> select2(UserVO vo) {
		List<ReportVo> list = dao.select2(vo);
		return list;
	}
	//승인대기중 list
	public List<ReportVo> check(UserVO vo) {
		List<ReportVo> list = dao.check(vo);
		return list;
	}
	//승인대기중 count
	public int check2(UserVO vo) {
		int waitCount = dao.check2(vo);
		return waitCount;
	}
	//유저 정보 list (결재자)
	public List<UserVO> getUser() {
		List<UserVO>list =null;
		try {
			list =dao.getUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//서류 선택보기
	public ReportVo selectOne(int reportNo) throws SQLException {
		return dao.selectOne(reportNo);
	}
	//서류 승인하기
	public int check(int num) throws SQLException {
		return dao.check(num);
	}
	//서류 반려하기
	public int back(ReportVo vo) throws SQLException {
		return dao.back(vo);
	}
	
	//각 현황 count list
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
