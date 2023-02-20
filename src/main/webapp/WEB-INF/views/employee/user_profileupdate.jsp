<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Users / Profile - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body> 

  <!-- ======= Header ======= -->
  	<header id="header" class="header fixed-top d-flex align-items-center">

    	<div class="d-flex align-items-center justify-content-between">
      		<img src="../assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="../index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	</div><!-- End Logo -->
    
		<!-- Dropbar -->
		<div class="menudropbar d-flex align-items-center justify-content-between">
      		<select onchange="if(this.value) location.href=(this.value);" class="form-select" aria-label="Default select example">
        		<option value="index2.html" selected>오피스 홈</option>
        		<option value="vacation_document.html">근태관리</option>
        		<option value="hr.html">인사</option>
        		<option value="approval_list.html">전자결재</option>
        		<option value="email/email_list.html" >메일</option>
        		<option value="#">공지사항</option>
      		</select>
    	</div><!-- End Dropbar -->
    
    	<nav class="header-nav ms-auto">
      		<ul class="d-flex align-items-center">
        		<li><img src="../assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" width="40px"></li>
        		<li class="nav-item dropdown pe-4">
          			<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            			<span class="d-none d-md-block dropdown-toggle ps-2" style="font-size: 18px;">이지호</span>
          			</a>
          			<span class=" ps-2">공공사업1 Div / 솔루션 개발팀</span>
          			<!-- End Profile Iamge Icon -->
          			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            			<li class="dropdown-header">
              				<h6>이지호</h6>
              				<span>공공사업1 Div / 솔루션 개발팀</span>
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
			              	<a class="dropdown-item d-flex align-items-center" href="#">
				                <i class="bi bi-box-arrow-right"></i>
				                <span>Sign Out</span>
			              	</a>
			        	</li>
          			</ul><!-- End Profile Dropdown Items -->
        		</li><!-- End Profile Nav -->
      		</ul>
    	</nav><!-- End Icons Navigation -->
  	</header><!-- End Header -->

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
  <main id="main" class="main">

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
	           <div class="col-lg-4 col-xs-12 card-body profile-card pt-4 d-flex flex-column align-items-center">
				  <div class="mb-1" style="width:250px;height:250px">
					 <img src="../assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
					 <div  style="text-align:center;vertical-align:middle">
					  	  <input id="my-input" type="file" style="visibility: hidden" />
                          <button onclick="onClickUpload()" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></button>
                          <script>
					        function onClickUpload() {
					            let myInput = document.getElementById("my-input");
					            myInput.click();
					        }
					    </script>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                      </div>
				  </div>
				  <div style="text-align:center;margin-top:60px">
	              	<h2>아저씨</h2>
             	  	<p style="color: grey;size:20px">사원</p>
	              </div>
	            </div>
	            <div class="col-lg-8 col-xs-12 card-body pt-3">
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
	                  
	                  <form>
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">Phone</div>
		                    <input name="phone" type="text" class="form-control" id="Phone" value="(436) 486-3538 x29071" style="width:250px">
		                  </div>
		                  
                     </form>
		                  
	                   <div class="row">
	                    <div class="col-lg-3 col-md-4 label">생년월일</div>
	                    <div class="col-lg-9 col-md-8">2023-02-14</div>
	                  </div>
	                
	
	                  <div class="row">
	                    <div class="col-lg-3 col-md-4 label">Email</div>
	                    <div class="col-lg-9 col-md-8">k.anderson@example.com</div>
	                  </div>
	                </div>
	              </div><!-- End Bordered Tabs -->
	            </div>
	            <div style="width:300px;text-align:center" class="mx-auto">
	            	<a class="btn btn-primary" href="user_profile.html">수정 완료</a>
	            </div>
            </div>
          </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <!-- End Footer -->

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>