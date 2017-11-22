<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<%@ page language="java" import="java.util.*" %>

<%
	Calendar myCalendar = Calendar.getInstance();

	int year=0, month=0, day=0;
	int pre_year=0, pre_month=0;
	int next_year=0, next_month=0;
	int id=0;
	
	year=myCalendar.get(myCalendar.YEAR);
	month=myCalendar.get(myCalendar.MONTH)+1;
	day=myCalendar.get(myCalendar.DAY_OF_MONTH);
%>

<%@ include file ="/WEB-INF/views/include/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- 컨텐트 헤더 -->
	<section class="content-header">
		<h1>
			캘린더<small>Calendar</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- ★★★★★★★★★★★여기에 추가★★★★★★★★★★★ -->
	<!-- 컨텐트 메인 -->
	<section class="content container-fluid">

		<h2></h2>

	</section>
	<!-- 시작 -->
	<div id="image_promotion" class="_image_promotion_area no_view"></div>
		<div id="content_top">
			<h3 class="blind">검색 및 공지</h3>
			<div class="info_area">
				<h3 class="_view_target_name" data-type="&quot;all&quot;" data-text="&quot;전체 일정&quot;" data-text_jindo="jindo" data-type_jindo="jindo">전체 일정</h3>
				<a href="#" class="btn_reload reload" title="새로고침">
				<span class="blind">새로고침</span>
				</a>
				<button type="button" class="_go_task type_schedule todo"><span class="ico "></span>할일 보기</button>

				<div class="_loading_icon loading_area" style="display: none;"><span class="ico"></span>진행중</div>
				    <a href="#" class="fold_widget">
			    	<span class="spr"></span>
			        <span class="blind">위젯 접기/펴기 토글</span>
			                </a>
				</div>
				<div id="search_area" class="search_area" style="display:none;">
			    	<div class="srch_row1">
        				<div class="period">
            				<label for="" class="l_tit">기간</label>
            				<input id="fdate" name="fdate" class="_fdate" type="text">
            				<span class="bar">-</span><input id="ldate" name="ldate" class="_ldate" type="text">
        				</div>
        				<div class="group">
				            <label for="" class="l_tit">캘린더</label>
							<div class="_selectbox  selectbox13 select_wrap">
                				<select class="selectbox-source">
                    				<option value="all">전체</option>
                					<option value="1353202">내 캘린더</option></select>
                				<div class="selectbox-box">
                    				<div class="selectbox-label" unselectable="on">전체</div>
                				</div>
                				<div class="selectbox-layer" style="display:none">
                    				<div class="selectbox-list">
                    					<ul>
                    						<li style="" class="selectbox-item selectbox-item-selected selectbox-item-over" unselectable="on">전체</li>
                    						<li style="" class=" selectbox-item" unselectable="on">내 캘린더</li>
                    					</ul>
                    				</div>
                				</div>
            				</div>
        				</div>

				        <div class="invite">
            				<label for="invitee" class="l_tit">초대/참석자</label>
            				<input id="invitee" name="tit" class="_invitee" type="text">
        				</div>
					</div>
    				<div class="srch_row2">
        				<div class="tit">
            				<label for="title" class="l_tit">제목</label>
            				<input id="title" name="tit" class="_title" type="text">
        				</div>
						<div class="place">
            				<label for="place" class="l_tit">장소</label><input id="place" name="tit" class="_place" type="text">
        				</div>
						<div class="exp">
            				<label for="exp" class="l_tit">설명</label><input id="exp" name="tit" class="_exp" type="text">
        				</div>
    				</div>
    				<div class="srch_row3">
						<div class="category">
            				<label for="" class="l_tit">범주</label>
            				<ul class="cl_list">
								<li categoryid="19075409">
									<label for="color_d19b22" class="_category cl_box calendar_color_d19b22" title="주황색">
	        							<span class="blind">주황색</span>
	    							</label>
								</li>
								<li categoryid="19075410">
									<label for="color_be5233" class="_category cl_box calendar_color_be5233" title="빨간색">
        								<span class="blind">빨간색</span>
    								</label>
								</li>
								<li categoryid="19075411">
									<label for="color_35a23a" class="_category cl_box calendar_color_35a23a" title="초록색">
        								<span class="blind">초록색</span>
    								</label>
								</li>
								<li categoryid="19075412">
									<label for="color_42aedc" class="_category cl_box calendar_color_42aedc" title="파란색">
        								<span class="blind">파란색</span>
    								</label>
								</li>
								<li categoryid="19075413">
									<label for="color_9b65d9" class="_category cl_box calendar_color_9b65d9" title="보라색">
        								<span class="blind">보라색</span>
    								</label>
								</li>
								<li categoryid="19075414">
									<label for="color_adadad" class="_category cl_box calendar_color_adadad" title="회색">
        								<span class="blind">회색</span>
    								</label>
						</li></ul>
        			</div>
        			<div class="sticker">
            			<div class="wrap_stc">
            				<label for="com_chk" class="ck_input"><input id="com_chk" checked="" class="_com_chk" type="checkbox">완료포함</label>
            				<label for="attach_chk" class="ck_input"><input id="attach_chk" checked="" class="_attach_chk" type="checkbox">첨부포함</label>
            			</div>
        			</div>
				</div>
    			<button type="button" class="btn_srch">검색</button>
			</div>
			<div id="text_promotion" class="_promotion_area no_view"></div>
				<div class="sort_area">
					<div class="date_view">
						<button type="button" class="prev"><span class="blind">이전 일</span></button>
						<span class="date">2017.11</span>
						<button type="button" class="next"><span class="blind">다음 일</span></button>
						<button type="button" class="today">오늘</button>
					</div>
				</div>
			</div>
			<!-- 월간 뷰 -->
			<div id="month_frame" class="frame" onselectstart="return false;" ondragstart="return false;" style="top: 101px; display: block;">
            	<h3 class="blind">월간 일정 보기</h3>
				<div class="monthly_calendar">
					<table class="week" cellspacing="0" cellpadding="0">
						<caption><span class="blind">월 뷰</span></caption>
						<tbody>
							<tr class="_grid_header">
								<th scope="col" class="sun" title="일">일</th>
								<th scope="col" title="월">월</th>
								<th scope="col" title="화">화</th>
								<th scope="col" title="수">수</th>
								<th scope="col" title="목">목</th>
								<th scope="col" title="금">금</th>
								<th scope="col" title="토">토</th>
							</tr>
						</tbody>
					</table>
					<!-- [D] 테이블의 높이값 지정 / 4주는 forth 5주는 fifth 6주는 sixth -->
					<div class="month_table fifth">
						<div class="_schedule_container table_container">
							<div class="month_row" style="height:20%">
								<table class="grid" cellspacing="0" cellpadding="0">
									<caption><span class="blind">월 뷰</span></caption>
									<tbody>
										<tr>
											<td class="_month_cell month_schedule_drop" dayindex="0">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="1">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="2">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="3">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="4">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="5">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="6">&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<table class="schedule_list" cellspacing="0" cellpadding="0">
									<tbody>
										<tr class="date">
											<td dayindex="0" class="sun disable">
												<strong class="_move_day_view" dayindex="0">29</strong>
											</td>
											<td dayindex="1" class="disable">
												<strong class="_move_day_view" dayindex="1">30</strong>
											</td>
											<td dayindex="2" class="disable">
												<strong class="_move_day_view" dayindex="2">31</strong>
											</td>
											<td dayindex="3" class="">
												<strong class="_move_day_view" dayindex="3">1</strong>
											</td>
											<td dayindex="4" class="">
												<strong class="_move_day_view" dayindex="4">2</strong>
											</td>
											<td dayindex="5" class="">
												<strong class="_move_day_view" dayindex="5">3</strong>
													<span class="day_info"><span>(음)</span> 09.15</span>
											</td>
											<td dayindex="6" class="">
												<strong class="_move_day_view" dayindex="6">4</strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month_row" style="height:20%">
								<table class="grid" cellspacing="0" cellpadding="0">
									<caption><span class="blind">월 뷰</span></caption>
									<tbody>
										<tr>
											<td class="_month_cell month_schedule_drop" dayindex="7">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="8">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="9">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="10">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="11">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="12">&nbsp;</td>
											<td class="_month_cell month_schedule_drop" dayindex="13">&nbsp;</td>
										</tr>
									</tbody>
								</table>
								<table class="schedule_list" cellspacing="0" cellpadding="0">
									<tbody>
										<tr class="date">
											<td dayindex="7" class="sun">
												<strong class="_move_day_view" dayindex="7">5</strong>
											</td>
											<td dayindex="8" class="">
												<strong class="_move_day_view" dayindex="8">6</strong>
											</td>
											<td dayindex="9" class="">
												<strong class="_move_day_view" dayindex="9">7</strong>
												<span class="day_info">입동</span>
											</td>
											<td dayindex="10" class="">
												<strong class="_move_day_view" dayindex="10">8</strong>
											</td>
											<td dayindex="11" class="">
												<strong class="_move_day_view" dayindex="11">9</strong>
												<span class="day_info"><span>(음)</span> 09.21</span>
											</td>
											<td dayindex="12" class="">
												<strong class="_move_day_view" dayindex="12">10</strong>
											</td>
											<td dayindex="13" class="">
												<strong class="_move_day_view" dayindex="13">11</strong>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month_row" style="height:20%"><table class="grid" cellspacing="0" cellpadding="0">
								<caption><span class="blind">월 뷰</span></caption>
								<tbody>
									<tr>
										<td class="_month_cell month_schedule_drop" dayindex="14">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="15">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="16">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="17">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="18">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="19">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="20">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<table class="schedule_list" cellspacing="0" cellpadding="0">
								<tbody>
									<tr class="date">
										<td dayindex="14" class="sun">
											<strong class="_move_day_view" dayindex="14">12</strong>
										</td>
										<td dayindex="15" class="">
											<strong class="_move_day_view" dayindex="15">13</strong>
										</td>
										<td dayindex="16" class="">
											<strong class="_move_day_view" dayindex="16">14</strong>
										</td>
										<td dayindex="17" class="">
											<strong class="_move_day_view" dayindex="17">15</strong>
										</td>
										<td dayindex="18" class="">
											<strong class="_move_day_view" dayindex="18">16</strong>
										</td>
										<td dayindex="19" class="">
											<strong class="_move_day_view" dayindex="19">17</strong>
										</td>
										<td dayindex="20" class="">
											<strong class="_move_day_view" dayindex="20">18</strong>
											<span class="day_info"><span>(음)</span> 10.01</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="month_row" style="height:20%">
							<table class="grid" cellspacing="0" cellpadding="0">
								<caption><span class="blind">월 뷰</span></caption>
								<tbody>
									<tr>
										<td class="_month_cell month_schedule_drop" dayindex="21">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="22">&nbsp;</td>
										<td class="_month_cell month_schedule_drop today_area" dayindex="23">
											<div class="outline" style="height:18px">&nbsp;</div>
										</td>
										<td class="_month_cell month_schedule_drop" dayindex="24">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="25">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="26">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="27">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<table class="schedule_list" cellspacing="0" cellpadding="0">
								<tbody>
									<tr class="date">
										<td dayindex="21" class="sun">
											<strong class="_move_day_view" dayindex="21">19</strong>
										</td>
										<td dayindex="22" class="">
											<strong class="_move_day_view" dayindex="22">20</strong>
										</td>
										<td dayindex="23" class="">
											<strong class="_move_day_view" dayindex="23">21</strong>
										</td>
										<td dayindex="24" class="">
											<strong class="_move_day_view" dayindex="24">22</strong>
											<span class="day_info">소설</span>
										</td>
										<td dayindex="25" class="">
											<strong class="_move_day_view" dayindex="25">23</strong>
										</td>
										<td dayindex="26" class="">
											<strong class="_move_day_view" dayindex="26">24</strong>
											<span class="day_info"><span>(음)</span> 10.07</span>
										</td>
										<td dayindex="27" class="">
											<strong class="_move_day_view" dayindex="27">25</strong>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="month_row" style="height:20%">
							<table class="grid" cellspacing="0" cellpadding="0">
								<caption><span class="blind">월 뷰</span></caption>
								<tbody>
									<tr>
										<td class="_month_cell month_schedule_drop" dayindex="28">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="29">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="30">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="31">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="32">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="33">&nbsp;</td>
										<td class="_month_cell month_schedule_drop" dayindex="34">&nbsp;</td>
									</tr>
								</tbody>
							</table>
							<table class="schedule_list" cellspacing="0" cellpadding="0">
								<tbody>
									<tr class="date">
										<td dayindex="28" class="sun">
											<strong class="_move_day_view" dayindex="28">26</strong>
										</td>
										<td dayindex="29" class="">
											<strong class="_move_day_view" dayindex="29">27</strong>
										</td>
										<td dayindex="30" class="">
											<strong class="_move_day_view" dayindex="30">28</strong>
										</td>
										<td dayindex="31" class="">
											<strong class="_move_day_view" dayindex="31">29</strong>
										</td>
										<td dayindex="32" class="">
											<strong class="_move_day_view" dayindex="32">30</strong>
										</td>
										<td dayindex="33" class="disable">
											<strong class="_move_day_view" dayindex="33">1</strong>
										</td>
										<td dayindex="34" class="disable">
											<strong class="_move_day_view" dayindex="34">2</strong>
											<span class="day_info"><span>(음)</span> 10.15</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 큰 스티커 영역 -->
					<div class="_big_sticker_container"></div>
					<!-- 큰 스티커 영역 -->
				</div>
				<!-- // [D] 테이블의 높이값 지정 -->
			</div>
		</div>
		<!-- // 월간 뷰 -->
		<!-- 참조 -->
        <button type="button" title="일정추가" key="2017-11-01" dayindex="0" class="_add_button img_btn">
        	<span>일정추가</span>
        </button>
        
				
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file ="/WEB-INF/views/include/footer.jsp" %>