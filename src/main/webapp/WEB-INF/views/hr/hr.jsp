<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/resources/assets/css/empinfomodal.css" rel="stylesheet">

		<%@ include file="/WEB-INF/views/common/head.jsp" %>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  	<!-- ======= Sidebar ======= -->
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
					<div class="col-12 d-flex justify-content-between">
						<div class="col-6 pagetitle">
			      			<h1>주소록</h1>
			    		</div>
			    		<div class="col-6" style="text-align:right">
							<button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/employee/register'">+ 사원 추가</button>
						</div>
					</div>
					
				</div>
				<div class="row">
					<form name="emp-search">
						<div class="input-group me-auto p-2" style="width:600px">
							<select name="type" style="margin-right:10px; border-radius: 10px; width:150px;">
								<option selected value="">검색 내용 선택</option>
								<option value="deptName">부서</option>
								<option value="teamName">팀</option>
								<option value="name">이름</option>
							</select>
		               		<input name="keyword" type="text" class="form-control" placeholder="검색" aria-label="검색" aria-describedby="basic-addon1" value=""></input>
		               		<button class="input-group-text" id="basic-addon1" onclick="searchEmp()">
			              		<i class="bi bi-search"></i>
			             	</button>
		              	</div>
					</form>
					<script>
						//검색
						function searchEmp() {
							console.log("searchEmp() 실행");
							var keyword = $('input[name=keyword]').val();
							var type = $("select[name=type]").val();

							$.ajax({
								type: "GET",
								url: "${pageContext.request.contextPath}/hr/list" +
										"?type=" + type + "?keyword=" + keyword,
								sueccess: function(result) {
									console.log("searchEmp() 성공");
								},
								error: function(request,status,error){
							        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							    }
							})
						}
					</script>
				</div>
	      		<div class="row">
	        		<div class="col-lg-12">
	          			<div class="card" style="height:650px">
	            			<div class="card-body">
	              				<h5 class="card-title"></h5>
	              				<!-- Table with hoverable rows -->
	              				<table id="emptable" class="table table-hover" >
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
		                  					<tr class="modal-open" onclick="javascript:empInfo('${employee.empId}')" style="cursor:pointer;">
							                    <th scope="row">
							                    	<c:if test="${employee.profileData ne null}">
                                    <img
                                      src="${pageContext.request.contextPath}/employee/img?empId=${employee.empId}"
                                      alt="Profile" class="rounded-circle" style="margin-right: 8px"
                                      width="30px">
                                    </c:if>
                                    <c:if test="${employee.profileData eq null}">
                                    <img
                                      src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png"
                                      alt="Profile" class="rounded-circle" style="margin-right: 8px"
                                      width="30px">
                                    </c:if>
							                    	${employee.name} <span>(${employee.gradeName})</span>
							                    </th>
							                    <td>${employee.phone}</td>
							                    <td>${employee.empId}@mycompany.com</td>
							                    <td>${employee.deptName}</td>
							                    <td>${employee.teamName}</td>
		                  					</tr>
	                  					</c:forEach>
	                				</tbody>
	              				</table>
	             				<!-- End Table with hoverable rows -->
	            			</div>
	            			<div class="d-flex justify-content-center" style="vertical-align:bottom">
				  				<nav aria-label="Page navigation example">
	                				<ul class="pagination">
	                					<li class="page-item">
	                    					<a class="page-link" href="${deptId}?pageNo=1&type=${type}&keyword=${keyword}" aria-label="Previous">
	                      						<span aria-hidden="true">처음</span>
	                    					</a>
	                  					</li>	
	                					<c:if test="${pager.groupNo>1}">
		                  					<li class="page-item">
		                    					<a class="page-link" href="${deptId}?pageNo=${pager.startPageNo-1}&type=${type}&keyword=${keyword}" aria-label="Previous">
		                      						<span aria-hidden="true">이전</span>
		                    					</a>
		                  					</li>
	                  					</c:if>
	                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
	                  						<c:if test="${pager.pageNo != i}">
												<li class="page-item"><a class="page-link" href="${deptId}?pageNo=${i}&type=${type}&keyword=${keyword}">${i}</a></li>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<li class="page-item active"><a class="page-link" href="${deptId}?pageNo=${i}&type=${type}&keyword=${keyword}">${i}</a></li>
											</c:if>
										</c:forEach>
										
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<li class="page-item">
			                    				<a class="page-link" href="${deptId}?pageNo=${pager.endPageNo+1}&type=${type}&keyword=${keyword}" aria-label="Next">
			                      					<span aria-hidden="true">다음</span>
			                    				</a>
		                  					</li>
										</c:if>
										<li class="page-item">
	                    					<a class="page-link" href="${deptId}?pageNo=${pager.totalPageNo}&type=${type}&keyword=${keyword}" aria-label="Previous">
	                      						<span aria-hidden="true">맨끝</span>
	                    					</a>
	                  					</li>	
	                				</ul>
	              				</nav>
	              			</div>
	          			</div>
	        		</div>
	      		</div>
	      		<script>
	      			//사원 정보 모달
	      			function empInfo(empId) {
	      				$.ajax({
	      					url: "${pageContext.request.contextPath}/employee/empinfo",
	      					data: {"empId" : empId},
	      					type: "GET"
	      				}).done((result) => {
      						var img = "";
      						
      						if(result.profileData == null) {
      							img += '<img src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png"' 
      									+ 'alt="Profile" class="rounded-circle" width="200px">';
      							
      						} else if(result.profileData != null) {
      							img += '<img src="${pageContext.request.contextPath}/employee/img?empId=' + result.empId
  										+ '" alt="Profile" class="rounded-circle" width="200px">';
      						}
      						$('#empProfile').html(img);
      						$('#empName').html(result.name);
      						$('#empGrade').html(result.gradeName);
      						$('#empDept').html(result.deptName);
      						$('#empTeam').html(result.teamName);
      						$('#empEmail').html(result.empId + "@mycompany.com");
      						$('#empPhone').html(result.phone);
      						$('#writeemail').prop('href', '${pageContext.request.contextPath}/email/writedirect?empId='+result.empId);
      						$('#updateEmployee').prop('href', '${pageContext.request.contextPath}/employee/updateemployee?empId='+result.empId);
      						$("#popup").css('display','flex').hide().fadeIn();
						})
	      			};
	      			
					$(function(){
						  $("#confirm").click(function(){
						      modalClose();
						      //컨펌 이벤트 처리
						  });
						  $("#close").click(function(){
						      modalClose();
						  });
						  function modalClose(){
						    $("#popup").fadeOut();
						  }
					});
				</script>
				<!-- 사원 정보 모달 -->
	      		<div class="popup-wrap" id="popup">
					<div class="popup">
				    	<div class="popup-head">
				        	<span class="head-title"></span>
				      	</div>
				      	<div class="popup-body">
				        	<div class="body-content">
				          		<div class="body-titlebox mb-4">
				          			<div id="empProfile">
				          			</div>
				          		</div>
				          		<div class="body-contentbox" style="margin:0 50px;">
				          			<div class="d-flex">
				          				<h5 id="empName" style="font-weight:bold; margin-right:10px"></h5>
				            			<span id="empGrade"></span>
				          			<a id="updateEmployee"style="margin-left:9px"><i style="font-size:20px" class="bi bi-pencil-fill"></i></a>
				          			</div>
				            		<div class="d-flex">
				            			<span style="font-weight:bold; margin-right:10px">소속</span>
				          				<span id="empDept"></span>
				            			 / <span id="empTeam"></span>
				          			</div>
				            		<div>
				            			<i class="ri-mail-line" style="font-weight:bold; margin-right:10px"></i>
				            			<span id="empEmail"></span>
				            		</div>
				            		<div>
				            			<i class="ri-phone-line" style="font-weight:bold; margin-right:10px"></i>
				            			<span id="empPhone"></span>
				            		</div>
								</div>
							</div>
						</div>
						<div class="popup-foot">
							<a class="pop-btn confirm" id="writeemail"><i class="bi bi-envelope" style="margin-right:10px"></i> 메일 보내기</a>
							<a class="pop-btn close" id="close">창 닫기</a>
						</div>
				    </div>
				</div><!-- End 사원 정보 모달 -->
	    	</section>
	  	</main><!-- End main -->
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>