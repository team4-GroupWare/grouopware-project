<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp"%>
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
	<!-- Main -->
	<script>
		function deleteForm() {
			var vacationId = ${vacationDetail.vacationId};
			var empId = "${vacationDetail.empId}"
			var countDay = ${vacationDetail.countDay};
			var vacationCategoryId = ${vacationDetail.vacationCategoryId};
			$.ajax({
				type: "post",
			    url: "${pageContext.request.contextPath}/vacation/delete",
			    dataType : "text",
			    data: {
			    	vacationId : vacationId,
			    	empId : empId,
			    	countDay : countDay,
			    	vacationCategoryId:vacationCategoryId
			    },
			    success: function (data) {
			    	location.replace("${pageContext.request.contextPath}/vacation/list/1");											    	
			    	
				},
				error: function(e){
					alert("값을 가져오지 못했습니다.")
				}
			});
		}
	</script>
	<main id="main" class="main">
		<section class="section">
			
			<div class="row">
				<div class="col-lg-10">
				<c:if test="${loginEmployee.empId == vacationDetail.approvalEmpId}">
					<div class="pagetitle mt-3">
						<h1>휴가 문서</h1>
						<ol class="breadcrumb">
			          		<li class="breadcrumb-item">결재 문서함</li>
			          		<li class="breadcrumb-item">휴가 신청 목록</li>
		        		</ol>
					</div>
				</c:if>
				<c:if test="${loginEmployee.empId != vacationDetail.approvalEmpId}">
					<div class="pagetitle mt-3">
						<h1>나의 휴가 문서</h1>
						<ol class="breadcrumb">
			          		<li class="breadcrumb-item">내 문서함</li>
			          		<li class="breadcrumb-item">휴가 신청 목록</li>
		        		</ol>
					</div>
				</c:if>
					<div class="card profile mt-3">
						<div class="card-header  py-2">
							<div class="row">
								<div class="col mt-2">결재자 / 결재 상태</div>
								<c:if test="${loginEmployee.empId != vacationDetail.approvalEmpId && vacationDetail.status eq '대기'}">
									<div class="col d-flex justify-content-end">
										<button type="button" class="btn btn-danger" name="isApproved"  onclick="deleteForm()">삭제</button>
									</div>
								</c:if>
								<c:if test="${loginEmployee.empId == vacationDetail.approvalEmpId && vacationDetail.status eq '대기'}">
									<div class="col d-flex justify-content-end">
										<button type="button" class="btn btn-primary" name="isApproved" style="margin-right: 8px" value="y" onclick="confirm(this)">승인</button>
										<button type="button" class="btn btn-danger" name="isApproved" value="n" onclick="confirm(this)">반려</button>
									</div>
									<script>
										function confirm (e) {
											var type = $(e).attr('value');
											var vacationId = ${vacationDetail.vacationId};
											var vacationName ='${vacationDetail.vacationName}';
											var empId = "${vacationDetail.empId}"
											var vacationCategoryId = ${vacationDetail.vacationCategoryId};
											$.ajax({
												type: "post",
											    url: "${pageContext.request.contextPath}/vacation/process",
											    dataType : "text",
											    data: {
											    	type : type,
											    	vacationName: vacationName,
											    	vacationId : vacationId,
											    	empId : empId,
											    	vacationCategoryId:vacationCategoryId
											    },
											    success: function (data) {
											    	location.reload();											    	
											    	
												},
												error: function(e){
													alert("값을 가져오지 못했습니다.")
												}
											});
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
											<div class="col-lg-3 col-md-4 label ">이름</div>
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
												<c:if test="${vacationDetail.status eq '대기'}">
							                    	<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
							                    </c:if>
												<c:if test="${vacationDetail.status eq '진행'}">
							                    	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
							                    </c:if>						                    
							                    <c:if test="${vacationDetail.status eq '승인'}">
							                    	<td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
							                    </c:if>
							                    <c:if test="${vacationDetail.status eq '반려'}">
							                    	<td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
							                    </c:if>
											</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label ">결재 날짜</div>
											<fmt:formatDate var="workDate" value="${vacationDetail.vacationApprovalDate}" pattern="yyyy-MM-dd"/>
											<div class="col-lg-9 col-md-8">${workDate}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 신청자 정보 -->
				<!-- 휴가 신청서 -->
				<div class="col-lg-10">
					<div class="card profile mt-3">
						<div class="card-header">No.${vacationDetail.vacationId}</div>
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
											<div class="col-lg-9 col-md-8">${vacationDetail.countDay}일</div>
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