<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
	
		<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.rwdImageMaps.js"></script>
		<script>
			$(function(){
				$('img[usemap]').rwdImageMaps();
				$("#group").width("100%");
				$("#group").height("100%");
			});
		</script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- === Sidebar ==== -->
	    <aside id="sidebar" class="sidebar">
	    	<ul class="sidebar-nav" id="sidebar-nav">
	      		<li class="nav-item">
	        		<a class="nav-link " href="${pageContext.request.contextPath}/hr/group">
	          			<i class="bi bi-diagram-3"></i>
	          			<span>조직도</span>
	        		</a>
	      		</li>
	    	</ul>
	    	<ul class="sidebar-nav">
		  		<li class="nav-item">
	        		<a class="nav-link collapse active" data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#" aria-expanded="false">
	          			<span>엑사아이엔티</span><i class="bi bi-chevron-down ms-auto"></i>
	        		</a>
	        		
	        		<ul id="hr-nav" class="nav-content" data-bs-parent="#sidebar-nav">
	        			<c:forEach var="dept" items="${departments}">
		          			<li class="nav-item">
			            		<a class="nav-link collapsed" href="${pageContext.request.contextPath}/hr/list/${dept.deptId}" aria-expanded="false">
			              			${dept.deptName}
			            		</a>
		          			</li>
	          			</c:forEach>
	        		</ul>
		  		</li>
			</ul>
		</aside><!-- End Sidebar-->
		
	  	<main id="main" class="main">
			<section class="section">
	      		<div class="row">
	        		<div class="col-lg-12">
	          			<div class="card" style="height:730px">
	            			<div class="card-body">
	              				<div class="pagetitle" style="margin-top: 25px; margin-left:20px;">
				    				<h1 style="font-size:40px;"><i class="bi bi-diagram-3" style="font-size:40px; margin-right:15px;"></i>조직도</h1>
				    			</div>
				    			<div style="height:630px">
			    					<img id="group" src="${pageContext.request.contextPath}/resources/assets/img/hr.png" usemap="#image-map">
								</div>
								<map name="image-map">
								    <area alt="임원" title="임원" href="${pageContext.request.contextPath}/hr/list/1" coords="759,219,942,276" shape="rect">
								    <area alt="경영지원실" title="경영지원실" href="${pageContext.request.contextPath}/hr/list/5" coords="349,309,529,365" shape="rect">
								    <area alt="공공사업1" title="공공사업1" href="${pageContext.request.contextPath}/hr/list/2" coords="238,513,419,570" shape="rect">
								    <area alt="공공사업2" title="공공사업2" href="${pageContext.request.contextPath}/hr/list/3" coords="736,571,553,514" shape="rect">
								    <area alt="전략사업" title="전략사업" href="${pageContext.request.contextPath}/hr/list/4" coords="872,513,1052,570" shape="rect">
								</map>
	            			</div>
	          			</div>
	        		</div>
	      		</div>
	    	</section>
	  	</main><!-- End main -->
	  	
	  	<!-- ======= Footer ======= -->
  		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		
	</body>
</html>