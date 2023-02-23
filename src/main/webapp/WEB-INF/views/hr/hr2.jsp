<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<style>
			th {
				vertical-align: middle;
			}
			td {
				vertical-align: middle;
			}
			*{
			  z-index:0
			  margin:0;
			  padding:0;
			  box-sizing: border-box;
			}
			p{
			  margin-top:10px;
			}
			.container{
			  width:100%;
			}
			.modal-btn-box{
			  width:100%;
			  text-align:center;
			}
			.modal-btn-box button{
			  display:inline-block;
			  width:150px;
			  height:50px;
			  background-color:#ffffff;
			  border:1px solid #e1e1e1;
			  cursor:pointer;
			  padding-top:8px;
			}
			.popup-wrap{
			  background-color:rgba(0,0,0,.3);
			  justify-content:center;
			  align-items:center;
			  position:fixed;
			  top:0;
			  left:0;
			  right:0;
			  bottom:0;
			  display:none;
			  padding:15px;
			}
			.popup{
			  z-index:200;
			  width:100%;
			  max-width:400px;
			  background-color:#ffffff;
			  border-radius:10px;
			  overflow:hidden;
			  background-color:#004389;
			  box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
			}
			.popup-head{
			  width:100%;
			  height:50px;
			  display:flex;
			  align-items:center;
			  justify-content:center;
			}
			.head-title {
			    font-size: 38px;
			    font-style: italic;
			    font-weight: 700;
			    letter-spacing: -3px;
			    text-align: center;
			}
			.popup-body{
			  width:100%;
			  background-color:#ffffff;
			}
			.body-content{
			  width:100%;
			  padding:30px;
			}
			.body-titlebox{
			  text-align:center;
			  width:100%;
			  
			  margin-bottom:10px;
			}
			.body-contentbox{
			  word-break:break-word;
			}
			.popup-foot{
			  width:100%;
			  height:50px;
			}
			.pop-btn{
			  display:inline-flex;
			  width:50%;
			  height:100%;
			  float:left;
			  justify-content:center;
			  align-items:center;
			  color:#ffffff;
			  cursor:pointer;
			}
			.pop-btn.confirm{
			  border-right:1px solid #3b5fbf;
			}
			
			/*라디오*/
			/* .select {
			    margin-right:20px;
			}
			.select input[type=radio]{
			    display: none;
			    border-radius: 15px;
			}
			.select input[type=radio]+label{
			    display: inline-block;
			    cursor: pointer;
			    width: 90px;
			    padding: 5px 0;
			    border-radius: 10px;
			    border: 1px solid #333;
			    line-height: 24px;
			    text-align: center;
			    font-weight :bold;
			    font-size: 15px;
			}
			.select input[type=radio]+label{
			    background-color: #fff;
			    color: #004389;
			}
			.select input[type=radio]:checked+label{
			    background-color: #004389;
			    color: #fff;
			} */
		</style>
		
		
		<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.js"></script>
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
	        		<a class="nav-link active" data-bs-target="#hr-nav" data-bs-toggle="collapse" href="#" aria-expanded="false">
	          			<span>엑사아이엔티</span><i class="bi bi-chevron-down ms-auto"></i>
	        		</a>
	        		
	        		<ul id="hr-nav" class="nav-content collapsed" data-bs-parent="#sidebar-nav">
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
			<div>
				<form name="emp-search">
					<div class="input-group me-auto p-2" style="width:600px">
		            	 <!-- <div class="select" >
						 	<input type="radio" id="select" name="where" value="dept"><label for="select">부서</label>
						    <input type="radio" id="select2" name="where" value="team"><label for="select2">팀</label>
							<input type="radio" id="select3" name="where" value="name"><label for="select3">이름</label>
						</div> -->
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
					function searchEmp() {
						$.ajax({
							url: "${pageContext.request.contextPath}/employee/search",
							data: $("form[name=emp-search]").serialize(),
							sueccess: function(result) {
								console.log("성공");
								$('#emptable > tbody').empty();
								if(result.length >= 1) {
									result.forEach(function(item) {
										console.log(item)
										str = "<tr class='modal-open' onclick='javascript:empInfo('" + item.empId + "')'>";
										str += "<th scope='row'><img src='${pageContext.request.contextPath}/resources/assets/img/profile_img.png' alt='Profile' class='rounded-circle' width='40px'>" + item.name + "</th>"
										str += "<td>" + item.phone + "</td>";
										str += "<td>" + item.empId + "@mycompany.com</td>";
										str += "<td>" + item.deptName + "</td>";
										str += "<td>" + item.teamName + "</td>";
										str += "</tr>";
										$('#emptable').append(str);
									})
								}
							}
						})
					}
				</script>
			</div>
			<section class="section" > 
	      		<div class="row">
	        		<div class="col-lg-10">
	          			<div class="card" style="height:780px">
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
		                  					<tr class="modal-open" onclick="javascript:empInfo('${employee.empId}')">
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
	            			</div>
	            			<div class="card-footer d-flex justify-content-center" style="vertical-align:bottom">
				  				<nav aria-label="Page navigation example">
	                				<ul class="pagination">
	                					<li class="page-item">
	                    					<a class="page-link" href="list?pageNo=1" aria-label="Previous">
	                      						<span aria-hidden="true">처음</span>
	                    					</a>
	                  					</li>	
	                					<c:if test="${pager.groupNo>1}">
		                  					<li class="page-item">
		                    					<a class="page-link" href="list?pageNo=${pager.startPageNo-1}" aria-label="Previous">
		                      						<span aria-hidden="true">이전</span>
		                    					</a>
		                  					</li>
	                  					</c:if>
	                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
	                  						<c:if test="${pager.pageNo != i}">
												<li class="page-item"><a class="page-link" href="list?pageNo=${i}">${i}</a></li>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<li class="page-item active"><a class="page-link" href="list?pageNo=${i}">${i}</a></li>
											</c:if>
										</c:forEach>
										
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<li class="page-item">
			                    				<a class="page-link" href="list?pageNo=${pager.endPageNo+1}" aria-label="Next">
			                      					<span aria-hidden="true">다음</span>
			                    				</a>
		                  					</li>
										</c:if>
										<li class="page-item">
	                    					<a class="page-link" href="list?pageNo=${pager.totalPageNo}" aria-label="Previous">
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
	      			function empInfo(empId) {
	      				console.log("empInfo 실행");
	      				
	      				$.ajax({
	      					url: "${pageContext.request.contextPath}/employee/empinfo",
	      					data: {"empId" : empId},
	      					type: "GET"
	      				}).done((result) => {
							console.log("성공");
      						console.log(result);
      						$('#empName').html(result.name);
      						$('#empGrade').html(result.gradeName);
      						$('#empDept').html(result.deptName);
      						$('#empTeam').html(result.teamName);
      						$('#empEmail').html(result.empId + "@mycompany.com");
      						$('#empPhone').html(result.phone);
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
	      		<div class="popup-wrap" id="popup">
					<div class="popup">
				    	<div class="popup-head">
				        	<span class="head-title"></span>
				      	</div>
				      	<div class="popup-body">
				        	<div class="body-content">
				          		<div class="body-titlebox mb-4">
				          			<img src="${pageContext.request.contextPath}/resources/assets/img/profile_img.png" alt="Profile" class="rounded-circle border" width="130px">
				            		<h4>${employee.name}</h4>
				          		</div>
				          		<div class="body-contentbox" style="margin:0 50px;">
				          			<div class="d-flex">
				          				<h5 id="empName" style="font-weight:bold; margin-right:10px"></h5>
				            			<span id="empGrade"></span>
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
							<span class="pop-btn confirm" id="confirm"><i class="bi bi-envelope"  style="margin-right:10px"></i> 메일 보내기</span>
							<span class="pop-btn close" id="close">창 닫기</span>
						</div>
				    </div>
				</div>
	    	</section>
	  	</main><!-- End #main -->
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>