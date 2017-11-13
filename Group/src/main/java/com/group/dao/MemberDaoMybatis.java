package com.group.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.group.vo.MemberVO;

//스프링 어노테이션 기반에서 @Repository가 DB Exception Translation을 자동으로 해준다
//자동으로 스테레오 타입의 클래스를 탐지하고 대응
//Dao로 알려진?
@Repository
public class MemberDaoMybatis implements MemberDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<MemberVO> list(){
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("insert", memberVO);
	}

	@Override
	public MemberVO select(int membernum) {
		MemberVO vo = (MemberVO) sqlSessionTemplate.selectOne("select", membernum);
		return vo;
	}
}
