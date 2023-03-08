<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		  <!-- =========================sideber=============================== -->
		<aside id="sidebar" class="sidebar">
			<ul class="sidebar-nav" id="sidebar-nav">
				<!--휴가 작성 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/form'">
					<a class="btn btn-primary" type="button" href="#" style="width:100%">
					    <i class="bi bi-pencil-square"></i> 
					    <span>휴가 작성</span>
				  	</a>
				</li>
				<!--근무 현황 -->
				<li class="nav-item"  onclick="location.href='${pageContext.request.contextPath}/attendance/status/info'">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/attendance/dept'">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span>
				  	</a>
				</li>
			
				<!--내 휴가 문서 -->
				<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/my'" >
					<a class="nav-link collapsed" data-bs-target="#document2-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>내 휴가</span>
					</a>
					
				</li>
			
				<!--휴가 결제 문서 -->
				<li class="nav-item"  >
					<a class="nav-link collapsed" data-bs-target="#document1-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 결제 문서</span>
					</a>
				</li>
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ======================================Main==================================================== -->
		<main id="main" class="main">
			
			<!-- 페이지 제목 -->
			<div class="pagetitle">
				<h1>휴가 문서</h1>
				<nav>
					<ol class="breadcrumb">
				    	<li class="breadcrumb-item"><a href="index.html">근태관리</a></li>
				    	<li class="breadcrumb-item"><a href="index.html">휴가 문서</a></li>
				  	</ol>
				</nav>
			</div>
		
			<!-- 페이지 내용 -->
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<div class="card mt-2">
							<div class="card-body mt-3">
								<div class="row">
									<div class="col-lg-6">
										<table class="table table-bordered" style="border-collapse: collapse; width: 100%; height:800px;" border="1"><colgroup><col style="width: 13.3971%;" data-mce-style="width: 13.3971%;"><col style="width: 18.0223%;"><col style="width: 23.764%;"><col style="width: 21.6855%;"><col style="width: 23.1311%;"></colgroup><tbody><tr style="height: 0.5px;"><td colspan="5" rowspan="2" style="text-align: center; height: 129.469px;"><p><span style="font-size: 24pt;" data-mce-style="font-size: 24pt;"><strong>휴가 신청서</strong></span><br></p><p><strong><br data-mce-bogus="1"></strong></p></td></tr><tr style="height: 128.969px;"></tr><tr style="height: 22.3906px;"><td colspan="2" style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">문서번호<br></td><td style="height: 22.3906px; text-align: center;"><br></td><td style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">작성일자</td><td style="height: 22.3906px; text-align: center;"><br></td></tr><tr style="height: 22.3906px;"><td colspan="2" style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">이름<br></td><td style="height: 22.3906px; text-align: center;"><br></td><td style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">부서(팀)</td><td style="height: 22.3906px; text-align: center;"><br></td></tr><tr style="height: 22.3906px;"><td colspan="2" style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">제목<br></td><td style="height: 22.3906px; text-align: center;" colspan="3"><br></td></tr><tr style="height: 22.3906px;"><td rowspan="3" style="height: 89.5624px; text-align: center; background-color: rgb(233, 239, 255);">신청내용</td><td style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">휴가종류</td><td colspan="3" style="height: 22.3906px; text-align: center;"><br></td></tr><tr style="height: 22.3906px;"><td style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">날짜</td><td colspan="3" style="height: 22.3906px; text-align: center;"><br></td></tr><tr style="height: 22.3906px;"><td style="height: 22.3906px; text-align: center; background-color: rgb(233, 239, 255);">신청사유</td><td colspan="3" style="height: 22.3906px; text-align: center;"><br></td></tr><tr><td rowspan="5" style="text-align: center; background-color: rgb(233, 239, 255);" data-mce-style="text-align: center; background-color: rgb(233, 239, 255);">첨부파일</td><td colspan="4" rowspan="5" style="text-align: center;"><br></td></tr><tr></tr><tr></tr><tr></tr><tr></tr></tbody></table>
									</div>
								</div>
							 </div>	
									
						</div><!-- End Card -->
					</div>
				</div>
			</section>
		</main><!-- ======================================Main==================================================== -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>