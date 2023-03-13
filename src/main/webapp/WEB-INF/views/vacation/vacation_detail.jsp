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
								<c:if test="${loginEmployee.empId == vacationDetail.approvalEmpId && vacationDetail.status eq '대기'}">
									<div class="col d-flex justify-content-end">
										<button type="button" class="btn btn-primary" name="isApproved" style="margin-right: 8px" value="y" onclick="confirm(this)">승인</button>
											
										<button type="button" class="btn btn-danger" name="isApproved" value="n" onclick="confirm(this)">반려</button>
											
									</div>
									<script >
										
										function confirm (e) {
											var type = $(e).attr('value');
											var vacationId = ${vacationDetail.vacationId};
											var vacationName ="${vacationDetail.vacationName}";
											
											$.ajax({
												type: "post",
											    url: "${pageContext.request.contextPath}/vacation/process",
											    dataType : "text",
											    data: {
											    	type : type,
											    	vacationId: vacationId,
											    	vacationName : vacationName
											    },
											    success: function (data) {
											    	alert(data);
												},
												error: function(e){
													alert("값을 가져오지 못했습니다.")
												}
											})
										}
									</script>
								</c:if>
							</div>


						</div>
						<div class="card-body pt-4">
							<div class="tab-pane fade show active profile-overview"
								id="profile-overview">
								<div class="row">
									<div class="col">
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">이연희</div>
											<div class="col-lg-9 col-md-8">${vacation.empName}(${vacation.gradeName})</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">결재자 부서/팀</div>
											<div class="col-lg-9 col-md-8">${vacation.deptName}/${vacation.teamName}</div>
										</div>
									</div>
									<div class="col">
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">결재 상태</div>
											<div class="col-lg-9 col-md-8">
												<div class="col-sm-12">대기</div>
											</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">승인 날짜</div>
											<div class="col-lg-9 col-md-8"></div>
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
					<div class="card-header">휴가 신청서</div>
					<div class="card-body pt-4">
						<form class="profile-overview">
							<div class="row">
								<div class="col">
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">작성날짜</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.writeDate}</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label ">이름</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.name}</div>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">부서</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.deptName}</div>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">휴가종류</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.vacationName}</div>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">날짜</div>
										<div class="col-lg-6 col-md-8">
											<table width="100%" border="0" align="left" cellpadding="0"
												cellspacing="0" bordercolor="#ffffff" class="form2"
												style="border-collapse: collapse;">
												<tbody>
													<c:forEach var="vacationDate" items="${vacationDate}">
														<tr>
															<td width="30%" align="left" class="form2">
																<div class="mb-3">${vacationDate.startDateStr}</div>
															</td>

															<td width="15%" align="center" class="form2">
																<div class="mb-3">-</div>
															</td>

															<td width="30%" align="left" class="form2">
																<div class="mb-3"cursor:hand;">${vacationDate.endDateStr}</div>
															</td>

														</tr>
													</c:forEach>


												</tbody>
											</table>
										</div>
									</div>





								</div>
								<!-- ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd -->
								<div class="col">
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">직급</div>
										<div class="col-lg-9 col-md-8">차장</div>
									</div>
									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">팀</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.teamName}</div>
									</div>



									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">일수</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.countDay}</div>
									</div>

									<div class="row mb-4">
										<div class="col-lg-3 col-md-4 label">사유</div>
										<div class="col-lg-9 col-md-8">${vacationDetail.content}</div>
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