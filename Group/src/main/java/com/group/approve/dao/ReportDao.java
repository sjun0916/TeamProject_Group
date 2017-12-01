package com.group.approve.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group.approve.vo.ReportVo;
import com.group.user.vo.UserVO;

@Repository
public class ReportDao {
	
	@Autowired
	SqlSessionTemplate client;
	
	//서류작성
	public int insert(ReportVo vo) throws SQLException {
		return client.insert("report.insert", vo);
	}
	//서류 list 출력
	public List<ReportVo> select(UserVO vo) {
		return client.selectList("report.select", vo);
	}

	public List<ReportVo> check(UserVO vo) {
		return client.selectList("report.check", vo);
	}

	public List<UserVO> getUser() throws SQLException {
		return client.selectList("user.userlist");
	}

	public ReportVo selectOne(int reportNo) throws SQLException {
		return client.selectOne("report.selectOne",reportNo);
	}

	public int check(int num) throws SQLException {
		ReportVo vo = client.selectOne("report.selectOne", num);
		return client.update("report.updateReport", vo);
	}

	public int back(ReportVo vo) throws SQLException {
		return client.update("report.backReport", vo);
	}

	public List<Integer> stateList(String id) throws SQLException {
		List<Integer> list = new ArrayList<>();
		list.add((Integer) client.selectOne("report.waitCont", id));
		list.add((Integer) client.selectOne("report.endCont", id));
		list.add((Integer) client.selectOne("report.backCont", id));
		return list;
	}

}
