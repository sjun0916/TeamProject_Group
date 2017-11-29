package com.group.approve.service;

import java.sql.SQLException;
import java.util.List;

import com.group.approve.vo.ReportVo;
import com.group.user.vo.UserVO;

public interface ReportService {
	public int insert(ReportVo vo);
	public List<ReportVo> select(UserVO vo);
	public List<ReportVo> check(UserVO vo);
	public List<UserVO> getUser();
	public ReportVo selectOne(int num) throws SQLException;
	public int check(int num) throws SQLException;
	public int back(ReportVo vo) throws SQLException;
	public List<Integer> stateList(String id);
}
