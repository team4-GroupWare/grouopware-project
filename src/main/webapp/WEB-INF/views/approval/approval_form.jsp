<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>

  	<!-- 텍스트 에디터 -->
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
        		<a class="nav-link collapsed" href="${pageContext.request.contextPath}/approval/detail">
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
              				<form method="post">
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
                  						<div class="card">
								        	<div class="card-body">
								            	<h5 class="card-title">TinyMCE Editor</h5>
								              <!-- TinyMCE Editor -->
								              	<textarea class="tinymce-editor">
								                	<p>Hello World!</p>
								                	<p>This is TinyMCE <strong>full</strong> editor</p>
								              	</textarea><!-- End TinyMCE Editor -->
								   			</div>
								        </div>
        							</div>
        						</div>
    						</form>
    					</div>
    				</div>
    			</div>
    		</div>
    	</section><!-- End section -->
  	</main><!-- End #main -->

  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>