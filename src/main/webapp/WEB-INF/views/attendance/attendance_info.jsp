<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<!-- 달력  -->
	<link href="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main1.js"></script>
	<style>
	.nav-link {
		font-size: 20px;
		margin-bottom: 0;
		font-weight: 600;
		color: #012970;
	}
	button: (:disabled ) {
		font-size: 20px;
		margin-bottom: 0;
		font-weight: 600;
		color: #2879cb;
	}
	.profile .profile-overview .label {
		font-weight: 600;
		font-size: 16px;
		color: rgba(1, 41, 112, 0.6);
	}
	</style>
</head>
<script>
	/* 주 근무 시간 */
	document.addEventListener("DOMContentLoaded", function(){
		$.ajax({
			type: "get",
		    url: "${pageContext.request.contextPath}/attendance/week",
		    success: function (data) {
		    	console.log(data)
		    	new Chart(document.querySelector('#stakedBarChart'), {
					type: 'bar',
					data: {
						labels: ['월요일', '화요일', '수요일', '목요일', '금요일'],
						datasets: [{
							label: '지각',
							data: data[1],
							backgroundColor: 'rgb(255, 205, 86)',
							},{
							  label: '정상근무',
							  data: data[0],
							  backgroundColor: '#4DABF7',
							},{
							  label: '연장근무',
							  data: data[2],
							  backgroundColor: 'rgb(119, 93, 208)',
							}
						]
					},
					options: {
						responsive: true,
						scales: {
							x: {
							  stacked: true,
							},
							y: {
							  stacked: true
							}
						}
					}
				});										    	
			},
			error: function(e){
				alert("값을 가져오지 못했습니다.")
			}
		});
		/* 월 근무 통계 */
		 $.ajax({
			type: "get",
		    url: "${pageContext.request.contextPath}/attendance/statistics",
		    success: function (data) {
		    	new ApexCharts(document.querySelector("#pieChart"), {
				    series: [data.attCount+data.halfCount, data.halfCount+data.eventCount, data.lateCount, data.absentCoutn, data.overTime, data.notClockOut],
				    chart: {
				      height: 250,
				      type: 'pie',
				    },
				    labels: ['출근', '휴가','지각', '결근', '연장', '퇴근미처리'],
				    colors : ['#008ffb','#05ca87','#feb019','#ff4560','#775dd0','#0b4069']
				    
			  }).render();
			},
			error: function(e){
				alert("값을 가져오지 못했습니다.")
			}
		});
		 /* 나의 근무 시간 */
		 var request = $.ajax({
				url: "${pageContext.request.contextPath}/attendance/mystatus",
				method: "GET"
			});
			request.done(function( data ) {
				var calendarEl = document.getElementById('calendar');
			  	var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView: 'dayGridMonth',
					googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
					events: data,
					eventSources: [{
						googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
						color: '#6c757d' 
					}],
					eventClick: function(info){
					   //클릭시 구글캘린더 url로 가는것을 막는다.
					   info.jsEvent.stopPropagation();
					   info.jsEvent.preventDefault();
					}
			   });
			   calendar.render();								
			});
			request.fail(function( jqXHR, textStatus ) {
			alert( "Request failed: " + textStatus );
			}); 
		});
</script>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<main id="main" class="main">
		<section class="section dashboard">
			<div class="row">
				<!--  LeftSide  -->
				<div class="col-lg-5">
					<!-- 주 근무 현황  -->
					<div class="pagetitle">
						<h1>주 근무 시간</h1>
					</div>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${title}</h5>
							<canvas id="stakedBarChart" style="max-height: 250px;"></canvas>
						</div>
					</div>
					<!-- 월 근무 통계 -->
					<div class="card">
						<div class="card-body mt-4">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">월 근무 통계</button>
								</li>
								<li class="nav-item" role="presentation">
									<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">휴가 현황</button>
								</li>
							</ul>
							<div class="tab-content pt-2" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div id="pieChart"></div>
								</div>
								<div class="tab-pane fade " id="profile" role="tabpanel" aria-labelledby="profile-tab">
									<div class="card profile my-4">
										<div class="card-header"></div>
										<div class="card-body pt-4 m-0">
											<div class="tab-pane fade show active  profile-overview" id="profile-overview">
												<div class="row">
													<div class="col-7 label">총 잔여연차</div>
													<div class="col-5">${loginEmployee.dayoffRemain+loginEmployee.addDayoffRemain}일</div>
												</div>
												<div class="row">
													<div class="col-7 label">잔여연차</div>
													<div class="col-5">${loginEmployee.dayoffRemain}일</div>
												</div>
												<div class="row">
													<div class="col-7 label">경조연차</div>
													<div class="col-5">${loginEmployee.addDayoffRemain}일</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Right Side  -->
				<div class="col-lg-7">
					<!-- 나의 근무 현황 -->
					<div class="pagetitle">
						<h1>나의 근무 현황</h1>
					</div>
					<div class="card" style="height: 720px">
						<div class="card-body m-0 p-0">
							<div class="d-flex justify-content-center">
								<div id='calendar' class="mt-5" style="width: 700px"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>