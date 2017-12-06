package com.group.user.auth;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/*
 * 권한 인터페이스 설정
 * 가입 시 자동으로 유저로 등록
 */
@Target( { ElementType.TYPE, ElementType.METHOD } )
@Retention( RetentionPolicy.RUNTIME )
public @interface Auth {
	public enum Role {ADMIN, USER}

	public Role role() default Role.USER;
}
