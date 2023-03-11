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
td.form10b {
	background-color: #f4f4f4;
}

.card-header.header1 {
	background-color: #c1d3e4;
	color: black;
}

.card-header.header2 {
	background-color: #a3a3a3;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main"> <!-- PageContent -->
	<section class="section">
		<div class="row mt-3">
			<div class="col-lg-10 ">
				<div class="card" style="">
					<div class="card-header header1">결재자 / 결재 상태</div>
					<table style="border-collapse: collapse;" 1" cellspacing="0"
						cellpadding="0" border-color="#000000 "
						class="my-0 form10 table table-bordered card-table table">

						<tbody style='vertical-align: middle; border-color: #afb9c3;'>
							<tr>
								<td height="85" colspan="3" align="center" class="form10b">결재
									담당자</td>
								<td align="center" class="form10">${vacation.empName}(${vacation.gradeName})</td>
								<td align="center" class="form10b">승인</td>
								<td align="center" class="form10">${vacationDetail.status}</td>
							</tr>
							<tr>
								<td width="25%" height="85" colspan="3" align="center"
									class="form10b">부서</td>
								<td width="25%" align="center" class="form10">${vacation.deptName}</td>
								<td width="25%" align="center" class="form10b">팀</td>
								<td width="25%" align="center" class="form10">${vacation.teamName}</td>

							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10">


				<div class="card">
					<div class="card-header header2">휴가 문서</div>
					<table style="border-collapse: collapse; height: 450px;"
						1" cellspacing="0" cellpadding="0" border-color="#000000 "
						class="form10 table table-bordered card-table table my-0">

						<tbody style='vertical-align: middle; border-color: #afb9c3;'>

							<tr height="10%">
								<td width="25%" height="50" colspan="3" align="center"
									class="form10b">문서번호</td>
								<td width="25%" align="center" class="form10">${vacationDetail.vacationId}</td>
								<td width="25%" align="center" class="form10b">작성일자</td>
								<td width="25%" align="center" class="form10">${vacationDetail.writeDate}</td>
							</tr>

							<tr height="10%">
								<td height="50" colspan="3" align="center" class="form10b">이름</td>
								<td align="center" class="form10">${vacationDetail.name}</td>
								<td align="center" class="form10b">직급</td>
								<td align="center" class="form10">차장</td>
							</tr>

							<tr height="10%">
								<td height="50" colspan="3" align="center" class="form10b">부서</td>
								<td align="center" class="form10">${vacationDetail.deptName}</td>
								<td align="center" class="form10b">팀</td>
								<td align="center" class="form10">${vacationDetail.teamName}</td>

							</tr>
							<tr height="10%">
								<td height="50" colspan="3" align="center" class="form10b">종류</td>
								<td align="center" class="form10">${vacationDetail.vacationName}</td>
								<td align="center" class="form10b">일수</td>
								<td align="center" class="form10">${vacationDetail.countDay}</td>

							</tr>
							<tr height="30%">
								<td height="50" colspan="3" align="center" class="form10b">사유</td>
								<td align="left" valign="top" class="form10">
									<div id="as2">${vacationDetail.content}</div>
								</td>

								<td align="center" class="form10b">날짜</td>
								<td align="left" class="form10">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" bordercolor="#ffffff" class="form2"
										style="border-collapse: collapse;">
										<tbody>
											<c:forEach var="vacationDate" items="${vacationDate}">
												<tr>
													<td width="48%" align="center" class="form2">
														<div class="mb-3" >${vacationDate.startDateStr}</div>
													</td>

													<td width="4%" align="center" class="form2">
														<div class="mb-3" >-</div>
													</td>

													<td width="48%" align="center" class="form2">
														<div class="mb-3" cursor:hand;">${vacationDate.endDateStr}</div>
													</td>

												</tr>
											</c:forEach>


										</tbody>
									</table>
								</td>


							</tr>

						</tbody>
					</table>
				</div>
				<br> <br>

			</div>

		</div>
	</section>
	</main>
	<!-- ======================================Main==================================================== -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>