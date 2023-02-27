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
										<div>${attCountYear}회</div>
									</div>
									<div class="col border-end" style="text-align:center">
										<div>지각</div>
										<div>${lateCountYear}회</div>
									</div>
									<div class="col" style="text-align:center">
										<div>결근</div>
										<div>${absentCountYear}회</div>
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
						   	<h1>월별 출석률</h1>
						</div>
						
						<!-- 내용 -->
						<div class="card">
				            <div class="card-body">
				              <h5 class="card-title">2023년 02월</h5>
				
				              <!-- Donut Chart -->
				              <div id="donutChart" style="min-height: 270px;" class="echart"></div>
							</div>
				          </div>
				              <script>
				              	var att = ${attCountMonth};
				              	var late = ${lateCountMonth};
				              	var absent = ${absentCountMonth};
				                document.addEventListener("DOMContentLoaded", () => {
				                  echarts.init(document.querySelector("#donutChart")).setOption({
				                    tooltip: {
				                      trigger: 'item'
				                    },
				                    legend: {
				                      top: '5%',
				                      left: 'center'
				                    },
				                    series: [{
				                      type: 'pie',
				                      radius: ['40%', '70%'],
				                      avoidLabelOverlap: false,
				                      label: {
				                        show: false,
				                        position: 'center'
				                      },
				                      emphasis: {
				                        label: {
				                          show: true,
				                          fontSize: '18',
				                          fontWeight: 'bold'
				                        }
				                      },
				                      labelLine: {
				                        show: false
				                      },
				                      data: [{
				                          value: att,
				                          name: '출근'
				                        },
				                        {
				                          value: late,
				                          name: '지각'
				                        },
				                        {
				                          value: absent,
				                          name: '휴가'
				                        },
				                        {
				                          value: 1,
				                          name: '결근'
				                        }
				                      ]
				                    }]
				                  });
				                });
				              </script>
				              <!-- End Donut Chart -->
				
				            
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
								<h5 class="card-title">${thisweek[0]} ~ ${thisweek[6]}</span></h5>
								<div class="activity">
									<c:forEach var="date" items="${thisweek}" varStatus="status">
										<div class="activity-item d-flex">
											<div class="activite-label">${date}</div>
											<i class="bi bi-circle-fill activity-badge text-success align-self-start"></i>
											<c:if test="${empty statusThisWeek[status.index]}">
												<div class="activity-content">근무전</div>
											</c:if>
											<c:if test="${!empty statusThisWeek[status.index]}">
												<div class="activity-content">${statusThisWeek[status.index]}</div>
											</c:if>
											
										</div>
									</c:forEach>
								
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
									     
									      events: 
									    	  data
									    });
								
									    calendar.render();								
								});
								 
								request.fail(function( jqXHR, textStatus ) {
								  alert( "Request failed: " + textStatus );
								});
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