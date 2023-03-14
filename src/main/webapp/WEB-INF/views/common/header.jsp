<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ===== Header ===== -->
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
     		<option value="#">메뉴</option>
     		<option value="${pageContext.request.contextPath}/">오피스 홈</option>
     		<option value="${pageContext.request.contextPath}/attendance/info">근태관리</option>
     		<option value="${pageContext.request.contextPath}/hr/group">인사</option>
     		<option value="${pageContext.request.contextPath}/approval/mylist">전자결재</option>
     		<option value="${pageContext.request.contextPath}/email/receivelist">메일</option>
     		<option value="${pageContext.request.contextPath}/board/list/1">공지사항</option>
   		</select>
   		<!-- <div>
   			<i class="bi bi-clock fs-5" ></i>근태관리
   		</div>
   		<div>
   			<i class="bi bi-person-video fs-5" ></i>인사
   		</div>
   		<div>
   			<i class="bi bi-clock fs-5" ></i>근태관리
   		</div> -->
   		
   	</div><!-- End Dropbar -->
	
	<!-- Icons Navigation -->
	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
			<!-- Profile Nav -->
			<li class="nav-item dropdown pe-4">
				<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown" aria-expanded="false">
		        	<c:if test="${loginEmployee.profileData eq null}">
		        	<img src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png" alt="Profile" class=" rounded-circle">
		            </c:if>
		            <c:if test="${loginEmployee.profileData ne null}">
		        	<img src="${pageContext.request.contextPath}/employee/img?empId=${loginEmployee.empId}" alt="Profile" class=" rounded-circle">
		            </c:if>
		            
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
					    	<span>마이 페이지</span>
					  	</a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/employee/logout">
					    	<i class="bi bi-box-arrow-right"></i>
					    	<span>로그아웃</span>
					  	</a>
					</li>
				</ul><!-- End dropbar -->
			</li><!-- End Profile Nav -->
		</ul>
	</nav><!-- End Icons Navigation -->
</header><!-- ==== End Header ===== -->