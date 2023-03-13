<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
	font-style: italic;
	font-weight: 500;
	font-size: 17px;
}

.profile .profile-overview {
	margin-bottom: 20px;
	font-size: 20px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main">
	<section class="section">
		<div class="row ">
			<div class="row">
				<div class="col-10">
					<div class="card profile mt-3">
						<div class="card-header  py-2">
							<div class="row">
								<div class="col mt-2">결재 정보</div>
								<c:if test="${loginEmployee.empId == overtime.approvalEmpId && overtime.status eq '대기'}">
									<div class="col d-flex justify-content-end">
										<button type="submit" class="btn btn-primary" name="isApproved"
											style="margin-right: 8px" value="y">승인</button>
										<button type="submit" class="btn btn-danger" name="isApproved"
											value="n">반려</button>
									</div>
								</c:if>
								
								
							</div>


						</div>
						<div class="card-body pt-4">
							<div class="tab-pane fade show active profile-overview"
								id="profile-overview">
								<div class="row">
									
									<c:if test="${loginEmployee.empId == overtime.approvalEmpId}">
										<div class="col">
											<div class="row mb-4">
												<div class="col-lg-3 col-md-4 label ">이름</div>
												<div class="col-lg-9 col-md-8">${loginEmployee.name}</div>
											</div>
											<div class="row mb-4">
												<div class="col-lg-3 col-md-4 label ">결재자 부서/팀</div>
												<div class="col-lg-9 col-md-8">${loginEmployee.deptName}/${loginEmployee.teamName}</div>
											</div>
										</div>
									</c:if>
									
									<c:if test="${loginEmployee.empId == overtime.empId}">
										<div class="col">
											<div class="row mb-4">
												<div class="col-lg-3 col-md-4 label ">이름</div>
												<div class="col-lg-9 col-md-8">${employee.name}</div>
											</div>
											<div class="row mb-4">
												<div class="col-lg-3 col-md-4 label ">결재자 부서/팀</div>
												<div class="col-lg-9 col-md-8">${employee.deptName}/${employee.teamName}</div>
											</div>
										</div>
									</c:if>
									<div class="col">
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">결재 상태</div>
											<div class="col-lg-9 col-md-8">
												${overtime.status}
											</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">승인 날짜</div>
											<div class="col-lg-9 col-md-8">${overtime.approvalDate}</div>
										</div>
									</div>
								</div>
								
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--================================================신청자 정보==================================================-->

			<!-- ===================================휴가 신청서============================================= -->
			<div class="col-lg-10">
				<div class="card profile mt-3">
					<div class="card-header">연장근무 신청서</div>
					<div class="card-body pt-4">
						<form class="profile-overview">
							<div class="row">
								<div class="col">
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">문서번호</div>
										<div class="col-lg-9 col-md-8">${overtime.overtimeId}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">이름</div>
										
										<c:if test="${loginEmployee.empId == overtime.empId}">
											<div class="col-lg-9 col-md-8">${overtime.empName}</div>
										</c:if>
										<c:if test="${loginEmployee.empId == overtime.approvalEmpId}">
											<div class="col-lg-9 col-md-8">${employee.name}</div>
										</c:if>
										
									</div>

									<div class="row mb-4">
								
										<fmt:formatDate var="workDate" value="${overtime.workDate}" pattern="yyyy.MM.dd"/>
										<div class="col-lg-3 col-md-4 label">근무날짜</div>
										<div class="col-lg-9 col-md-8">${workDate}</div>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">근무시간</div>
										<div class="col-lg-9 col-md-8">${overtime.workTime}</div>
									</div>


								</div>
								<!-- ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->
								<div class="col">
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">작성날짜</div>
										<fmt:formatDate var="writeDate" value="${overtime.writeDate}" pattern="yyyy.MM.dd"/>
										<div class="col-lg-9 col-md-8">${writeDate}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">부서/팀</div>
										<c:if test="${loginEmployee.empId == overtime.empId}">
											<div class="col-lg-9 col-md-8">${loginEmployee.deptName}/${loginEmployee.teamName}</div>
										</c:if>
										
										<c:if test="${loginEmployee.empId == overtime.approvalEmpId}">
											<div class="col-lg-9 col-md-8">${employee.deptName}/${employee.teamName}</div>
										</c:if>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">근무내용</div>
										<div class="col-lg-9 col-md-8">${overtime.content}</div>
									</div>


								</div>
							</div>

						</form>
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