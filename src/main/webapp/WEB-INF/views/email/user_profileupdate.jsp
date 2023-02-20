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

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../assets/vendor/echarts/echarts.min.js"></script>
  <script src="../assets/vendor/quill/quill.min.js"></script>
  <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>