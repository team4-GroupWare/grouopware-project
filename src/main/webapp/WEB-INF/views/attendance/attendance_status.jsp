<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!-- 달력  -->
	<link href="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main1.js"></script>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
			
	  	<!-- =========================sideber=============================== -->
		<aside id="sidebar" class="sidebar">
			<ul class="sidebar-nav" id="sidebar-nav">
				<!--휴가 작성 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/form'">
					<a class="btn btn-primary" type="button" href="#" style="width:100%">
					    <i class="bi bi-pencil-square"></i> 
					    <span>휴가 작성</span>
				  	</a>
				</li>
				<!--근무 현황 -->
				<li class="nav-item"  onclick="location.href='${pageContext.request.contextPath}/attendance/status/info'">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/attendance/dept'">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span>
				  	</a>
				</li>
			
				<!--내 휴가 문서 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/my'" >
					<a class="nav-link collapsed" data-bs-target="#document2-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>내 휴가</span>
					</a>
					
				</li>
			
				<!--휴가 결제 문서 -->
				<li class="nav-item"  >
					<a class="nav-link collapsed" data-bs-target="#document1-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 결제 문서</span><i class="bi bi-chevron-down ms-auto"></i>
					</a>
					<ul id="document1-nav" class="nav-content collapse " data-bs-parent="#documen1t-nav">
						<li>
	            			<a href='${pageContext.request.contextPath}/vacation/document'><span>전체</span></a>
	          			</li>
	          			<li>
	            			<a href="#"><span>대기</span></a>
	          			</li>
	          			<li>
	            			<a href="#"><span>진행</span></a>
	          			</li> 
	          			<li>
	            			<a href="#"><span>승인</span></a>
	          			</li>
	          			<li>
	            			<a href="#"><span>반려</span></a>
	          			</li>
					</ul>
				</li>
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ====================================== Main ================================================== -->
		<main id="main" class="main">
			<!-- pagetitle -->
			<div class="pagetitle">
				<h1>근무 현황</h1>
				<nav>
					<ol class="breadcrumb">
				    	<li class="breadcrumb-item"><a href="#">근태관리</a></li>
				    	<li class="breadcrumb-item">근무 현황</li>
				  	</ol>
				</nav>
			</div>
		
			<section class="section dashboard">
				<!-- ====================================== First row ============================================ --> 
				<div class="row">
					<!-- 오늘 근무 현황 -->
					<div class="col-lg-5">
						<div class="row">
							<!-- ====================================== First Card ================================= --> 
							<div class="col-lg-6 col-md-12" >
								<div class="pagetitle">
							   		<h1>월 근무 현황</h1>
								</div>
								<div class="card" style="height:300px">
									<div class="card-body mt-4">
										<!-- Doughnut Chart -->
										<canvas id="doughnutChart" style="max-height: 400px;"></canvas>
										<script>
										document.addEventListener("DOMContentLoaded", () => {
										  new Chart(document.querySelector('#doughnutChart'), {
										    type: 'doughnut',
										    data: {
										      labels: [
										        'Red',
										        'Blue',
										        'Yellow'
										      ],
										      datasets: [{
										        label: 'My First Dataset',
										        data: [300, 50, 100],
										        backgroundColor: [
										          'rgb(255, 99, 132)',
										          'rgb(54, 162, 235)',
										          'rgb(255, 205, 86)'
										        ],
										        hoverOffset: 4
										      }]
										    }
										  });
										});
										</script>
									</div>	
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								<div class="row">
									<div class="pagetitle">
							   			<h1>오늘 근무 계획</h1>
									</div>
									<!-- ====================================== Second Card ================================= --> 
									<div class="card info-card sales-card mb-0" style="height:140px;" >
					           			<div class="card-body mt-4">
							          		<div class="row">
							          			<div class="col border-end">
							          			<div>연장 근무  신청 내역</div>
							          			<div>없음</div>
								          		</div>
								          		<div class="col">
								          		  <button class="btn btn-primary"> 연장근무 신청하기</button>
								          		</div>
							          		</div>
					            		</div>
				        			</div>
								</div>
								<div class="row">
									<!-- ====================================== Third Card ================================= --> 
									<div class="card info-card sales-card mt-3" style="height:140px;">
					           			<div class="card-body mt-4">
							          		<div class="row">
							          			<div class="col border-end">
							          			<div>휴일 근무  신청 내역</div>
							          			<div>없음</div>
								          		</div>
								          		<div class="col">
								          		  <button class="btn btn-success"> 휴일근무 신청하기</button>
								          		</div>
							          		</div>
						            	</div>
					        		</div>
								</div>
							</div>
						</div>
						<!-- ====================================== 4th Card ============================================== --> 
						<div class="pagetitle">
						   	<h1>주중 근무 현황</h1>
						</div>
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">23.02.27 ~ 23.03.03</h5>
							
								<canvas id="stakedBarChart" style="max-height: 250px;"></canvas>
								<script>
								document.addEventListener("DOMContentLoaded", () => {
								  new Chart(document.querySelector('#stakedBarChart'), {
								    type: 'bar',
								    data: {
								      labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
								      datasets: [{
								          label: '출근',
								          data: [8, 8, 8, 4, 8],
								          backgroundColor: '#4DABF7',
								        },
								        {
								          label: '연장근무',
								          data: [2, 0, 2, 0, 0],
								          backgroundColor: '#ff8787',
								        },
								        {
								          label: '휴일근무',
								          data: [0, 0, 0, 0, 0, 0, 4],
								          backgroundColor: 'rgb(255, 205, 86)',
								        },
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
					<div class="col-lg-7">
						<div class="pagetitle">
							<h1>월별 근무 현황</h1>
						</div>
							<div class="card" style="height:700px;">
								<div class="card-body m-0 p-0">
									<script>
										$(document).ready(function(){
											var request = $.ajax({
											  url: "${pageContext.request.contextPath}/attendance/status",
											  method: "GET"
											  
											});
											request.done(function( data ) {
												console.log(data);
													
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
											<div id='calendar' class="mt-5" style="width:700px"></div>
									  	</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</section>
		</main>
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>