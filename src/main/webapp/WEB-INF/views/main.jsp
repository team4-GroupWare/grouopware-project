<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<style>
		@media screen and (max-width: 1200px) {
		  .menubar {
		    display: none;
		  }
		}
		a:link {
	  		color : black;
		}
		a:visited {
			color : black;
		}
		a:hover {
		  	color : #97ACFC;
		}
		a:active {
		  	color : #97ACFC;
		}
		.card-icon {
			background-color: white;
			cursor : pointer;
		}
		.card-icon:hover {
			background-color: #004389;;
			font-weight : bold;
		}
		.card-icon:hover > .bi {
			color: #fff;
		}
		.marker2 ul li {
		    float: left;
		    padding: 8px 0 4px 4px;
		    min-width: 44px;
		    margin-left: 1px;
		}
		.marker2 ul li.attendanceMark {
		    color: #3C97E1;
		}
		.marker2 ul li.holidayMark {
		    color: #FF8787;
		}
		.marker2 ul li.lateMark {
		    color: #FFDF6C; 
		}
		.marker2 ul li.vacationMark {
		    color: #57C66A; 
		}
	</style>
</head>
	<body style="overflow-x: hidden">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  	
	  	<script>
		  	var today = new Date(); 						//오늘날짜
	  		var day = today.getDay();						//요일
	  	    var year = today.getFullYear();					//년
	  	    var month = modifyNumber(today.getMonth()+1);	//월
	  	    var date = modifyNumber(today.getDate());		//일
	  	  	var isHoli = false;								//공휴일 판별
	  	   
	  	    //페이지 로드될 때마다 -> 메일 다섯개씩 리스트로 가져옴 (html조각)
	  		$(document).ready(function() {
	  			$.ajax({
	  				url:"${pageContext.request.contextPath}/email/sendEmailListMain",
	                type: "GET"
	       		}).done(function(data){
	       			$("#mail-send").empty();
	                $("#mail-send").html(data);
	            }); 
	              
	            $.ajax({
	            	url:"${pageContext.request.contextPath}/email/receiveEmailListMain",
	               	type: "GET"
	            }).done(function(data){
	            	$("#mail-receive").empty();
	                $("#mail-receive").html(data);
	            }); 
	            
	            //공지사항
	            $.ajax({
	  				url:"${pageContext.request.contextPath}/board/mainboardlist/1",
	                type: "GET"
	       		}).done(function(data){
	       			$("#notice").empty();
	                $("#notice").html(data);
	            });
	            
	            //사내 경조사
	            $.ajax({
	  				url:"${pageContext.request.contextPath}/board/mainboardlist/2",
	                type: "GET"
	       		}).done(function(data){
	       		 	$("#happy").empty();
	                $("#happy").html(data);
	            }); 
	  			
	  			//현재 시간, 날짜 
	  			nowClock();
        	    setInterval(nowClock,1000); 
	  			
        	    //오늘이 공휴일인지 판단 후 -> 해당사원의 출근 가져옴
        	    
        	    //1. 오늘 날짜 - > String으로 변환
        	    var yearToStr = year.toString();
        	    var monthToStr = month.toString();
        	    var dateToStr = date.toString();
	  			var today = yearToStr+monthToStr+dateToStr;
	  			
	  			//2. 공휴일 판단
	  			$.ajax({
	  				url:"${pageContext.request.contextPath}/holiday",
	  				data:{"today":today}
	  			}).done(function(data){
	  				isHoli = data;
	  				todayAtt();
	  			}); 
	  		});
  			
	  	    
	  	    //해당사원의 오늘날짜 출근 정보 가져옴
  			function todayAtt(){
  				//휴일일 경우
		  		if(day == 6 || day == 0 || isHoli) {
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
		  				url : "${pageContext.request.contextPath}/attendance/today"
		  				
		  			}).done(function(data){
		  				
		  				let status; 
		  				let clockIn;
		  				let clockOut;
		  				console.log(data.status)
		  				
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
		  				//반차가 아닌 조건도 넣어주기
	  					else if(data.clockIn != null && data.clockOut != null || data.status != null){
		  				btnNotActive();
		  				}
		  				
		  			});
		  		}
  			}
	  		
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
		  	    var sec = modifyNumber(now.getSeconds()); //초
	  			
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
	  	
	  	<!-- menubar background -->
		<div class="row menubar" style="height:300px; background-color:#EEF2F4;">
			<div class="row"  style="margin-top:120px" >
				<div  style="padding:0 230px"  >
					
					<!-- menubar -->
					<div class="row">
						<div class="menu col-sm" onclick="location.href='${pageContext.request.contextPath}/attendance/info'">
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width:100px; height:100px; border: 2px solid #004389;">
								<i class="bi bi-clock fs-1" ></i>
							</div>
							<div style="text-align:center; margin-top:10px">근태관리</div>
						</div>
					
						<div class="menu col-sm" onclick="location.href='${pageContext.request.contextPath}/hr/group'">
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width:100px; height:100px; border: 2px solid #004389;">
								<i class="bi bi-person-video fs-1" ></i>
							</div>
							<div style="text-align:center;margin-top:10px">인사</div>
						</div>
					
						<div class="menu col-sm" onclick="location.href='${pageContext.request.contextPath}/approval/mylist'">
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width:100px; height:100px; border: 2px solid #004389;">
								<i class="bi bi-clipboard-check fs-1" ></i>
							</div>
							<div style="text-align:center;margin-top:10px">전자결재</div>
						</div>
					
						<div class="menu col-sm" onclick="location.href='${pageContext.request.contextPath}/email/receivelist'">
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center mx-auto" style="width:100px; height:100px; border: 2px solid #004389;">
								<i class="bi bi-envelope-check fs-1" ></i>
							</div>
							<div style="text-align:center;margin-top:10px">메일</div>
						</div>
					
						<div class="menu col-sm" >
							<div class="card-icon rounded-circle d-flex align-items-center justify-content-center mx-auto" onclick="location.href='${pageContext.request.contextPath}/board/list/1'" style="width:100px; height:100px; border: 2px solid #004389;">
								<i class="bi bi-bell fs-1" ></i>
							</div>
							<div style="text-align:center;margin-top:10px">공지사항</div>
						</div>	
					
					</div><!-- End menubar -->
				</div>
			</div> 	
		</div>
		<!-- End menubar background -->
	  
		<!-- main content -->
		<div id="main1" class="main" >
			<section class="section dashboard">
				<div class="row">
					
					<!-- Left side columns -->
					<div class="col-lg-4">
						<!-- attendance Title -->
						<div class="pagetitle">
							<h1>근무확인 </h1>
						</div>
			          	<!-- attendance Card -->
			          	<div class="card info-card sales-card "  style="height:330px; ">
			           		<div class="card-body mt-4">
			                	<!-- 현재시간 -->
			                	<div class=""><h2 id="time"></h2></div>
					            <div class="row">
					            	<div class="col" style="padding:7px 14px;"><h5 style="font-weight:bold" id="date"></h5></div>
									<!-- 출근 상태 -->
				                	<!-- <div class="col">
				                		<span style="width:80px;height:34px;padding:7px 0px;font-size:20;" id="status1" class="badge bg-primary">
				                			출근
				                		</span>
				                	</div> -->
					            </div>
					            <!-- Modal -->
								  <div class="modal fade" id="myModal" role="dialog">
								    <div class="modal-dialog">
								    
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">×</button>
								          <h4 class="modal-title">Modal Header</h4>
								        </div>
								        <div class="modal-body">
								          <p>${message}</p>
								        </div>
								        <div class="modal-footer">
								          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        </div>
								      </div>
								      
								    </div>
								  </div>
				                
								
								<!-- 출퇴근 버튼 -->
								<div>
									<div class="row">
										<!-- 출근하기 버튼 -->
										<div class="col-6 border-end" style="text-align:center" >
											<input 
											id="btn-attendance"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/attbtn.png" 
											width="100"
											onClick="location.href='${pageContext.request.contextPath}/attendance/clockin'"
											/>
										    <div>출근하기</div> 
										    <div id="clockIn"></div>
										</div><!-- End 출근하기 버튼 -->
										
										<!-- 퇴근하기 버튼 -->
										<div class="col-6 " style="text-align:center">
											<input 
											id="btn-leave"
											disabled 
											style="opacity: 0.1"
											type='image'
											src="${pageContext.request.contextPath}/resources/assets/img/leavebtn.png" 
											width="100"
											onClick="location.href='${pageContext.request.contextPath}/attendance/clockout'" 
											/>
											<div>퇴근하기</div>
											<div id="clockOut"></div>
										</div><!-- End퇴근하기 버튼 -->
									</div>
								
								</div><!-- End 출퇴근 버튼 -->
			            	
			            	</div>
		        		</div><!-- End attendance Card -->
					
							<!-- schedule Title -->
							<div class="pagetitle">
								<h1>캘린더</h1>
							</div>
							<!-- schedule Card -->
							<div class="card recent-sales overflow-auto">
								<div class="card-body">
									<div class="sec_cal">
										<div class="cal_nav">
											
											<div class="year-month my-3"></div>
											
										</div>
									  
										<div class="cal_wrap">
											<div class="days">
												<div class="day">SUN</div>
												<div class="day">MON</div>
												<div class="day">TUE</div>
												<div class="day">WED</div>
												<div class="day">THU</div>
												<div class="day">FRI</div>
												<div class="day">SAT</div>
											</div>
											<div class="dates"></div>
											<div class="tool_bar tool_absolute wrap_tb_box">
										        <div class="critical">
										            <section class="marker2">
										                <ul>
										                    <li class="attendanceMark"><span></span>출근</li>
										                    <li class="lateMark"><span></span>지각</li>
										                    <li class="holidayMark"><span></span>휴일</li>
										                    <li class="vacationMark"><span></span>휴가</li>
										                </ul>
										            </section>
										        </div>
										    </div>
										</div>
									</div>
								</div>
							</div>
						<!-- End attendance Card -->
					</div><!-- End Left side columns -->
					
					<!-- Right side columns -->
					<div class="col-lg-8">
						<!-- mail Title -->
						<div class="pagetitle">
							<h1>메일함</h1>
						</div>
						<!-- mail card -->
						<div class="card" style="height:330px;">
							<div class="card-body pb-0">
						        <!-- mail Tabs -->
							    <ul class="nav nav-tabs nav-tabs-bordered" id="mailTab" role="tablist">
								    <li class="nav-item" role="presentation">
								    	<button class="nav-link active" id="receive-tab" data-bs-toggle="tab" data-bs-target="#mail-receive" type="button" role="tab" aria-controls="receive" aria-selected="true">받은 메일함</button>
								    </li>
								    <li class="nav-item" role="presentation">
								    	<button class="nav-link" id="send-tab" data-bs-toggle="tab" data-bs-target="#mail-send" type="button" role="tab" aria-controls="send" aria-selected="false">보낸 메일함</button>
								    </li>
							    </ul>
						    	
						    	<!-- mail content -->
								<div class="tab-content pt-2" id="mailTabContent">
									
									<!-- 받은 메일함 -->
									<div class="tab-pane fade show active" id="mail-receive" role="tabpanel" aria-labelledby="receive-tab">
									</div><!-- End 받은 메일함 -->
									
									<!-- 보낸 메일함 -->
									<div class="tab-pane fade" id="mail-send" role="tabpanel" aria-labelledby="send-tab">
									</div><!--End 보낸 메일함 -->
									
								</div><!--End mail content -->
							</div>
						</div><!--End mail Card -->  
					
					
						<!-- notice Title -->
						<div class="pagetitle">
							<h1>알림마당</h1>
						</div>
						<!-- notice card -->
						<div class="card" style="height:498px">
							<div class="card-body pb-0">
								<!-- notice Tabs -->
								<ul class="nav nav-tabs nav-tabs-bordered mt-4" id="noticeTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="home" aria-selected="true">공지사항</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="happy-tab" data-bs-toggle="tab" data-bs-target="#happy" type="button" role="tab" aria-controls="profile" aria-selected="false">사내 경조사</button>
									</li>
								</ul>
						
								<!-- notice content -->
								<div class="tab-content mt-4" id="noticeTabContent">
							
									<!-- 공지사항 -->
									<div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="notice-tab">
										
									</div><!-- End 공지사항 -->
						
									<!-- 사내 경조사 -->
									<div class="tab-pane fade" id="happy" role="tabpanel" aria-labelledby="happy-tab">
										
									</div><!--End 사내 경조사  -->
								</div><!--End notice content -->
							</div>
						</div><!--End notice Card --> 
					</div><!-- End Right side columns -->
				</div>
			</section>
		</div><!-- End #main -->
	  	<!-- ======= Footer ======= -->
		<footer id="footer1" class="footer">
		 	<div class="copyright">
		   		<strong><span>엑사아이엔티 사내그룹웨어</span></strong>
		 	</div>
		 	<div class="credits">
		   		4팀 이지호 이연희 이예승
		 	</div>
		</footer><!-- End Footer -->
		
		<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
		
		<!-- Vendor JS Files -->
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/chart.js/chart.umd.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/echarts/echarts.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>
		
		<!-- Template Main JS File -->
		<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
			  	
	  	<!-- 추가한 링크 -->
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/js/schedule.js"></script>
	</body>
</html>