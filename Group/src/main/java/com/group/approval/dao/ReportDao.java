package com.group.approval.dao;

import java.sql.SQLException;
import java.util.List;

import com.group.approval.vo.ReportVo;
import com.group.user.vo.UserVO;


public interface ReportDao {
	public int insert(ReportVo vo) throws SQLException;
	public List<UserVO> getUser() throws SQLException;
	public List<ReportVo> select(UserVO vo) throws SQLException;
	public List<ReportVo> check(UserVO vo) throws SQLException;
	public ReportVo selectOne(int num) throws SQLException;
	public int check(int num) throws SQLException;
	public int back(ReportVo vo) throws SQLException;
	public List<Integer> stateList(String id) throws SQLException;
}
