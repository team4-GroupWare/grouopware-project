<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<!-- 달력  -->
<link
	href="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main1.js"></script>
<style>
.fc-day-sun {
	color: #e31b23
}

.fc-day-sat {
	color: #007dc3
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>

	<!-- ====================================== Main ================================================== -->
	<main id="main" class="main">

	<section class="section dashboard">
		<!-- ====================================== First row ============================================ -->
		<div class="row">
			<!-- 오늘 근무 현황 -->
			<div class="col-lg-5">
				<div class="row">
					<div class="col-md-12">
						<div class="pagetitle">
							<h1>주 근무 현황</h1>
						</div>
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">${title}</h5>

								<canvas id="stakedBarChart" style="max-height: 250px;"></canvas>
								<script>
								document.addEventListener("DOMContentLoaded", () => {
									var list = new Array(); 
									attendanceTime = ${attendanceTime}
									var list = new Array(); 
									halfTime = ${halfTime}
									var list = new Array(); 
									overTime = ${overTime}
									console.log(attendanceTime)
									console.log(halfTime)
									console.log(overTime)
								  new Chart(document.querySelector('#stakedBarChart'), {
								    type: 'bar',
								    data: {
								      labels: ['월요일', '화요일', '수요일', '목요일', '금요일'],
								      datasets: [{
								          label: '지각',
								          data: halfTime,
								          backgroundColor: 'rgb(255, 205, 86)',
								        },{
								          label: '출근',
								          data: attendanceTime,
								          backgroundColor: '#4DABF7',
								        },
								        {
								          label: '연장근무',
								          data: overTime,
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
								});
								</script>
							</div>
						</div>
					</div>
				</div>
				<!-- ====================================== 4th Card ============================================== -->

				<div class="pagetitle">
					<h1>월 근무 통계</h1>
				</div>
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"></h5>

						<!-- Pie Chart -->
						<div id="pieChart"></div>

						<script>
					                document.addEventListener("DOMContentLoaded", () => {
					                var attCountMonth = ${attendanceMonthStatus.attCount}
					                var lateCountMonth = ${attendanceMonthStatus.lateCount}
					                var absentCountMonth = ${attendanceMonthStatus.absentCoutn}
					                var vacationCountMonth = ${attendanceMonthStatus.halfCount * 0.5} + ${attendanceMonthStatus.eventCount}
					                var overTimeCountMonth = ${attendanceMonthStatus.overTime}
					                
					                  new ApexCharts(document.querySelector("#pieChart"), {
					                    series: [attCountMonth, vacationCountMonth, lateCountMonth, absentCountMonth,overTimeCountMonth],
					                    chart: {
					                      height: 250,
					                      type: 'pie',
					                    },
					                    labels: ['출근', '휴가','지각', '결근', '연장']
					                  }).render();
					                });
					              </script>
						<!-- End Pie Chart -->

					</div>
				</div>
			</div>
			<!-- ====================================== 4th Card ============================================== -->
			<div class="col-lg-7">
				<div class="pagetitle">
					<h1>월별 근무 현황</h1>
				</div>
				<div class="card" style="height: 720px;">
					<div class="card-body m-0 p-0">
						<script>
										$(document).ready(function(){
											var request = $.ajax({
											  url: "${pageContext.request.contextPath}/attendance/mystatus",
											  method: "GET"
											  
											});
											request.done(function( data ) {
													
													var calendarEl = document.getElementById('calendar');
													
												    var calendar = new FullCalendar.Calendar(calendarEl, {
												    	initialView: 'dayGridMonth',
												      googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
												      events: 
												    	  data
												    	,eventSources: [
												    		{
													        	googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
													        	color: '#be5683' 
													         	
													        	}
													    	],
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
						<div class="d-flex justify-content-center">
							<div id='calendar' class="mt-5" style="width: 700px"></div>
						</div>
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