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
	color: #004389;
	font-weight: 700;
	font-size: 21px;
}
.profile .profile-overview .label {
    font-weight: 600;
    font-size: 16px;
    color: rgba(1, 41, 112, 0.6);
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main">
	<section class="section">
		<div class="row">
			<div class="col-lg-10">
				<c:if test="${loginEmployee.empId == overtime.approvalEmpId}">
					<div class="pagetitle mt-3">
						<h1>근무결재 문서</h1>
						<ol class="breadcrumb">
			          		<li class="breadcrumb-item">결재 문서함</li>
			          		<li class="breadcrumb-item">근무 신청 목록</li>
		        		</ol>
					</div>
				</c:if>
				<c:if test="${loginEmployee.empId != overtime.approvalEmpId}">
					<div class="pagetitle mt-3">
						<h1>나의 근무 문서</h1>
						<ol class="breadcrumb">
			          		<li class="breadcrumb-item">내 문서함</li>
			          		<li class="breadcrumb-item">근무 신청 목록</li>
		        		</ol>
					</div>
				</c:if>
				<div class="card profile mt-3">
					<div class="card-header  py-2">
						<div class="row">
							<div class="col mt-2">결재 정보</div>
							<c:if test="${loginEmployee.empId == overtime.approvalEmpId && overtime.status eq '대기'}">
								<div class="col d-flex justify-content-end">
									<button type="button" class="btn btn-primary" name="isApproved" style="margin-right: 8px" value="y" onclick="confirm(this)">승인</button>
										
									<button type="button" class="btn btn-danger" name="isApproved" value="n" onclick="confirm(this)">반려</button>
								</div>
							</c:if>
							<fmt:formatDate var="workDate" value="${overtime.workDate}" pattern="yy.MM.dd"/>
							<fmt:formatDate var="approvalDate" value="${overtime.approvalDate}" pattern="yyyy-MM-dd"/>
									
							
						</div>
						<script >
									function confirm (e) {
										
										var type = $(e).attr('value');
										var overtimeId = ${overtime.overtimeId};
										var workDateDetail ='${workDate}';
										console.log(workDateDetail);
										var empId = "${overtime.empId}"
										$.ajax({
											type: "post",
										    url: "${pageContext.request.contextPath}/overtime/process",
										    data: {
										    	type : type,
										    	overtimeId : overtimeId,
										    	workDateDetail : workDateDetail,
										    	empId : empId
										    },
										    success: function(data) {
								    	    	const data1 = $.trim(data);
								    	    	if(data1 == 'success'){
								    	    		location.reload();
								    	    	}else{
								    	    		alert(data);
								    	    	}
								    	    },
								    	    error: function(err) {
								    	    	alert("실패");
								    	    }
										})
									}
								</script>

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
											<c:if test="${overtime.status eq '대기'}">
						                    	<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
						                    </c:if>
											<c:if test="${overtime.status eq '진행'}">
						                    	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
						                    </c:if>						                    
						                    <c:if test="${overtime.status eq '승인'}">
						                    	<td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
						                    </c:if>
						                    <c:if test="${overtime.status eq '반려'}">
						                    	<td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
						                    </c:if>
										</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">승인 날짜</div>
										<div class="col-lg-9 col-md-8">${approvalDate}</div>
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
					<div class="card-header">No.${overtime.overtimeId}</div>
					<div class="card-body pt-4">
						<form class="profile-overview">
							<div class="row">
								<div class="col">
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">문서종류</div>
										<div class="col-lg-9 col-md-8">연장근무</div>
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
										<div class="col-lg-9 col-md-8">${overtime.workTime}시간</div>
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