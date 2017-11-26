<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>

<body class="skin-green-light sidebar-mini">
<div class="wrapper">
<%-- <input type="hidden" id="userEmployeeNo" value="${authUser.employeeNo}" > --%>
  <!-- 메인 헤더! -->
  <header class="main-header">

    
    
    <!-- 메인 로고 -->
    <a href="/group/home" class="logo">
    
      <!-- 메인바가 미니가 되었을때 로고 형태 -->
      <span class="logo-mini"><b>GW</b></span>
      <!-- 로고 형태 -->
      <span class="logo-lg"><b>G</b>roup<b>W</b>are</span>
    </a>
    <!-- 헤더 상단 네비바 -->
    <nav class="navbar navbar-static-top" role="navigation">
    
      <!-- 사이드바를 미니로 만드는 버튼 -->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <!-- 네비 오른쪽 상단 메뉴 -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- 메일표시 (오른상단 네비)-->
          <li class="dropdown messages-menu">
            <!-- 링크걸기 -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
          </li>
          <!-- 결재표시 (오른상단 네비) -->
          <li class="dropdown notifications-menu">
            <!-- 링크걸기 -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
          </li>
          <!-- 공지사항 숫자표시 (오른상단 네비) -->
          <li class="dropdown tasks-menu">
            <!-- 링크걸기 -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
          </li>
          
          <!-- 유저 정보 (오른상단 네비) -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- 유저 사진 경로 -->
              <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <!-- 미니 상태로 있을때 유저이름 -->
              <span class="hidden-xs">${authUser.employeeName }</span>
            </a>
            <ul class="dropdown-menu">
              <!-- 유저 정보 클릭시 나오는 메뉴 -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  [${authUser.teamName }][${authUser.positionName }] ${authUser.employeeName }
<%--                   ${authUser.imageUrl} --%>
                  <small>Member since 2017</small>
                </p>
              </li>
              <!-- 유저 정보 메뉴 -->
              <li class="user-footer">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="${pageContext.servletContext.contextPath }/mypage" class="menu item_2" id="top_gnb">mypage</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">calendar</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="${pageContext.servletContext.contextPath}/logout">logout</a>
                  </div>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      </nav>
  </header>
  
  <!-- 왼쪽 사이드바 (로고 및 컬럼 포함) -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- 왼쪽 사이드바 (유저) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${authUser.employeeName }</p>
          <!-- 접속 상태 표시 -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search 검색 Form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- 사이드바 메뉴 -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header"><hr></li>
        
		<li>
        	<a href="${pageContext.servletContext.contextPath }/searchemployee" class="menu item_1" id="top_gnb">
        	<i class="fa fa-dashboard"></i>
        	<span>사원 주소록</span>
        	</a>
        </li>
        
        <!-- 전자게시판 -->
        <li class="treeview">
        	  <a href="#">
        		<i class="fa fa-edit"></i>
        		<span>전자게시판</span>
               	<i class="fa fa-angle-left pull-right"></i>
          	</a>
        	<ul class="treeview-menu">
            	<li><a href="/group/NoticeList"><i class="fa fa-circle-o"></i> 공지사항</a></li>
            	<li><a href="/group/BoardList"><i class="fa fa-circle-o"></i> 부서게시판</a></li>
          	</ul>
        </li>
        
        <li class="treeview action">
        	<a href="#">
            	<i class="fa fa-files-o"></i>
            	<span>전자결재</span>
            	<i class="fa fa-angle-left pull-right"></i>
        	</a>
            <ul class="treeview-menu">
            	<li><a href="${pageContext.request.contextPath}/report/make"><i class="fa fa-circle-o"></i> 결재작성</a></li>
            	<li><a href="${pageContext.request.contextPath}/report/state"><i class="fa fa-circle-o"></i> 결재함</a></li>
            	<li><a href="${pageContext.request.contextPath}/report/wating"><i class="fa fa-circle-o"></i> 문서양식</a></li>
            </ul>
        </li>
        
        <li class="treeview">
              <a href="#">
                <i class="fa fa-envelope"></i> <span>전자우편</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/group/mail/mailForm"><i class="fa fa-circle-o"></i> 메일쓰기</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> 메일함 <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 받은메일함</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 보낸메일함</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 임시보관함</a></li>
                  </ul>
                </li>
                <li><a href="#"><i class="fa fa-circle-o"></i> 휴지통</a></li>
              </ul>
            </li>
        
        <li>
        	<a href="/group/calendar">
        	<i class="fa fa-calendar"></i>
        	<span>일정</span>
        	</a>
        </li>
        
        <li>
        	<a href="#">
        	<i class="fa fa-dashboard"></i>
        	<span>사진첩</span>
        	</a>
        </li>
        
        <li>
        	<a href="${pageContext.servletContext.contextPath }/message" class="menu item_4" id="top_gnb">
        	<i class="fa fa-documnet"></i>
        	<span>쪽지</span>
        	</a>
        </li>

        <li><hr></li>
        
       <c:if test="${ authUser.getRole() == 'ADMIN' }">
        <li>
        	<a href="${pageContext.servletContext.contextPath}/user/admin" class="menu item_3" id="top_gnb">
        	<i class="fa fa-laptop"></i>
<!--         	<i class="fa fa-gear"></i> -->
        	<span>관리자 설정</span>
        	</a>
        </li>
       </c:if>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>