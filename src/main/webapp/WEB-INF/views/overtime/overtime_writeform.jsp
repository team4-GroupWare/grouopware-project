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

<!-- file -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
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
	<main id="main" class="main"> <!-- PageContent -->
	<section class="section">

		<div class="row mt-5">
			<div class="col-lg-8">

				<div class="card profile mt-3">
					<div class="card-header">연장근무 신청서</div>
					<div class="card-body m-4">

						<!-- Form -->
						<!-- General Form Elements -->
						<form class="profile-overview" method="post" id="overtime_form"
							action="${pageContext.request.contextPath}/overtime/write">
							<div class="row">
								<div class="col">
									<div class="row mb-4">
										<input type="hidden" id="empId" name="empId"
											value="${loginEmployee.empId}">
										<div class="col-lg-3 col-md-4 label ">이름</div>
										<div class="col-lg-9 col-md-8">${loginEmployee.name}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">직책</div>
										<div class="col-lg-9 col-md-8">${loginEmployee.gradeName}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">부서</div>
										<div class="col-lg-9 col-md-8">${loginEmployee.deptName}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">팀</div>
										<div class="col-lg-9 col-md-8">${loginEmployee.teamName}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">근무날짜</div>
										<div class="col-sm-6">
											<input id="workDate" name="workDate" type="date"
												class="form-control">

										</div>
									</div>
									<script>
										var today = new Date();
										var date = new Date(today.setDate(today
												.getDate() - 1));
										var year = date.getFullYear();
										var month = ("0" + (1 + date.getMonth()))
												.slice(-2);
										var day = ("0" + date.getDate())
												.slice(-2);
										var yesterday = year + "-" + month
												+ "-" + day;
										console.log(yesterday)
										document.getElementById("workDate")
												.setAttribute("max", yesterday);
									</script>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">근무 시간</div>
										<div class="col-sm-3">
											<input id="workTime" name="workTime" type="number" step="1"
												class="form-control">

										</div>
										<div class="col-2">시간</div>

									</div>
									<div class="row mb-4">
										<div class="col-sm-12 d-flex justify-content-start">
											<button type="submit" class="btn btn-primary"
												form="overtime_form">제출하기</button>
										</div>
									</div>

								</div>
								<!-- ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->
								<div class="col">
									<div class="row mb-4">
										<label class="col-lg-3 col-md-4 label">결재선 선택</label>
										<div class="col-sm-6">
											<button type="button" class="btn btn-sm btn-secondary"
												data-bs-toggle="modal" data-bs-target="#verticalycentered">
												선택</button>
										</div>

									</div>
									<div class="row mb-4">
										<div class="col-10">
											<div id="vacation_line" class="d-flex"></div>
										</div>
									</div>
									<!-- 사유 -->
									<div class="row mb-3">
										<label class="col-sm-4 col-form-label">근무내용</label>
										<div class="col-sm-9">
											<input id="content" name="content" class="form-control"
												style="height: 100px"></input>
										</div>
									</div>



								</div>
							</div>
							<%@ include file="/WEB-INF/views/vacation/form_modal.jsp"%>
						</form>

					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card profile mt-3">
					<div class="card-header">연장 근무현황</div>
					<div class="card-body pt-3 m-0">
						<div class="tab-pane fade show active profile-overview"
							id="profile-overview">

							<div class="row">
								<div class="col-7 label">주 연장 근무 가능 시간</div>
								<div class="col-5">12시간</div>
							</div>


							<div class="row">
								<div class="col-7 label">주 연장 근무 시간</div>
								<div class="col-5">5시간</div>
							</div>

							<div class="row">
								<div class="col-7 label ">주 연장 근무 가능 시간</div>
								<div class="col-5">7시간</div>



							</div>


						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="row" style="height:100px"> </div>
	</section>
	</main>
	<!-- ======================================Main==================================================== -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>