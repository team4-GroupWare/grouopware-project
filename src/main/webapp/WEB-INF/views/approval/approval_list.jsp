<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
  	<meta content="width=device-width, initial-scale=1.0" name="viewport">

  	<title>엑사아이엔티 그룹웨어</title>
  	<meta content="" name="description">
  	<meta content="" name="keywords">

  	<!-- Favicons -->
  	<link href="assets/img/exaint_logo.png" rel="icon">
  
  	<!-- Google Fonts -->
  	<link href="https://fonts.gstatic.com" rel="preconnect">
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  	<!-- Vendor CSS Files -->
  	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  	<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  	<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  	<!-- Template Main CSS File -->
  	<link href="assets/css/style.css" rel="stylesheet">


  	<!-- 텍스트 에디터 -->
  	<!-- <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script> -->
  	<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/decoupled-document/ckeditor.js"></script>
  	<!-- <script src="../documentckeditor/build/ckeditor.js"></script> -->
  	<style>
    	.ck-editor { height: 800px; }
    	.ck-content { font-size: 12px; }
  	</style>
</head>

<body>
  	<!-- ======= Header ======= -->
  	<header id="header" class="header fixed-top d-flex align-items-center">

    	<div class="d-flex align-items-center justify-content-between">
      		<img src="assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	</div><!-- End Logo -->
    
		<!-- Dropbar -->
		<div class="menudropbar d-flex align-items-center justify-content-between">
      		<select onchange="if(this.value) location.href=(this.value);" class="form-select" aria-label="Default select example">
        		<option value="index2.html">오피스 홈</option>
        		<option value="vacation_document.html">근태관리</option>
        		<option value="hr.html">인사</option>
        		<option value="approval_list.html" selected>전자결재</option>
        		<option value="email/email_list.html">메일</option>
        		<option value="#">공지사항</option>
      		</select>
    	</div><!-- End Dropbar -->
    
    	<nav class="header-nav ms-auto">
      		<ul class="d-flex align-items-center">
        		<li><img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle" width="40px"></li>
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
        		<a class="btn btn-primary" type="button" href="approval_form.html" style="width:100%">
	          		<i class="bi bi-pencil-square"></i> 
	          		<span>결재 작성</span>
        		</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check"></i><span>결재 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
          			</li>
        		</ul>
     		</li><!-- End 결재 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#myapproval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check-fill"></i><span>내 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="myapproval-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#" class="active"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
          			</li>
        		</ul>
      		</li><!-- End 내 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" href="#">
          			<i class="bi bi-eye"></i><span>열람함</span>
        		</a>
      		</li><!-- End 열람함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" href="#">
          			<i class="bi bi-file-earmark"></i><span>임시저장함</span>
        		</a>
      		</li><!-- End 임시저장함 -->
    	</ul>
  	</aside><!-- End Sidebar -->

  	<main id="main" class="main">
    	<div class="pagetitle">
    		<h1>내 문서함</h1>
      			<nav>
		        	<ol class="breadcrumb">
		          		<li class="breadcrumb-item"><a href="index.html">전자결재</a></li>
		          		<li class="breadcrumb-item"><a href="index.html">내 문서함</a></li>
		          		<li class="breadcrumb-item">전체</li>
		        	</ol>
      			</nav>
    	</div><!-- End Page Title -->

		<section class="section">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title"></h5>

              				<!-- Table with hoverable rows -->
              				<table class="table table-hover">
                				<thead>
                  					<tr>
					                    <th scope="col">#</th>
					                    <th scope="col">결재 양식</th>
					                    <th scope="col">제목</th>
					                    <th scope="col">기안자/부서</th>
					                    <th scope="col">상태</th>
					                    <th scope="col">기안일시</th>
                  					</tr>
                				</thead>
                				<tbody>
                  					<tr onClick="location.href='approval_detail.html'">
					                    <th scope="row">1</th>
					                    <td>기안서</td>
					                    <td>[공공사업1 Div] 하반기 기안서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-16</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">2</th>
					                    <td>기안서</td>
					                    <td>대법원 유지보수 기안서</td>
					                    <td>이예승 / 공공사업2 Div</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-12</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">3</th>
					                    <td>휴일 근무 신청서</td>
					                    <td>휴일 근무 신청서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
					                    <td>2023-02-05</td>
                  					</tr>
                  					<tr>
				                    <th scope="row">4</th>
				                    	<td>지출 품위서</td>
					                    <td>[공공사업1 Div/솔루션개발팀] 지출품위서</td>
					                    <td>이연희 / 공공사업1 Div</td>
					                    <td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
					                    <td>2023-02-11</td>
				                  	</tr>
                  					<tr>
					                    <th scope="row">5</th>
					                    <td>연장 근무 신청서</td>
					                    <td>연장 근무 신청서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
					                    <td>2023-02-04</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">6</th>
					                    <td>기안서</td>
					                    <td>신입 멘토링 기안서</td>
					                    <td>최은종 / 경영지원실</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-14</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">7</th>
					                    <td>사직서</td>
					                    <td>사직서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-01</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">8</th>
					                    <td>기안서</td>
					                    <td>기안서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
					                    <td>2023-02-10</td>
                 					</tr>
                  					<tr>
					                    <th scope="row">9</th>
					                    <td>기안서</td>
					                    <td>기안서</td>
					                    <td>작성자/부서</td>
					                    <td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
					                    <td>2023-01-28</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">10</th>
					                    <td>휴일 근무 신청서</td>
					                    <td>휴일 근무 신청서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-09</td>
                  					</tr>
                				</tbody>
              				</table>
             				<!-- End Table with hoverable rows -->
              				<div class="d-flex justify-content-center">
				  				<nav aria-label="Page navigation example">
	                				<ul class="pagination">
	                  					<li class="page-item">
	                    					<a class="page-link" href="#" aria-label="Previous">
	                      						<span aria-hidden="true">«</span>
	                    					</a>
	                  					</li>
	                  					<li class="page-item"><a class="page-link" href="#">1</a></li>
	                  					<li class="page-item"><a class="page-link" href="#">2</a></li>
	                  					<li class="page-item"><a class="page-link" href="#">3</a></li>
	                  					<li class="page-item">
		                    				<a class="page-link" href="#" aria-label="Next">
		                      					<span aria-hidden="true">»</span>
		                    				</a>
	                  					</li>
	                				</ul>
	              				</nav>
              				</div>
            			</div>
          			</div>
        		</div>
      		</div>
    	</section>
  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<footer id="footer" class="footer">
    	<div class="copyright">
      		&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    	</div>
    	<div class="credits">
      		<!-- All the links in the footer should remain intact. -->
      		<!-- You can delete the links only if you purchased the pro version. -->
      		<!-- Licensing information: https://bootstrapmade.com/license/ -->
      		<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      		Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    	</div>
  	</footer><!-- End Footer -->

  	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  	<!-- Vendor JS Files -->
  	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<script src="assets/vendor/chart.js/chart.umd.js"></script>
  	<script src="assets/vendor/echarts/echarts.min.js"></script>
  	<script src="assets/vendor/quill/quill.min.js"></script>
  	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
  	<script src="assets/vendor/php-email-form/validate.js"></script>

  	<!-- Template Main JS File -->
  	<script src="assets/js/main.js"></script>
</body>
</html>