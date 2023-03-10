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
	<!-- =========================sideber=============================== -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<!--휴가 작성 -->
			<li class="nav-item"
				onclick="location.href='${pageContext.request.contextPath}/vacation/form'">
				<a class="btn btn-primary" type="button" href="#"
				style="width: 100%"> <i class="bi bi-pencil-square"></i> <span>휴가
						작성</span>
			</a>
			</li>
			<!--근무 현황 -->
			<li class="nav-item"
				onclick="location.href='${pageContext.request.contextPath}/attendance/status/info'">
				<a class="nav-link collapsed" href="#"> <i class="bi bi-eye"></i>
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
			<li class="nav-item"
				onclick="location.href='${pageContext.request.contextPath}/vacation/list/1'">
				<a class="nav-link collapsed" data-bs-target="#document2-nav"
				data-bs-toggle="collapse" href="#"> <i class="bi bi-eye"></i> <span>나의
						휴가</span>
			</a>

			</li>

			<!--휴가 결제 문서 -->
			<li class="nav-item"
				onclick="location.href='${pageContext.request.contextPath}/vacation/list/2'">
				<a class="nav-link collapsed" data-bs-target="#document1-nav"
				data-bs-toggle="collapse" href="#"> <i class="bi bi-eye"></i> <span>휴가
						결재 문서</span>
			</a>
			</li>
		</ul>
	</aside>
	<!-- ======================================End Sidebar ============================================ -->
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main"> <!-- PageContent -->
	<section class="section">

		<div class="row mt-5">
			<div class="col-lg-7">
				<!-- <table id="vertical-1" 
							style="width:50%; box-shadow: 0px 0 30px rgb(1 41 112 / 10%);border: none;  border-radius: 5px;">
				            <tr style="height: 50px; vertical-align:middle; ">
				                <th class="ps-2" style="background-color:#004389; width:10%; color:white">잔여 휴가 일수</th>
				                <td class="ps-2" style="width: 15%;background-color:white">18일</td>
				                <th class="ps-2" style="background-color:#004389; width:10%;color:white">대체 연차</th>
				                <td class="ps-2" style="width: 15%;background-color:white">출산(90일)</td>
				            </tr>
						</table> -->

							<div class="card" ">
							  <div class="card-header">
							    Table in a card
							  </div>
							  <table class="card-table table">
							    <thead>
							      <tr>
							        <th scope="col">문서 번호</th>
							        <th scope="col">#3</th>
							      </tr>
							      <tr>
							        <th scope="col">승인</th>
							        <th scope="col">대기상태</th>
							      </tr>
							     
							    </thead>
							    <tbody>
							      <tr>
							        <td rowspan="3">Name 01</td>
							        <td>data 1</td>
							      </tr>
							      <tr>
							        <td class="not-first-cell">data 2</td>
							      </tr>
							      <tr>
							        <td class="not-first-cell">data 3</td>
							      </tr>
							      <tr>
							        <td rowspan="2">Name 02</td>
							        <td class="not-first-cell">data 1</td>
							      </tr>
							      <tr>
							        <td class="not-first-cell">data 2</td>
							      </tr>
							    </tbody>
							  </table>
							</div>
					<br><br>

			</div>
			<div class="col-5">
				<div class="card profile mt-3">
					<div class="card-header">신청자 정보</div>
					<div class="card-body pt-3">
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
				<div class="card profile mt-3">
					<div class="card-header">연차 보유현황</div>
					<div class="card-body pt-3">
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