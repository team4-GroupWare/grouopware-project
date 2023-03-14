<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		  <!-- ======= Sidebar ======= -->
		  <aside id="sidebar" class="sidebar">
		    <ul class="sidebar-nav" id="sidebar-nav">
		
		      <li class="nav-item">
		        <a class="btn btn-primary" type="button" style="width:100%">
		          <i class="bi bi-person-rolodex"></i> 
		          <span>마이페이지</span>
		        </a>
		      </li><!-- End Dashboard Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/employee/myPage">
		          <i class="bi bi-person-vcard-fill"></i><span>나의 정보</span><i></i>
		        </a>
		      </li><!-- End Charts Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/employee/change">
		          <i class="bi bi-key-fill"></i>
		          <span>비밀번호 변경</span>
		        </a> 
		      </li><!-- End Profile Page Nav -->
		    </ul>
		  </aside><!-- End Sidebar -->
		  <!-- ======= Main====== -->
		  <main id="main" class="main" >
		
		    <div class="pagetitle mt-2">
		      <h1>마이페이지</h1>
		      <nav>
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
		          <li class="breadcrumb-item">Users</li>
		          <li class="breadcrumb-item active">마이페이지</li>
		        </ol>
		      </nav>
		    </div><!-- End Page Title -->
		    <section class="section profile">
		      <div class="row">
		          <div class="card col-9">
		          	<div class="row my-4">
			           <div class="col-md-5 card-body profile-card pt-4 d-flex flex-column align-items-center" style="text-align:center">
						  <c:if test="${loginEmployee.profileData eq null}">
						  <div class="mb-1" style="width:100%">
							<img id="profile-image" src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
						  </div>
						  </c:if>
						  <c:if test="${loginEmployee.profileData ne null}">
						  <div class="mb-1" style="width:100%">
							<img id="profile-image" src="${pageContext.request.contextPath}/employee/img?empId=${loginEmployee.empId}" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
						  </div>
						  </c:if>
			              <h2>${employee.name}</h2>
			              <p style="color: grey;size:20px">${employee.gradeName}</p>
			             <a class="btn btn-primary" href="${pageContext.request.contextPath}/employee/myUpdate">회원정보 수정</a>
			            </div>
			            <div class="col-md-7 card-body pt-3">
			              <div class="tab-content pt-2">
			
			                <div class="tab-pane fade show active profile-overview" id="profile-overview">
			                  <h4 class="card-title"><b>나의 정보</b></h4>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label ">이름</div>
			                    <div class="col-lg-9 col-md-8">${employee.name}</div>
			                  </div>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label">부서</div>
			                    <div class="col-lg-9 col-md-8">${employee.deptName}</div>
			                  </div>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label">팀</div>
			                    <div class="col-lg-9 col-md-8">${employee.teamName}</div>
			                  </div>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label">직급</div>
			                    <div class="col-lg-9 col-md-8">${employee.gradeName}</div>
			                  </div>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label">Phone</div>
			                    <div class="col-lg-9 col-md-8">${employee.phone}</div>
			                  </div>
			                  
			                   <div class="row">
			                    <div class="col-lg-3 col-md-4 label">생년월일</div>
			                    <div class="col-lg-9 col-md-8">${employee.birth}</div>
			                  </div>
			
			                  <div class="row">
			                    <div class="col-lg-3 col-md-4 label">Email</div>
			                    <div class="col-lg-9 col-md-8">${employee.empId}@exaient.com</div>
			                  </div>
			
			                </div>
			
			                <div class="tab-pane fade profile-edit pt-3" id="profile-edit"></div>
			            </div>
		           	</div>
		          </div>
		      	</div>
		      </div>
		    </section>
  		</main><!-- End #main -->
  <!-- ======= Footer ======= -->
 	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>