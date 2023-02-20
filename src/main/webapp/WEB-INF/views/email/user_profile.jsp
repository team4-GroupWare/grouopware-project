<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	        <a class="btn btn-primary" type="button" href="../email/email_writeform.html" style="width:100%">
	          <i class="bi bi-person-rolodex"></i> 
	          <span>마이페이지</span>
	        </a>
	      </li><!-- End Dashboard Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed"  href="user_profile.html">
	          <i class="bi bi-person-vcard-fill"></i><span>나의 정보</span><i></i>
	        </a>
	      </li><!-- End Charts Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed">
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
		           <div class="col-4 card-body profile-card pt-4 d-flex flex-column align-items-center">
					  <div class="mb-1" style="width:250px;height:250px">
						 <img src="../assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
					  </div>
		              <h2>아저씨</h2>
		              <p style="color: grey;size:20px">사원</p>
		             <a class="btn btn-primary" href="user_profileupdate.html">회원정보 수정</a>
		            </div>
		            <div class="col-8 card-body pt-3">
		              <div class="tab-content pt-2">
		
		                <div class="tab-pane fade show active profile-overview" id="profile-overview">
		                  <h4 class="card-title"><b>나의 정보</b></h4>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label ">이름</div>
		                    <div class="col-lg-9 col-md-8">아저씨</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">부서</div>
		                    <div class="col-lg-9 col-md-8">공공사업 1Div</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">팀</div>
		                    <div class="col-lg-9 col-md-8">프론트엔드팀</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">직급</div>
		                    <div class="col-lg-9 col-md-8">사원</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">Phone</div>
		                    <div class="col-lg-9 col-md-8">(436) 486-3538 x29071</div>
		                  </div>
		                  
		                   <div class="row">
		                    <div class="col-lg-3 col-md-4 label">생년월일</div>
		                    <div class="col-lg-9 col-md-8">2023-02-14</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">Email</div>
		                    <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
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

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>