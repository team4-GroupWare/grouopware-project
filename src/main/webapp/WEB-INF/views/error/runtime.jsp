<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
  	<main>
    	<div class="container">

      		<section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
        		<h1>Error</h1>
        		<h2>The page you are looking for doesn't exist.</h2>
        		<a class="btn" href="${pageContext.request.contextPath}/">Back to home</a>
        		<!-- <img src="assets/img/not-found.svg" class="img-fluid py-5" alt="Page Not Found"> -->
      		</section>
    	</div>
    	<div style="display:none">
        	Failed	URL:	${url}
			Exception:		${exception.message}
			<c:forEach	items="${exception.stackTrace}"	var="ste">	
				${ste}	
			</c:forEach>
        </div>
  	</main><!-- End #main -->

  	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  	<!-- ======= Footer ======= -->
	<footer id="footer1" class="footer">
	 	<div class="copyright">
	   		<strong><span>엑사아이엔티 사내그룹웨어</span></strong>
	 	</div>
	 	<div class="credits">
	   		4팀 이지호 이연희 이예승
	 	</div>
	</footer><!-- End Footer -->
	
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/echarts/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
		  	
  	<!-- 추가한 링크 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/schedule.js"></script>
</body>

</html>