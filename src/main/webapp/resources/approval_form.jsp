<%@ page contentType="text/html; charset=UTF-8" %>
<html>

<head>
	<meta charset="UTF-8">
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
        		<option value="email/eamil_list.html">메일</option>
        		<option value="5">공지사항</option>
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
        		<a class="btn btn-primary" type="button" href="index.html" style="width:100%">
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
        		<ul id="myapproval-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
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
      		<h1>결재 작성</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="#">전자결재</a></li>
          			<li class="breadcrumb-item">결재 작성</li>
        		</ol>
      		</nav>
    	</div>
	
    	<section class="section">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card">
            			<div class="card-body m-4">
             				<!-- General Form Elements -->
              				<form>
              					<div class="row mb-3">
                  					<div class="col-sm-12 d-flex justify-content-end">
                  						<button type="submit" class="btn btn-secondary" style="margin-right: 8px">임시저장</button>
                    					<button type="submit" class="btn btn-primary">결재 제출</button>
                  					</div>
                				</div>
                				<div class="row mb-3">
                  					<label class="col-sm-2 col-form-label"><b>결재 양식</b></label>
                  					<div class="col-sm-4">
                    					<select class="form-select" aria-label="Default select example">
                      						<option selected="">기안서</option>
                      						<option value="1">지출 품위서</option>
                      						<option value="2">사직서</option>
                      						<option value="3">휴일 근무 신청서</option>
                      						<option value="4">연장 근무 신청서</option>
                      						<option value="5">경조사 신청서(결혼)</option>
                      						<option value="6">경조사 신청서(사망)</option>
                      						<option value="7">경조사 신청서(출산)</option>
                      						<option value="8">외근/출장 신청서</option>
                      						<option value="9">근무 상태 변경 신청서</option>
                    					</select>
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>제목</b></label>
                 					<div class="col-sm-10">
                    					<input type="text" class="form-control">
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  				<label for="inputDate" class="col-sm-2 col-form-label"><b>작성 날짜</b></label>
                  					<div class="col-sm-10">
                    					<input type="date" class="form-control">
                  					</div>
                				</div>
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>참조</b></label>
                  				<div class="col-sm-10">
                    				<input type="text" class="form-control">
                  				</div>
                				</div>
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>열람</b></label>
                  					<div class="col-sm-10">
                    					<input type="text" class="form-control">
                  					</div>
                				</div>
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>결재선</b></label>
                  					<div class="col-sm-10">
                  						<div class="row mb-3">
                  							<div class="col-sm-10">
                    							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                    								결재선 선택
              									</button>
              								</div>
              							</div>
              		
	              						<div class="row">
	              							<div class="col-sm-3">
		                    					<div class="card mb-3" style="background-color:#FCF6C2;">
					            					<div class="row g-0">
					              						<div class="col-md-12">
					                						<div class="card-body">
					                  							<div class="row">
					                  								<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
			                    									<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
			                    	  							</div>
					                  							<p>공공사업1 / 솔루션개발팀</p>
					                						</div>
					              						</div>
					            					</div>
					        					</div>
	                    					</div>
	                    					<div class="col-sm-3">
		                    					<div class="card mb-3" style="background-color:#FCF6C2;">
					            					<div class="row g-0">
					              						<div class="col-md-12">
					                						<div class="card-body">
					                  							<div class="row">
					                  								<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
			                    									<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
			                    	  							</div>
					                  							<p>공공사업1 / 솔루션개발팀</p>
					                						</div>
					              						</div>
					            					</div>
					        					</div>
	                    					</div>
	                    					<div class="col-sm-3">
		                    					<div class="card mb-3" style="background-color:#FCF6C2;">
					            					<div class="row g-0">
					              						<div class="col-md-12">
					                						<div class="card-body">
					                  							<div class="row">
					                  								<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
			                    									<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
			                    	  							</div>
					                  							<p>공공사업1 / 솔루션개발팀</p>
					                						</div>
					              						</div>
					            					</div>
					        					</div>
	                    					</div>
	                  					</div>
                					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<div class="col-sm-12">
					                	<!-- ckeditior toolbar -->
					                  	<div id="toolbar-container"></div>
					                  	<!-- End ckeditior toolbar -->
                  
                  						<!-- ckeditior content -->
                  						<div  id="approval-content" name="approval-content" style="height:400px;">
                  							<h3 style="text-align:center;"><strong>휴일 근무 신청서</strong></h3>
											<table class="ck-table-resized"><colgroup><col style="width:12.27%;"><col style="width:27.93%;"><col style="width:16.13%;"><col style="width:43.67%;"></colgroup><tbody><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" colspan="4" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">귀속 부서</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true"><span class="ck-table-bogus-paragraph"><br><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">소속 부서</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" rowspan="2" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">귀속 PJT</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" rowspan="2"><span class="ck-table-bogus-paragraph"><br><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">성명</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">직위</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">유형</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" colspan="3"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" style="background-color:hsl(0, 0%, 90%);"><span class="ck-table-bogus-paragraph">기간</span><div class="ck-table-column-resizer"></div></td><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" colspan="3"><span class="ck-table-bogus-paragraph"><br data-cke-filler="true"></span><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" colspan="4" style="background-color:hsl(0, 0%, 90%);"><p style="text-align:center;">내용</p><div class="ck-table-column-resizer"></div></td></tr><tr><td class="ck-editor__editable ck-editor__nested-editable" role="textbox" contenteditable="true" colspan="4"><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><p><br data-cke-filler="true"></p><div class="ck-table-column-resizer"></div></td></tr></tbody></table>
                  						</div>
                  						<!-- End ckeditior content -->
                  
                  						<!-- ckeditior script-->
                    					<script>
                    						DecoupledEditor
                    							.create( document.querySelector( '#approval-content' ) )
                    							.then( editor => {
                        							const toolbarContainer = document.querySelector( '#toolbar-container' );

                        							toolbarContainer.appendChild( editor.ui.view.toolbar.element );

                        							window.editor = editor;
                    						} )
                    						.catch( err => {
                        						console.error( err );
                    						} );
										</script>
                  						<!-- End ckeditior script-->
                  					</div>
                				</div>

              				</form><!-- End General Form Elements -->

            			</div><!-- End card-body -->
          			</div><!-- End card -->
        		</div>
      		</div>
    	</section><!-- End section -->
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
  
  	<!-- 파일 다중 업로드  -->
  	<script src="../assets/js/file.js"></script>

</body>

</html>