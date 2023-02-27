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
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--휴가 문서 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 문서</span>
					</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span><i class="bi bi-chevron-down ms-auto"></i>
				  	</a>
					<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
						<li>
					    	<a href="#">
					      		<span>공공사업1</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>공공사업2</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>전략사업</span>
					    	</a>
					  	</li>
					  	<li>
				    		<a href="#">
					      		<span>경영관리</span>
					    	</a>
					  	</li>
					</ul>
				</li>
			
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ====================================== Main ============================================ -->
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
					
					<!-- 올해 근무 현황 -->
					<div class="col-lg-6">
						
						<!-- 제목 -->
						<div class="pagetitle">
						 	<h1>올해근무현황</h1>
						</div>
						
						<!-- 내용 -->   
						<div class="card">
							<div class="card-body">
								<div class="row mt-3">
									<div class="col border-end" style="text-align:center">
										<div>출근</div>
										<div>10회</div>
									</div>
									<div class="col border-end" style="text-align:center">
										<div>지각</div>
										<div>1회</div>
									</div>
									<div class="col" style="text-align:center">
										<div>결근</div>
										<div>1회</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					 <!--휴가 현황 -->
					<div class="col-lg-6">
						
						<!-- 제목 -->
						<div class="pagetitle">
							<h1>휴가현황</h1>
						</div>
						
						<!-- 내용 -->
						<div class="card">
							<div class="card-body">
								<div class="row mt-3">
									<div class="col border-end" style="text-align:center">
										<div>잔여 휴가</div>
										<div>10일</div>
									</div>
									<div class="col" style="text-align:center">
										<div>총 휴가</div>
										<div>20일</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- ====================================== End First row ============================================ -->
			
				<!-- ====================================== Second row ============================================ --> 
				<div class="row">
					<!-- 오늘 근무 현황 -->
					<div class="col-lg-6">
						
						<!-- 제목 -->
						<div class="pagetitle">
						   	<h1>오늘 근무 현황</h1>
						</div>
						
						<!-- 내용 -->
						<div class="card" >
							<div class="card-body" style="height:350px">
								<h5 class="card-title">2023.02.06</h5>
								<div class="d-flex">
									<div><h2>12:00:00 </h2></div>
									<div class="mt-2 mx-2"><span class="badge bg-success">근무</span></div>
								</div>
							
								<!-- 출퇴근 버튼 -->
								<div>
									<script>
										function btnAtt()  {
											  const target1 = document.getElementById('btn-attendance');
											  target1.disabled = true;
											  target1.setAttribute( 'style', 'opacity: 0.1' )
											  
											  const target2 = document.getElementById('btn-leave');
											  target2.disabled = false;
											  target2.removeAttribute( 'style' )
										}
										function btnLeave()  {
											  const target1 = document.getElementById('btn-leave');
											  target1.disabled = true;
											  target1.setAttribute( 'style', 'opacity: 0.1' )
										}
									</script>
								
									<div class="row mb-4">
										
										<!-- 출근하기 버튼 -->
										<div class="col border-end" style="text-align:center" >
											<input 
											id="btn-attendance"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/attbtn.png" 
											width="100"
											onclick="btnAtt()"
											/>
										    <div>출근하기</div>   
											<div>000000</div>
										</div>
									
										<!-- 퇴근하기 버튼 -->
										<div class="col" style="text-align:center">
											<input 
											id="btn-leave"
											disabled 
											style="opacity: 0.1"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/leavebtn.png" 
											width="100"
											onclick="btnLeave()" 
											/>
											<div>퇴근하기</div>
											<div>000000</div>
										</div>
									
									</div>
								</div>
							</div>
						</div>
					</div>
				
					<!-- 주중 근무 현황 -->
					<div class="col-lg-6">
						<!-- 재목 -->
						<div class="pagetitle">
						   	<h1>주중 근무 현황</h1>
						</div>
						<!-- 내용 -->
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">23.02.01~23.02.06</span></h5>
								
								<div class="activity">
								
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.01</div>
										<i class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
										<div class="activity-content">정상근무</div>
									</div>
								
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.02</div>
										<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>
										<div class="activity-content">지각</div>
									</div>
									
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.03</div>
										<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
										<div class="activity-content">결근</div>
									</div>
									
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.04</div>
										<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>
										<div class="activity-content">휴가</div>
									</div>
									
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.05</div>
										<i class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
										<div class="activity-content">정상근무</div>
									</div>
									
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.06</div>
										<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
										<div class="activity-content">휴일</div>
									</div>
									
									<div class="activity-item d-flex">
										<div class="activite-label">22.02.07</div>
										<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>
										<div class="activity-content">휴일</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div><!-- ====================================== End Second row ============================================ -->
			   
				<!-- ====================================== Third row ============================================ -->
				<div class="row">
					
					<!-- 제목 -->
					<div class="pagetitle">
						<h1>월별 근무 현황</h1>
					</div>
					
					<!-- 내용 -->
					<div class="card">
						<div class="card-body">
							
							<script>
								
								document.addEventListener('DOMContentLoaded', function() {
									
							 		var calendarEl = document.getElementById('calendar');
							
							  		var calendar = new FullCalendar.Calendar(calendarEl, {
							  			initialView: 'dayGridMonth',
									   
								   		 events: [
								   		    { 
								   		      title: '정상출근', // 제목
								   		      start: '2023-02-28', // 시작일자
									   		  backgroundColor : '#49a3f1',
								   		    },{ 
								   		      title: '정상출근', // 제목
								   		      start: '2023-02-27' // 시작일자
									   		 },{ 
								   		      title: '정상출근', // 제목
								   		      start: '2023-03-27' // 시작일자
									   		 }
								   			 
								   		  ]
							 		 });
							  		calendar.render();
								});
							</script>
						  	<div class="d-flex justify-content-center">
						  		<div id='calendar' class="m-5" style="width:1200px" ></div>
						  	</div>
							
						</div>
					</div>
				</div>
				<!-- ====================================== End Third row ============================================ -->
			</section>
		</main>
	  	<!-- =======End Main ======= -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>