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
	//서류 list 출력 (메인)
	public List<ReportVo> select2(UserVO vo) {
		return client.selectList("report.select2", vo);
	}
	//승인대기중 list
	public List<ReportVo> check(UserVO vo) {
		return client.selectList("report.check", vo);
	}
	//승인대기중 count(메인)
	public int check2(UserVO vo) {
		return client.selectOne("report.check2", vo);
	}
	// 유저 정보 list(결재자 선택시)
	public List<UserVO> getUser() throws SQLException {
		return client.selectList("user.userlist");
	}
	// 서류 선택 보기
	public ReportVo selectOne(int reportNo) throws SQLException {
		return client.selectOne("report.selectOne",reportNo);
	}
	// 서류 승인하기
	public int check(int num) throws SQLException {
		ReportVo vo = client.selectOne("report.selectOne", num);
		return client.update("report.updateReport", vo);
	}
	// 서류 반려하기
	public int back(ReportVo vo) throws SQLException {
		return client.update("report.backReport", vo);
	}
	// 각 현황 count (등록완료, 처리중, 처리완료, 반려)
	public List<Integer> stateList(String id) throws SQLException {
		List<Integer> list = new ArrayList<>();
		list.add((Integer) client.selectOne("report.waitCont", id));
		list.add((Integer) client.selectOne("report.endCont", id));
		list.add((Integer) client.selectOne("report.backCont", id));
		return list;
	}

}
