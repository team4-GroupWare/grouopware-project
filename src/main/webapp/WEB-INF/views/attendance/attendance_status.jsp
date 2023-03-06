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
			<script>
		  	var today = new Date(); 					//오늘날짜
	  		var day = today.getDay();					//요일
	  	    var year = today.getFullYear();				//년
	  	    var month = today.getMonth()+1; 			//월
	  	    var date = today.getDate();					//일
	  	    
	  	    //페이지 로드될 때마다 -> 사원의 출근 정보를 조회
	  		$(document).ready(function() {
          	  	
	  			//현재 시간, 날짜 
	  			nowClock();
        	    setInterval(nowClock,1000); 
		  		
		  		//휴일일 경우
		  		if(day==0 || day==6) {
		  			//출근 상태 표시
		  			let status = "휴일"
		  			let clockIn = "-- : -- : --";
	  				let clockOut = "-- : -- : --";
	  				$("#status").html(status);
	  				$("#clockIn").html(clockIn);
	  				$("#clockOut").html(clockOut);
	  				
	  				//버튼 비활성화
	  				btnNotActive();
		  		
	  			//휴일이 아닐 경우	
		  		} else{
		  			$.ajax({
		  				url : "${pageContext.request.contextPath}/attendanceinfo"
		  				
		  			}).done(function(data){
		  				
		  				let status; 
		  				let clockIn;
		  				let clockOut;
		  				
		  				if(data.status == null){
		  					status = "미출근";
		  				} else{
		  					status = data.status;
		  				}
		  				
		  				if(data.clockIn == null){
		  					clockIn = "-- : -- : --";
		  				} else{
		  					clockIn = data.clockIn;
		  				}
		  				
		  				if(data.clockOut == null){
		  					clockOut = "-- : -- : --";
		  				} else{
		  					clockOut = data.clockOut;
		  				}
		  				 
		  				$("#status").html(status);
		  				$("#clockIn").html(clockIn);
		  				$("#clockOut").html(clockOut);
		  				
		  				//퇴근버튼만 활성화
		  				if(data.clockIn != null && data.clockOut == null){
			  				onlyBtnleave();
		  				}
		  				//비활성화
	  					else if(data.clockIn != null && data.clockOut != null){
		  				btnNotActive();
		  				}
		  				
		  			});
		  		}
	  		});
	  		
	  	    //01~09시는 앞에 0이 붙도록 해주는 함수
			function modifyNumber(time){
				if(parseInt(time)<10){
				    return "0"+ time;
				}
				else  {
					return time;	
				}
			}
		  	
	  		//현재 시간, 날짜 함수
	  	    function nowClock(){
	  	    	var now = new Date(); 
	  			var hour = modifyNumber(now.getHours()); 	//시
		  	    var min = modifyNumber(now.getMinutes()); 	//분
		  	    var sec = modifyNumber(now.getSeconds()); 	//초
	  			
		  	    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
          	    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
	  		}
	  	    
	  		//퇴근버튼만 활성화 함수
	  		function onlyBtnleave() {
	  			var target1 = document.getElementById('btn-attendance');
				target1.disabled = true;
				target1.setAttribute( 'style', 'opacity: 0.1' )
				
				var target2 = document.getElementById('btn-leave');
				target2.disabled = false;
				target2.removeAttribute( 'style' )
	  		}
	  		//출근,퇴근 비활성화 함수
	  		function btnNotActive(){
	  			var target1 = document.getElementById('btn-attendance');
				target1.disabled = true;
				target1.setAttribute( 'style', 'opacity: 0.1' )
	  		}
	  	</script>
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
				<li class="nav-item" >
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--휴가 문서 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/document'">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 문서</span>
					</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/attendance/dept'">
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
				<%-- <div class="row">
					
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
				</div> --%><!-- ====================================== End First row ============================================ -->
			
				<!-- ====================================== Second row ============================================ --> 
				<div class="row">
					<!-- 오늘 근무 현황 -->
					<div class="col-lg-5">
						<div class="row">
						
							<div class="col-lg-6">
									<!-- 제목 -->
						<div class="pagetitle">
						   	<h1>오늘 근무 현황</h1>
						</div>
						<!-- 내용 -->
							<div class="card info-card sales-card "  style="height:300px; ">
			           		<div class="card-body mt-4">
					            <!-- 현재시간 -->
			                	<div class=""><h2 id="time"></h2></div>
					            <div class="row">
					            	<div class="col" style="padding:7px 14px;"><h5 style="font-weight:bold" id="date"></h5></div>
									
					            </div>
								
								<!-- 출퇴근 버튼 -->
								<div>
									<div class="row">
										<!-- 출근하기 버튼 -->
										<div class="col border-end" style="text-align:center" >
											<input 
											id="btn-attendance"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/attbtn.png" 
											width="100"
											onClick="location.href='${pageContext.request.contextPath}/attendance'"
											/>
										    <div>출근</div> 
										    <div id="clockIn"></div>
										    
										    
										</div><!-- End 출근하기 버튼 -->
										
										<!-- 퇴근하기 버튼 -->
										<div class="col" style="text-align:center">
											<input 
											id="btn-leave"
											disabled 
											style="opacity: 0.1"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/leavebtn.png" 
											width="100"
											onClick="location.href='${pageContext.request.contextPath}/leave'" 
											/>
											<div>퇴근</div>
											<div id="clockOut"></div>
										</div><!-- End퇴근하기 버튼 -->
									</div>
								
								</div><!-- End 출퇴근 버튼 -->
			            	
			            	</div>
		        		</div><!-- End attendance Card -->
				              <!-- End Donut Chart -->
							</div>
							
							
							
							<div class="col-lg-6">
							<div class="row">
								<div class="pagetitle">
						   	<h1>오늘 근무 계획</h1>
						</div>
						
						<!-- 내용 -->
							<div class="card info-card sales-card " style="height:135px;" >
			           		<div class="card-body mt-4">
					          		<div class="row">
					          			<div class="col border-end">
					          			<div>연장 근무 신청 내역</div>
					          			<div>없음</div>
						          		</div>
						          		<div class="col">
						          		  <button class="btn btn-primary"> 연장근무신청하기</button>
						          		</div>
					          		</div>
					          		
									
								
			            	</div>
		        		</div><!-- End attendance Card -->
				              <!-- End Donut Chart -->
							</div>
							<div class="row">
							 	
						
						<!-- 내용 -->
							<div class="card info-card sales-card " style="height:135px;">
			           		<div class="card-body mt-4">
					          		<div class="row">
					          			<div class="col border-end">
					          			<div>휴일 근무 신청 내역</div>
					          			<div>없음</div>
						          		</div>
						          		<div class="col">
						          		  <button class="btn btn-success"> 휴일근무신청하기</button>
						          		</div>
					          		</div>
									
								
			            	</div>
		        		</div><!-- End attendance Card -->
				              <!-- End Donut Chart -->
							</div>
									<!-- 제목 -->
						
							</div>
						
						</div>
						
						
						<!-- 재목 -->
						<div class="pagetitle">
						   	<h1>주중 근무 현황</h1>
						</div>
						<!-- 내용 -->
						<div class="card">
			            <div class="card-body">
			            <h5 class="card-title">23.02.27 ~ 23.03.03</h5>
			
			              <!-- Stacked Bar Chart -->
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
			              <!-- End Stacked Bar Chart -->
			
			            </div>
			          </div>
				            
					</div>
				
					<!-- 주중 근무 현황 -->
					<div class="col-lg-7">
						<!-- 제목 -->
					<div class="pagetitle">
						<h1>월별 근무 현황</h1>
					</div>
					
					<!-- 내용 -->
					<div class="card" style="height:700px;">
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
						  		<div id='calendar' class="m-5" style="width:1200px" ></div>
						  	</div>
							
						</div>
					</div>
				
					</div>
				</div><!-- ====================================== End Second row ============================================ -->
			   
				<!-- ====================================== Third row ============================================ -->
				
					
					
				<!-- ====================================== End Third row ============================================ -->
			</section>
		</main>
	  	<!-- =======End Main ======= -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>