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
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>