<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
	
	<!-- datapicker -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-datepicker.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>

<style>
	.card-header {
		background-color: #d5e0fd;
		color: black;
	}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main">
	<section class="section">
		<div class="row mt-5" >
			<!-- ===================================휴가 신청서============================================= -->
			<div class="col-lg-6">
				<div class="card profile mt-3">
					<div class="card-header">휴가 신청서</div>
					<div class="card-body pt-4">
						<form class="profile-overview" method="post" id="vacation_form" action="${pageContext.request.contextPath}/vacation/write">	
							<input type="hidden" id="empId" name="empId" value="${loginEmployee.empId}">
							<!-- 휴가 종류 -->
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
										$("#datePicker1").datepicker('destroy');
										
										$('#dateplace').empty();
										let element2 = '<div class="row mb-3">'+
											'<label for="text" class="col-sm-2 col-form-label"><b>날짜 선택</b></label>'+
											'<div class="col-sm-10">'+
												'<input type="text" id="datePicker" name="dates" style="width:100%" onchange="countDate()" class="form-control" required>'+
												'<p id="choiceDate" class="small">선택 일수 : 0일</p>'
											'</div>'+
										'</div>';
										$('#dateplace').append(element2);
										
										$('#datePicker').datepicker({
											format: "yyyy-mm-dd",
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
										$("#datePicker").datepicker('destroy');
										console.log("이게 안돼")
										$('#dateplace').empty();
										let element2 = '<div class="row mb-3">'+
											'<label for="text" class="col-sm-2 col-form-label"><b>시작날짜</b></label>'+
											'<div class="col-sm-4">'+
												'<input type="text" id="datePicker1" name="startDate" style="width:100%" onchange="plusDate()" class="form-control" required>'+
											'</div>'+
										'</div>'+
										
										'<div class="row mb-3">'+
											'<label for="text" class="col-sm-2 col-form-label"><b>종료날짜</b></label>'+
											'<div class="col-sm-4">'+
												'<input type="text" id="endDate" name="endDate" style="width:100%" class="form-control">'+
												'<p id="choiceDate" class="small">선택 일수 : 0일</p>'
											'</div>'+
										'</div>';
										$('#dateplace').append(element2);
										
										$('#datePicker1').datepicker({
											format: "yyyy-mm-dd",
										    
										    datesDisabled: ['2023/03/02'],
										    daysOfWeekDisabled: "0,6",
										    todayHighlight: true
										});
									}
								});
							});
							</script>
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label">휴가</label>
								<div class="col-sm-6">
									<input type="radio" name="vacationType" value="1" checked="checked"> 정기휴가
									<input type="radio" name="vacationType" value="2"> 경조사 
								</div>
							</div>
							<!-- 휴가 종류 -->
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label">휴가 종류</label>
								<div class="col-sm-4">
									<select id="POP" name="vacationCategoryId" class="form-select" aria-label="Default select example">
										<option value="1" selected>연차</option>
										<option value="2">오전 반차</option>
										<option value="3">오후 반차</option>
									</select>
								</div>
							</div>
							<!-- 날짜 선택 datapicker -->
							<div id="dateplace">
								<div class="row mb-1">
									<label class="col-sm-2 col-form-label">날짜 선택</label>
									<div class="col-sm-10">
										<input type="text" id="datePicker" name="dates" style="width:100%" onchange="countDate()" class="form-control" required>
										<p id="choiceDate" class="small">선택 일수 : 0일</p>
									</div>
									<input type="hidden" id="countDay" name="countDay" value="0">
								</div>
							</div>
							<script>
								$('#datePicker').datepicker({
									format: "yyyy-mm-dd",
								    multidate: true,
								    multidateSeparator: " ,",
								    datesDisabled: ['2023/03/01'],
								    daysOfWeekDisabled: "0,6",
								    todayHighlight: true
								});
								
								function plusDate(){
									var type = $("select[name=vacationCategoryId] option:selected").val();
									var day;
									if(type == 4){
										day=7;
									}else if(type==5){
										day=90;
									}else if(type==6){
										day=3;
									}
									var picker2 = document.getElementById('datePicker1').value;
									let date = new Date(picker2);
									date.setDate(date.getDate() + day)
									let dateFormat2 = date.getFullYear() +
									'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
									'-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
									document.getElementById('endDate').value =dateFormat2 ;
									$('#choiceDate').text('선택 일수 : '+day+'일');
									$('#countDay').val(day);
								};
								
								function countDate(){
									var dateString = document.getElementById('datePicker').value;
									console.log(dateString);
									var count = dateString.split(',').length;
									if(dateString == ""){
										count = 0;
									}
									$('#choiceDate').text('선택 일수 : '+count+'일');
									$('#countDay').val(count);
								}
								
							</script>
							<!-- 결재선 선택 -->
							<div class="row mb-3">
								<div class="col-sm-2">
									<button type="button" class="btn btn-sm btn-secondary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
	                    					결재선 선택
	              					</button>
								</div>
								<div class="col-4">
									<div id="vacation_line" class="d-flex">
		              				</div>
								</div>
							</div>
							<!-- 사유 -->
							<div class="row mb-3">
								<label class="col-sm-2 col-form-label">사유</label>
								<div class="col-sm-10">
									<input name="content" class="form-control" style="height: 60px"></input>
								</div>
							</div>
							<!-- 제출하기 -->
							<div class="row mb-3">
								<div class="col-sm-12 d-flex justify-content-end">
									<button type="submit" class="btn btn-primary" form="vacation_form">제출하기</button>
								</div>
							</div>
							<%@ include file="/WEB-INF/views/vacation/form_modal.jsp" %>
						</form>
					</div>
				</div>
			</div>
			<!--================================================신청자 정보==================================================-->
			<div class="col-4">
				<div class="card profile mt-3">
					<div class="card-header">신청자 정보</div>
					<div class="card-body pt-4">
						<div class="tab-pane fade show active profile-overview"
							id="profile-overview">
							<div class="row">
								<div class="col-lg-3 col-md-4 label ">이름</div>
								<div class="col-lg-9 col-md-8">이연희</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-4 label">직책</div>
								<div class="col-lg-9 col-md-8">차장</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-4 label">부서</div>
								<div class="col-lg-9 col-md-8">공공사업관리부</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-4 label">팀</div>
								<div class="col-lg-9 col-md-8">솔루션개발팀</div>
							</div>
						</div>
					</div>
				</div>
				<!--================================================연차 보유현황==================================================-->
				<div class="card profile">
					<div class="card-header">연차 보유현황</div>
					<div class="card-body pt-2 pb-3">
						<div class="tab-pane fade show active profile-overview"
							id="profile-overview">
							<div class="row">
								<div class="col-lg-3 col-md-4 label ">잔여 연차</div>
								<div class="col-lg-9 col-md-8">20 일</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-4 label">경조사 연차</div>
								<div class="col-lg-9 col-md-8">7일</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</main>
	<!-- ======================================Main==================================================== -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>