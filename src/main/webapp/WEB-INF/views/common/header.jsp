<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- =========================Header=============================== -->
<header id="header" class="header fixed-top d-flex align-items-center">

	<!-- Logo -->
	<div class="d-flex align-items-center justify-content-between">
		<img src="${pageContext.request.contextPath}/resources/assets/img/exaint_logo.png" width="100px" height="100px">
	<a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center">
		<span class="d-none d-lg-block">엑사아이엔티</span>
	</a>
	</div>
	
	<!-- Dropbar -->
	<div class="menudropbar d-flex align-items-center justify-content-between">
   		<select onchange="if(this.value) location.href=(this.value);" class="form-select" aria-label="Default select example">
     		<option value="${pageContext.request.contextPath}/">오피스 홈</option>
     		<option value="attendance-status.html">근태관리</option>
     		<option value="${pageContext.request.contextPath}/hr/list">인사</option>
     		<option value="approval_list.html">전자결재</option>
     		<option value="email/email_list.html">메일</option>
     		<option value="5">공지사항</option>
   		</select>
   	</div><!-- End Dropbar -->
	
	<!-- Icons Navigation -->
	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<!-- 프로필 사진 -->
			<li><img src="${pageContext.request.contextPath}/resources/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" width="40px"></li>
			
			<!-- Profile Nav -->
			<li class="nav-item dropdown pe-4">
				<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
					<span class="d-none d-md-block dropdown-toggle ps-2" style="font-size: 18px;">${loginEmployee.name}</span>
				</a>
				<span class=" ps-2">${loginEmployee.deptName} / ${loginEmployee.teamName}</span>
				
				<!-- dropbar -->
				<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
					<li class="dropdown-header">
						<h6>${loginEmployee.name}</h6>
						<span>${loginEmployee.deptName} / ${loginEmployee.teamName}</span>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
					    	<i class="bi bi-person"></i>
					    	<span>My Profile</span>
					  	</a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/employee/logout">
					    	<i class="bi bi-box-arrow-right"></i>
					    	<span>Sign Out</span>
					  	</a>
					</li>
				</ul><!-- End dropbar -->
			</li><!-- End Profile Nav -->
		</ul>
	</nav><!-- End Icons Navigation -->
</header><!-- =========================End Header=============================== -->