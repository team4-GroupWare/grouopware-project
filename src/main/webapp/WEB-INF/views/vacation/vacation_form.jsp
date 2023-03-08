<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	
	<!-- datapicker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
	
	<!-- file -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
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
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/document'"  >
					<a class="nav-link collapsed" data-bs-target="#document1-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 결제 문서</span>
					</a>
				</li>
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ======================================Main==================================================== -->
		<main id="main" class="main">
			<!-- PageTitle -->
			<div class="pagetitle">
			  <h1>휴가 신청</h1>
			  <nav>
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item"><a href="#">근태관리</a></li>
			      <li class="breadcrumb-item">휴가 신청</li>
			    </ol>
			  </nav>
			</div>
			
			<!-- PageContent -->
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<table id="vertical-1" 
							style="width:50%; box-shadow: 0px 0 30px rgb(1 41 112 / 10%);border: none;  border-radius: 5px;">
				            <tr style="height: 50px; vertical-align:middle; ">
				                <th class="ps-2" style="background-color:#004389; width:10%; color:white">잔여 휴가 일수</th>
				                <td class="ps-2" style="width: 15%;background-color:white">18일</td>
				                <th class="ps-2" style="background-color:#004389; width:10%;color:white">대체 연차</th>
				                <td class="ps-2" style="width: 15%;background-color:white">출산(90일)</td>
				            </tr>
						</table>
						<div class="card mt-3">
							<div class="card-body m-4">
								
								<!-- Form -->
								<form method="post" id="vacation_form" action="${pageContext.request.contextPath}/vacation/write" enctype="multipart/form-data">
									<!-- 제출하기 Button -->
									<div class="row mb-3">
										<div class="col-sm-12 d-flex justify-content-end">
											<button type="submit" class="btn btn-primary">제출하기</button>
										</div>
									</div>
									
									<!-- 휴가 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>휴가</b></label>
										<div class="col-sm-6">
											<script>
												$(function (){
													$('input[type=radio][name=vacationType]').on('click', function() {
														var chkValue = $('input[type=radio][name=vacationType]:checked').val();
														if (chkValue == '1') {
															$('#POP').empty();
															let element = '<option value="1" selected>연차</option>'+
																'<option value="2">오전 반차</option>'+
																'<option value="3">오후 반차</option>';
															$('#POP').append(element);
															$("#datePicker1").datepicker('setDate', "");
															$("#datePicker1").datepicker('destroy');
															$("#datePicker1").attr('id','datePicker');
															$('#datePicker').datepicker({
																format: "yyyy년 mm월 dd일",
															    multidate: true,
															    multidateSeparator: " ,",
															    datesDisabled: ['2023/03/01'],
															    daysOfWeekDisabled: "0,6",
															    todayHighlight: true
															});
														
														} else if(chkValue == '2') {
															$('#POP').empty();
															let element = '<option value="4" selected>결혼</option>'+
															'<option value="5">출산</option>'+
															'<option value="6">사망</option>';
															$('#POP').append(element);
															
															$("#datePicker").datepicker('setDate', "");
															$("#datePicker").datepicker('destroy');
															$("#datePicker").attr('id','datePicker1');
															$('#datePicker1').datepicker({
																format: "yyyy-mm-dd",
															    
															    datesDisabled: ['2023/03/02'],
															    daysOfWeekDisabled: "0,6",
															    todayHighlight: true
															});
															/* $("#datePicker1").on("propertychange change paste input", function() {
																console.log(document.getElementById('datePicker1').value);
																let date = new Date(document.getElementById('datePicker1').value);
																date.setDate(date.getDate() + 90);
															    
																document.getElementById('endDate').value =formatDate(date);
															});
															
															function formatDate(date) {
															    var d = new Date(date),
															        month = '' + (d.getMonth() + 1),
															        day = '' + d.getDate(),
															        year = d.getFullYear();

															    if (month.length < 2) 
															        month = '0' + month;
															    if (day.length < 2) 
															        day = '0' + day;

															    return [year, month, day].join('-');
															} */
															
														}
														else if(chkValue == '3') {
															$('#POP').empty();
															let element = '<option value="7" selected>병가</option>';
															$('#POP').append(element);
															$("#datePicker1").datepicker('setDate', "");
															$("#datePicker1").datepicker('destroy');
															$("#datePicker1").attr('id','datePicker');
															$('#datePicker').datepicker({
																format: "yyyy년 mm월 dd일",
															    multidate: true,
															    multidateSeparator: " ,",
															    datesDisabled: ['2023/03/01'],
															    daysOfWeekDisabled: "0,6",
															    todayHighlight: true
															});
														}
													});
												});
											</script>
											<input type="radio" name="vacationType" value="1" checked="checked"> 정기휴가
											<input type="radio" name="vacationType" value="2" > 경조사
											<input type="radio" name="vacationType" value="3" > 공가
										</div>
									</div>
									
									<!-- 휴가 종류 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>휴가 종류</b></label>
										<div class="col-sm-4">
											<select id="POP" name="vacationCategoryId" class="form-select" aria-label="Default select example">
												<option value="1" selected>연차</option>
												<option value="2">오전 반차</option>
												<option value="3">오후 반차</option>
											</select>
										</div>
										<input type="hidden" id="empId" name="empId" value="${loginEmployee.empId}">
									</div>
									
									<!-- 날짜 선택 -->
									<div class="row mb-3">
											
											<label for="text" class="col-sm-2 col-form-label"><b>날짜 선택</b></label>
											<div class="col-sm-2 mx-0">
 												<input type="text" id="datePicker" name="dates" style="width:100%">
											</div>
											<div class="col-sm-1 d-flex justify-content-center" >
 												~
											</div>
											<div class="col-sm-2">
 												<input type="text" id="endDate" name="endDate" style="width:100%" >
											</div>
											
											<script>
												$('#datePicker').datepicker({
													format: "yyyy년 mm월 dd일",
												    multidate: true,
												    multidateSeparator: " ,",
												    datesDisabled: ['2023/03/01'],
												    daysOfWeekDisabled: "0,6",
												    todayHighlight: true
												});
												
												
												
												
											</script>
									</div>
									
									<!-- 사유 -->
									<div class="row mb-3">
										<label for="text" class="col-sm-2 col-form-label"><b>사유</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="content">
										</div>
									</div>
									
									<!-- 첨부파일 -->
									<div class="row mb-3">
                						<label for="text" class="col-sm-2 col-form-label"><b>파일선택</b></label>	
											<div class="insert col-sm-10">
												<input id="input-file" type="file"  onchange="addFile(this);" style="display:none" multiple />
											    <label class="btn btn-secondary btn-sm mb-2 " for="input-file">파일선택</label>
											    <div class="file-list"></div>
											</div>
					                </div>
					                
									<!-- 결재선 -->
									<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>결재선</b></label>
	                  					<div class="col-sm-10">
	                  						<div class="row mb-3">
	                  							<div class="col-sm-10">
	                    							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
	                    								결재선 선택
	              									</button>
	              								</div>
	              							</div>
	              		
		              						<div class="row">
		              							<div id="vacation_line" class="d-flex">
		              							
		              							</div>
		                  					</div>
	                					</div>
	                				</div>
									<%@ include file="/WEB-INF/views/vacation/form_modal.jsp" %>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main><!-- ======================================Main==================================================== -->
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>