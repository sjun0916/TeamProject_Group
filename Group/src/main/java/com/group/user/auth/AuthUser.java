package com.group.user.auth;

import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
/*
 * 세션에 등록된 인터페이스 기능 제공
 */
@Retention(RUNTIME)
@Target(PARAMETER)
public @interface AuthUser {
}
