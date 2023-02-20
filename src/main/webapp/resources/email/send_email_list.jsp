<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>엑사아이엔티 그룹웨어</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/exaint_logo.png" rel="icon">
  
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
        		<option value="index2.html">오피스 홈</option>
        		<option value="vacation_document.html">근태관리</option>
        		<option value="hr.html">인사</option>
        		<option value="approval_list.html">전자결재</option>
        		<option value="email/email_list.html" selected>메일</option>
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
        <a class="btn btn-primary" type="button" href="email_writeform.html" style="width:100%">
          <i class="bi bi-pencil-square"></i> 
          <span>메일 작성</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed"  href="../email/email_list.html">
          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
        </a>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          <li>
            <a href="../email/send_email_list.html">
              <span>전체</span>
            </a>
          </li>
          <li>
            <a href="../email/email_list.html">
              <span>미수신 메일</span>
            </a>
          </li>
          <li>
            <a href="../email/email_list.html">
              <span>수신 메일</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-star-fill"></i>
          <span>중요 메일함</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-envelope-exclamation"></i>
          <span>임시저장함</span>
        </a>
      </li><!-- End Contact Page Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-trash3-fill"></i>
          <span>휴지통</span>
        </a>
      </li><!-- End Contact Page Nav -->

    </ul>

  </aside><!-- End Sidebar -->

  <main id="main" class="main ">
	  <div class="pagetitle">
	      <h1>보낸 메일함</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="index.html">보낸메일함</a></li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
        

          <div class="card">
            <div class="card-body">
              <div class="card-title d-flex" >
	               <div class="input-group me-auto p-2" style="width:350px">
		             <span class="input-group-text" id="basic-addon1">
		              	<i class="bi bi-search"></i>
		             </span>
	               	<input type="text" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               	<button type="submit" class="btn btn-secondary btn-sm ">검색</button>
	              </div>
	            
	              <div class=" my-auto" style="text-align:right">
	              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
	                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#importantDeleteModal">삭제</button>
	                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
	                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#trashModal">삭제</button>
	              </div>
              </div>

              <!-- Table with hoverable rows -->
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th scope="col" ><input class="form-check-input" type="checkbox"></input></th>
                    <th scope="col">이름</th>
                    <th scope="col">제목</th>
                    <th scope="col">날짜</th>
                    <th scope="col">수신</th>
                  </tr>
                </thead>
                <tbody>
                  <tr onClick="location.href='send_email_detail.html'">
                  	<td><input type="checkbox"></td>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>2016-05-25</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>2014-12-05</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Ashleigh Langosh</td>
                    <td>Finance</td>
                    <td>2011-08-12</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Angus Grady</td>
                    <td>HR</td>
                    <td>2012-06-11</td>
                    <td>미수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>미수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                 	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>수신</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                    <td>수신</td>
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
    
    <!-- 중요메일 삭제시 Modal -->
	<div class="modal fade" id="importantDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 중요메일
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">중요메일입니다.</p>
	        <p> 삭제하시겠습니까? </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메일 그냥 삭제시 Modal -->
	<div class="modal fade" id="trashModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"> 휴지통
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">삭제한 메일은 10일동안 휴지통에 보관됩니다.</p>
	        <p>10일 이후에는 자동으로 영구삭제되며, 복구할 수 없습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메일 영구 삭제시 Modal -->
	<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 영구삭제
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">휴지통의 메일을 지우면 지워진 메일들은 복구할 수 없습니다. </p>
	        <p>메일을 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	    

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