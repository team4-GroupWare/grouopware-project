<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원 등록</title>
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

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <!-- Start Logo -->
              <div class="d-flex align-items-center justify-content-between">
      		  <img src="../assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	  	  </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-2 pb-3">
                    <h5 class="card-title text-center pb-0 fs-4"><b>회원등록</b></h5>
                  </div>

                  <form class="row g-3 needs-validation" novalidate>
                    <div class="col-6"  style="width:400px" >
                      <label for="yourName" class="form-label">아이디</label>
                      <input type="text" name="name" class="form-control" id="yourName" required>
                      <div class="invalid-feedback">아이디를 입력해주세요</div>
                    </div>
                    
                    <div class="col-4"  style="width:150px" >
                      <label for="yourName" class="form-label d-none d-lg-block" style="color:white">중복확인</label>
                      <button class="btn btn-secondary btn-sm" type="submit">중복확인</button>
                    </div>
                    
                    
                    
                      <div class="col-12">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요</div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">이름</label>
                      <div class="input-group has-validation">
                        <input type="text" name="username" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">이름을 입력해주세요.</div>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourPhone" class="form-label">전화번호</label>
                      <div class="input-group has-validation">
                        <input type="text" name="userphone" class="form-control" id="yourPhone" required>
                        <div class="invalid-feedback">전화번호를 입력해주세요.</div>
                      </div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourBirthday" class="form-label">생년월일</label>
                      <div class="input-group has-validation" style="width:250px">
                        <input type="date" name="userbirthday" class="form-control" id="yourBirthday"  required>
                        <div class="invalid-feedback">생년월일을 입력해주세요.</div>
                      </div>
                    </div>
                    
                     <div class="col-4" style="width:170px">
                      <label for="yourDepartment" class="form-label">부서</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="userdepartment" id="yourDepartment">
						    <option value="공공사업 1Div">공공사업 1Div</option>
						    <option value="공공사업 2Div">공공사업 2Div</option>
						    <option value="전략사업 Div">전략사업 Div</option>
						    <option value="경영지원실">경영지원실</option>
						  </select>
                      </div>
                    </div>
                    
                     <div class="col-4" style="width:170px">
                      <label for="yourDepartment" class="form-label">팀</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="userdepartment" id="yourDepartment">
						    <option value="솔루션개발팀">솔루션개발팀</option>
						    <option value="프론트엔드팀">프론트엔드팀</option>
						  </select>
                      </div>
                    </div>
                    
                      <div class="col-4 pb-4" style="width:140px">
                      	<label for="yourDepartment" class="form-label">직급</label>
                      	<div class="input-group has-validation">
                        	<select class="form-select" aria-label="Default select example" name="userdepartment" id="yourDepartment">
					    		<option value="대표이사">대표이사</option>
						    	<option value="이사">이사</option>
						    	<option value="부장">부장</option>
						    	<option value="과장">과장</option>
					 	 	</select>
                      	</div>
                    </div>

                  
                    <div class="col-12 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="submit" style="display:inline-block">회원등록</button>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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