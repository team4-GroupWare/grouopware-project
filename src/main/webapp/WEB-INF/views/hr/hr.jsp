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
				              	<c:forEach var="team" items="${teamList[status.index]}">
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
	
	  	<main id="main" class="main bg-white">
	    	<section class="section dashboard">
	      		<div class="row">
		        	<div class="col-lg-12">
		          		<div style="text-align: right"><button type="button" class="btn btn-primary">+ 사원추가</button></div>
		          		<!-- ********대표이사******** -->
		          		<h4><b>대표이사</b></h4>
		          		<div class="row align-items-top">
			        		<div class="col-lg-6">
				          		<!-- Card with an image on left -->
				          		<div class="card mb-3">
				            		<div class="row g-0">
				              			<div class="col-md-4">
				                			<img src="assets/img/profile-img.jpg" class="img-fluid rounded-start" style="height:100%">
				              			</div>
				              			<div class="col-md-8">
				                			<div class="card-body">
				                  				<h5 class="card-title"><b>아저씨</b> <span>대표이사</span></h5>
				                  				<div class="row">
				                  					<div class="col-4">
				                  	  					<i class="bi bi-telephone-fill"></i>   <span style="color:#808080">Phone</span>
				                  					</div>
													<div class="col-8">
														<p>010-1111-1111</p>
													</div>
				                  				</div>
				                  				<div class="row">
				                  					<div class="col-4">
				                  	  					<i class="bi bi-envelope"></i>   <span style="color:#808080">Email</span>
				                  					</div>
													<div class="col-8">
														<p>test@mycompany.com</p>
													</div>
				                  				</div>
				                  				<div style="text-align: right">
				                  					<button type="button" class="btn btn-outline-primary">Send Email</button>
				                  				</div>
				                			</div>
				              			</div>
				            		</div>
				          		</div><!-- End Card with an image on left -->
			        		</div>
			      		</div>
			      		<!-- ********대표이사 끝******** -->
			      
			      		<!-- ********이사******** -->
			      		<h4 class="mt-4"><b>이사</b></h4>
			      		<div class="row align-items-top">
			        		<div class="col-lg-6">
			          			<!-- Card with an image on left -->
			          			<div class="card mb-3">
			            			<div class="row g-0">
			              				<div class="col-md-4">
			                				<img src="assets/img/profile-img.jpg" class="img-fluid rounded-start" style="height:100%">
			              				</div>
			              				<div class="col-md-8">
			                				<div class="card-body">
			                  					<h5 class="card-title"><b>이사아저씨</b> <span>이사</span></h5>
			                  					<div class="row">
			                  						<div class="col-4">
			                  	  						<i class="bi bi-telephone-fill"></i>   <span style="color:#808080">Phone</span>
			                  						</div>
													<div class="col-8">
														<p>010-1111-1111</p>
													</div>
			                  					</div>
			                  					<div class="row">
			                  						<div class="col-4">
			                  	  						<i class="bi bi-envelope"></i>   <span style="color:#808080">Email</span>
			                  						</div>
													<div class="col-8">
														<p>test@mycompany.com</p>
													</div>
			                  					</div>
			                  					<div style="text-align: right">
			                  						<button type="button" class="btn btn-outline-primary">Send Email</button>
			                  					</div>
			                				</div>
			              				</div>
			            			</div>
			          			</div><!-- End Card with an image on left -->
			        		</div>
			        		<div class="col-lg-6">
			          			<!-- Card with an image on left -->
			          			<div class="card mb-3">
			            			<div class="row g-0">
			              				<div class="col-md-4">
			                				<img src="assets/img/profile-img.jpg" class="img-fluid rounded-start" style="height:100%">
			              				</div>
			              				<div class="col-md-8">
			                				<div class="card-body">
			                  					<h5 class="card-title"><b>이사아저씨</b> <span>이사</span></h5>
			                  					<div class="row">
			                  						<div class="col-4">
			                  	  						<i class="bi bi-telephone-fill"></i>   <span style="color:#808080">Phone</span>
			                  						</div>
													<div class="col-8">
														<p>010-1111-1111</p>
													</div>
			                  					</div>
			                  					<div class="row">
			                  						<div class="col-4">
			                  	  						<i class="bi bi-envelope"></i>   <span style="color:#808080">Email</span>
			                  						</div>
													<div class="col-8">
														<p>test@mycompany.com</p>
													</div>
			                  					</div>
			                  					<div style="text-align: right">
			                  						<button type="button" class="btn btn-outline-primary">Send Email</button>
			                  					</div>
			                				</div>
			              				</div>
			            			</div>
			          			</div><!-- End Card with an image on left -->
			        		</div>
			      			<!-- ********이사 끝******** -->
			      
			      
			      			<!-- ********부서******** -->
			      			<h4 class="mt-4"><b>공공사업1 Div</b></h4>
			      			<h5 class="mt-2" style="color:#636363"><b>&nbsp;프론트엔드팀</b></h5>
			      			<div class="row align-items-top">
			        			<div class="col-lg-6">
			          				<!-- Card with an image on left -->
			          				<div class="card mb-3">
			            				<div class="row g-0">
			              					<div class="col-md-4">
			                					<img src="assets/img/profile-img.jpg" class="img-fluid rounded-start" style="height:100%">
			              					</div>
			              					<div class="col-md-8">
			                					<div class="card-body">
			                  						<h5 class="card-title"><b>이사아저씨</b> <span>이사</span></h5>
			                  						<div class="row">
			                  							<div class="col-4">
			                  	  							<i class="bi bi-telephone-fill"></i>   <span style="color:#808080">Phone</span>
			                  							</div>
														<div class="col-8">
															<p>010-1111-1111</p>
														</div>
			                  						</div>
			                  						<div class="row">
			                  							<div class="col-4">
			                  	  							<i class="bi bi-envelope"></i>   <span style="color:#808080">Email</span>
			                  							</div>
														<div class="col-8">
															<p>test@mycompany.com</p>
														</div>
			                  						</div>
			                  						<div style="text-align: right">
			                  							<button type="button" class="btn btn-outline-primary">Send Email</button>
			                  						</div>
			                					</div>
			              					</div>
			            				</div>
			          				</div><!-- End Card with an image on left -->
			        			</div>
			        			<div class="col-lg-6">
			          				<!-- Card with an image on left -->
			          				<div class="card mb-3">
			            				<div class="row g-0">
			              					<div class="col-md-4">
			                					<img src="assets/img/profile-img.jpg" class="img-fluid rounded-start" style="height:100%">
			              					</div>
			              					<div class="col-md-8">
			                					<div class="card-body">
			                  						<h5 class="card-title"><b>이사아저씨</b> <span>이사</span></h5>
			                  						<div class="row">
			                  							<div class="col-4">
			                  	  							<i class="bi bi-telephone-fill"></i>   <span style="color:#808080">Phone</span>
			                  							</div>
														<div class="col-8">
															<p>010-1111-1111</p>
														</div>
			                  						</div>
			                  						<div class="row">
			                  							<div class="col-4">
			                  	  							<i class="bi bi-envelope"></i>   <span style="color:#808080">Email</span>
			                  							</div>
														<div class="col-8">
															<p>test@mycompany.com</p>
														</div>
			                  						</div>
			                  						<div style="text-align: right">
			                  							<button type="button" class="btn btn-outline-primary">Send Email</button>
			                  						</div>
			                					</div>
			              					</div>
			            				</div>
			          				</div><!-- End Card with an image on left -->
			        			</div>
			        		</div>
			      		</div>
		        	</div><!-- End Right side columns -->
	      		</div>
			</section>
	  	</main><!-- End #main -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>