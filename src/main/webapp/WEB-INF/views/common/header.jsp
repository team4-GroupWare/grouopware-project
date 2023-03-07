<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- =========================Header=============================== -->
<header id="header" class="header fixed-top d-flex align-items-center">

	<!-- Logo -->
	<div class="d-flex align-items-center justify-content-between" style="margin-right:5px;">
		<a href="${pageContext.request.contextPath}/">
			<img src="${pageContext.request.contextPath}/resources/assets/img/exaint_logo.png" width="100px" height="100px">
		</a>
		<a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center">
			<span class="d-none d-lg-block">엑사아이엔티</span>
		</a>
		<i class="d-xl-none bi bi-list toggle-sidebar-btn"></i>
	</div>
	
	<!-- Dropbar -->
	<div class="menudropbar d-flex align-items-center justify-content-between">
   		<select onchange="if(this.value) location.href=(this.value);" class="form-select" aria-label="Default select example">
     		<option value="${pageContext.request.contextPath}/">오피스 홈</option>
     		<option value="${pageContext.request.contextPath}/attendance/status/info">근태관리</option>
     		<option value="${pageContext.request.contextPath}/hr/list">인사</option>
     		<option value="${pageContext.request.contextPath}/approval/mylist">전자결재</option>
     		<option value="${pageContext.request.contextPath}/email/receivelist">메일</option>
     		<option value="#">공지사항</option>
   		</select>
   	</div><!-- End Dropbar -->
	
	<!-- Icons Navigation -->
	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<!-- 프로필 사진 -->
			
			<!-- Profile Nav -->
			<li class="nav-item dropdown pe-4">
				<%-- <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
					
					<span class="d-none d-md-block pe-1" style="font-size: 18px;">${loginEmployee.name}</span>
					<span class="d-none d-md-block dropdown-toggle pe-1" >${loginEmployee.gradeName}</span>
					<span class="d-none d-md-block">${loginEmployee.deptName} / ${loginEmployee.teamName}</span>
					<img src="${pageContext.request.contextPath}/resources/assets/img/yeoni.png" alt="Profile" class="topprofile rounded-circle pe-0" style="width:40px;"/>
				</a> --%>
				<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown" aria-expanded="false">
		        	<img src="${pageContext.request.contextPath}/resources/assets/img/yeoni.png" alt="Profile" class=" rounded-circle">
		            <span class="d-none d-md-block p-1" style="font-size: 18px;">${loginEmployee.name}</span>
		            <span class="d-none d-md-block dropdown-toggle " >${loginEmployee.gradeName}</span>
		        </a>
				
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
						<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/employee/myPage">
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