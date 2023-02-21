<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	        		<a class="nav-link " href="#">
	          			<i class="bi bi-diagram-3"></i>
	          			<span>인사</span>
	        		</a>
	      		</li>
	    	</ul>
	    	<ul class="sidebar-nav">
		  		<li class="nav-item">
	        		<a class="nav-link collapsed" data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#" aria-expanded="false">
	          			<span>엑사아이엔티</span><i class="bi bi-chevron-down ms-auto"></i>
	        		</a>
	        		
	        		<ul id="hr-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	        			<c:forEach var="dept" items="${departments}" varStatus="status">
	          			<li class="nav-item">
		            		<a class="nav-link collapsed" data-bs-target="#nav-dept${status.count}" data-bs-toggle="collapse" href="#" aria-expanded="false">
		              			<span>${dept.deptName}</span><i class="bi bi-chevron-down ms-auto"></i>
		            		</a>
			            	<ul id="nav-dept${status.count}" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				              	<c:forEach var="team" items="${teams[status.index]}">
				              	<li>
				              		<a href="icons-bootstrap.html"><span style="color:#808080">&nbsp;&nbsp;${team.teamName}</span></a>
				              	</li>
				              	</c:forEach>
			            	</ul>
	          			</li>
	          			</c:forEach>
	        		</ul>
		  		</li>
			</ul>
		</aside><!-- End Sidebar-->
	
	  	<main id="main" class="main">
	    	<!-- <div class="pagetitle">
	    		<h1>내 문서함</h1>
	      			<nav>
			        	<ol class="breadcrumb">
			          		<li class="breadcrumb-item"><a href="index.html">전자결재</a></li>
			          		<li class="breadcrumb-item"><a href="index.html">내 문서함</a></li>
			          		<li class="breadcrumb-item">전체</li>
			        	</ol>
	      			</nav>
	    	</div> -->
			<div>
				<form>
					<div class="input-group me-auto p-2" style="width:350px">
		            	
	               		<input type="text" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               		<button class="input-group-text" id="basic-addon1">
		              		<i class="bi bi-search"></i>
		             	</button>
	              	</div>
				</form>
			</div>
			<section class="section" > 
	      		<div class="row">
	        		<div class="col-lg-10">
	          			<div class="card">
	            			<div class="card-body">
	              				<h5 class="card-title"></h5>
	
	              				<!-- Table with hoverable rows -->
	              				<table class="table table-hover" >
	                				<thead>
	                  					<tr>
						                    <th scope="col" width="20%">이름</th>
						                    <th scope="col" width="25%">휴대폰</th>
						                    <th scope="col" width="25%">이메일</th>
						                    <th scope="col" width="15%">부서</th>
						                    <th scope="col" width="15%">팀</th>
	                  					</tr>
	                				</thead>
	                				<tbody>
	                					<c:forEach var="employee" items="${employees}">
		                  					<tr>
							                    <th scope="row"><img src="${pageContext.request.contextPath}/resources/assets/img/profile_img.png" alt="Profile" class="rounded-circle" width="40px">${employee.name}</th>
							                    <td>${employee.phone}</td>
							                    <td>${employee.empId}@mycompany.com</td>
							                    <td>${employee.deptName}</td>
							                    <td>${employee.teamName}</td>
		                  					</tr>
	                  					</c:forEach>
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
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>