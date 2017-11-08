package com.group.dao;

import org.springframework.stereotype.Repository;

@Repository
//스프링 어노테이션 기반에서 @Repository가 DB Exception Translation을 자동으로 해준다
//자동으로 스테레오 타입의 클래스를 탐지하고 대응
//Dao로 알려진?
public class MemberDaoMybatis implements MemberDao {

}
