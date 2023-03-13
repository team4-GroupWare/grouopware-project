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
				<li class="nav-item"  onclick="location.href='${pageContext.request.contextPath}/attendance/status/info'">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>나의 근무</span>
				  	</a>
				</li>
			
				<!--부서 근무 현황 -->
				<%-- <li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/attendance/dept'">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span>
				  	</a>
				</li> --%>
			
				<!--내 휴가 문서 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/list/1'" >
					<a class="nav-link collapsed" data-bs-target="#document2-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>나의 휴가</span>
					</a>
					
				</li>
			
				<!--휴가 결제 문서 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/list/2'"  >
					<a class="nav-link collapsed" data-bs-target="#document1-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 결재 문서</span>
					</a>
				</li>
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ====================================== Main ============================================ -->
		<main id="main" class="main">
			
			<!-- 페이지 제목 -->
			<div class="pagetitle">
				<h1>부서 근무 현황</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">근태관리</a></li>
					    <li class="breadcrumb-item"><a href="index.html">부서 근무 현황</a></li>
					</ol>
				</nav>
			</div>
		
			<!-- 페이지 내용 -->
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<div class="card mt-2">
							<div class="card-body mt-3">
								<!-- =============================================departments Tabs================================= -->
								<ul class="nav nav-tabs nav-tabs-bordered" id="departmentsTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="vacation-tab" 
										data-bs-toggle="tab" data-bs-target="#dep-vacation" type="button" 
										role="tab"  aria-selected="true"
										onclick="vacation()">휴가 현황</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link " id="att-tab" 
										data-bs-toggle="tab" data-bs-target="#dep-att" type="button" 
										role="tab"  aria-selected="false"
										onclick="att()">근무 현황</button>
									</li>
								</ul>
								
								<script>
								
								function vacation()  {
									  const target1 = document.getElementById('dep-vacation');
									  target1.addClass('show active')
								}
								function att()  {
									  const target1 = document.getElementById('dep-vacation');
									  target1.Class('show active')
								}
								
								</script>
								
								<div class="tab-content mt-2" id="deptTabContent">
									<!--================================= 휴가현황 Tab ==========================================================-->
									<div class="tab-pane fade show active" id="dep-vacation" role="tabpanel" aria-labelledby="vacation-tab">
										<script>
											document.addEventListener('DOMContentLoaded', function() {
												var calendarEl = document.getElementById('calendar');
											
												var calendar = new FullCalendar.Calendar(calendarEl, {
											    	googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',
											    	eventSources: [
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
										</script>
										<div class="d-flex justify-content-center">
									  		<div id='calendar' class="m-5" style="width:1000px" ></div>
									  	</div>
									</div><!--=================================End 휴가 현황 Tab ==========================================================-->
									
									<!--================================= 근무 현황 Tab ==========================================================-->
									<div class="tab-pane fade" id="dep-att" role="tabpanel" aria-labelledby="att-tab">
										
										<!-- 주중 nav -->
										<div class="d-flex justify-content-center">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<li class="page-item d-flex align-items-center">
														<a class="page-link" href="#" aria-label="Previous">
														  <span aria-hidden="true">«</span>
														</a>
													</li>
													<li class="d-flex align-items-center">2023년 02월 16일</li>
													<li class="page-item d-flex align-items-center">
														<a class="page-link" href="#" aria-label="Next">
														  <span aria-hidden="true">»</span>
														</a>
													</li>
												</ul>
											</nav>
										</div>
										
										<!-- Table -->
										<table class="type02">
										  	<tr>
											    <th scope="row">이름</th>
											    <th scope="row">부서</th>
											    <td>13일</td>
											    <td>14일</td>
											    <td>15일</td>
											    <td>16일</td>
											    <td>17일</td>
											    <td>18일</td>
											    <td>19일</td>
										  	</tr>
										  	<tr class="table-content" >
											    <th scope="row">이연희</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										 	 </tr>
										  	<tr class="table-content">
											    <th scope="row">이지호</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										 	 </tr>
										 	 <tr class="table-content">
											   	<th scope="row">이예승</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td>휴일근무</td>
										  	</tr>
										  	<tr class="table-content" >
											    <th scope="row">강지성</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										  	</tr>
										 	 <tr class="table-content">
											    <th scope="row">장현</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										 	 </tr>
										  	 <tr class="table-content">
											   	<th scope="row">송영훈</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td>휴일근무</td>
											</tr>
										  	<tr class="table-content" >
											    <th scope="row">김지영</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										 	 </tr>
										 	 <tr class="table-content">
											    <th scope="row">한송민</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td>지각</td>
											    <td>정상근무</td>
											    <td></td>
											    <td></td>
										 	 </tr>
										 	 <tr class="table-content">
											    <th scope="row">신문ㅇㄴ</th>
											    <th scope="row">공공사업1</th>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td>정상근무</td>
											    <td></td>
											    <td>휴일근무</td>
											</tr>
										</table>
									</div><!--================================= End 근무 현황 Tab ==========================================================-->
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	  	<!-- =======End Main ======= -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>