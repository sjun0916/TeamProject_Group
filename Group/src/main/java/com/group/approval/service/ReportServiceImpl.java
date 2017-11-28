package com.group.approval.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.group.approval.dao.ReportDao;
import com.group.approval.vo.ReportVo;
import com.group.user.vo.UserVO;


@Service("reportService")
public class ReportServiceImpl implements ReportService {
	@Resource(name="reportDao")
	ReportDao dao;
	@Override
	public int insert(ReportVo vo) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.insert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<ReportVo> select(UserVO vo) {
		// TODO Auto-generated method stub
		List<ReportVo> list=null;
		try {
			list=dao.select(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<ReportVo> check(UserVO vo) {
		// TODO Auto-generated method stub
		List<ReportVo> list=null;
		try {
			list =dao.check(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<UserVO> getUser() {
		// TODO Auto-generated method stub
		List<UserVO>list =null;
		try {
			list =dao.getUser();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public ReportVo selectOne(int num) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectOne(num);
	}
	@Override
	public int check(int num) throws SQLException {
		// TODO Auto-generated method stub
		return dao.check(num);
	}
	@Override
	public int back(ReportVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.back(vo);
	}
	@Override
	public List<Integer> stateList(String id) {
		// TODO Auto-generated method stub
		List<Integer> list = null;
		try {
			list = dao.stateList(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
