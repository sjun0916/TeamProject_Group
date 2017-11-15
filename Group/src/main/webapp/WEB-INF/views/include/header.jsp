<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HelloIT</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   	<!-- 스킨 배경 색상 -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

  </head>
      <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
<body class="skin-green-light sidebar-mini">
<div class="wrapper">

  <!-- 메인 헤더! -->
  <header class="main-header">

    <!-- 메인 로고 -->
    <a href="index2.html" class="logo">
      <!-- 메인바가 미니가 되었을때 로고 형태 -->
      <span class="logo-mini"><b>★</b></span>
      <!-- 로고 형태 -->
      <span class="logo-lg"><b>Hello</b>IT</span>
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
              <span class="hidden-xs">AdminTester</span>
            </a>
            <ul class="dropdown-menu">
              <!-- 유저 정보 클릭시 나오는 메뉴 -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  TEST - Web Developer
                  <small>Member since 2017</small>
                </p>
              </li>
              <!-- 유저 정보 메뉴 -->
              <li class="user-footer">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">mypage</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">calendar</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">logout</a>
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
          <p>AdminTester</p>
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
        
        <!-- 전자게시판 -->
        <li class="treeview">
        	  <a href="#">
        		<i class="fa fa-edit"></i>
        		<span>전자게시판</span>
               	<i class="fa fa-angle-left pull-right"></i>
          	</a>
        	<ul class="treeview-menu">
            	<li><a href="#"><i class="fa fa-circle-o"></i> 공지사항</a></li>
            	<li><a href="#"><i class="fa fa-circle-o"></i> 부서게시판</a></li>
          	</ul>
        </li>
        
        <li class="treeview action">
        	<a href="#">
            	<i class="fa fa-files-o"></i>
            	<span>전자결재</span>
            	<i class="fa fa-angle-left pull-right"></i>
        	</a>
            <ul class="treeview-menu">
            	<li><a href="#"><i class="fa fa-circle-o"></i> 결재작성</a></li>
            	<li><a href="#"><i class="fa fa-circle-o"></i> 결재함</a></li>
            	<li><a href="#"><i class="fa fa-circle-o"></i> 문서양식</a></li>
            </ul>
        </li>
        
        <li class="treeview">
              <a href="#">
                <i class="fa fa-envelope"></i> <span>전자우편</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> 메일쓰기</a></li>
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
        	<a href="#">
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
        
        <li><hr></li>
        
        <li>
        	<a href="#">
        	<i class="fa fa-laptop"></i>
<!--         	<i class="fa fa-gear"></i> -->
        	<span>관리자 설정</span>
        	</a>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>