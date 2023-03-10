<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script>
		function getTeam() {
			//선택된 부서 아이디 가져옴
			var value = $("#deptId > option:selected").val();
			if(value != 99){
				$.ajax({
					url: "${pageContext.request.contextPath}/employee/teamlist",
					method: "post",
					data: {"deptId": value}
				}).done(function(data) {
					var teamHtml = "";
					$('#teamId').empty();
					//teamlist를 가져와 목록으로 출력
					for(var i in data) {
					  teamHtml += "<option value='"+data[i].teamId+"'>"+data[i].teamName+"</option>";
					}
					
					$('#teamId').html(teamHtml);
					console.log(value);
				});
			} else {
				//기본 '선택'이라면 team목록이 공백으로 나타남
				$('#teamId').empty();
			}
		}
	</script>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <!-- ======= Main====== -->
  <main id="main" class="main">

    <div class="pagetitle mt-2">
      <h1>사원 정보 수정</h1>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <form id="updateUser" method="post" action="${pageContext.request.contextPath}/employee/updateemployee">
          <div class="card col-md-9">
          	<div class="row my-4">
		      <div class="col-md-4 card-body profile-card pt-4 d-flex flex-column align-items-center"style="text-align:center">
				<c:if test="${employee.profileData eq null}">
				<div class="mb-1" style="width:100%">
					<img id="profile-image" src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
				</div>
				</c:if>
				<c:if test="${employee.profileData ne null}">
				<div class="mb-1" style="width:100%">
					<img id="profile-image" src="${pageContext.request.contextPath}/employee/img?empId=${employee.empId}" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
				</div>
				<input id="originFile" type="hidden" name="profileContentType" type="hidden" value="${loginEmployee.profileContentType}">
				</c:if>
				  <div style="text-align:center;margin-top:20px">
		             <h2>${employee.name}</h2>
	             	 <p style="color: grey;size:20px">${employee.gradeName}</p>
		          </div>
		       </div>
		       <div class="col-md-7 card-body pt-3">
		          <div class="tab-content pt-2">
		             <div class="tab-pane fade show active profile-overview" id="profile-overview">
		                 <h4 class="card-title"><b>사원 정보</b></h4>
		                 <div class="row">
		                    <div class="col-lg-3 col-md-4 label ">이름</div>
		                    <div class="col-lg-9 col-md-8">${employee.name}</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 label">부서</div>
		                    <div class="input-group has-validation col-lg-7" style="width:170px">
                        		<select class="form-select " aria-label="Default select example" name="deptId" onchange="getTeam()" id="deptId">
							    	<option value="99">선택</option>
							    	<c:forEach var="department" items="${departments}" varStatus="status">
							    		<option value="${department.deptId}">${department.deptName}</option>
						    		</c:forEach>
								</select>
		                     </div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">팀</div>
		                    <div class="input-group has-validation" style="width:170px">
		                        <select class="form-select" aria-label="Default select example" name="teamId" id="teamId">
								   
								</select>
	                      </div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 label">직급</div>
		                    <div class="input-group has-validation col-lg-7" style="width:170px">
                        		<select class="form-select " aria-label="Default select example" name="gradeId" onchange="getTeam()" id="deptId">
							    	<c:forEach var="grade" items="${grades}" varStatus="status">
							    		<option value="${grade.gradeId}">${grade.gradeName}</option>
						    		</c:forEach>
								</select>
		                     </div>
		                  </div>
		                  
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">Phone</div>
		                    <div class="col-lg-9 col-md-8">${employee.phone}</div>
		                  </div>
			                  
		                   <div class="row">
		                    <div class="col-lg-3 col-md-4 label">생년월일</div>
		                    <div class="col-lg-9 col-md-8">${employee.birth}</div>
		                  </div>
		
		                  <div class="row">
		                    <div class="col-lg-3 col-md-4 label">Email</div>
		                    <div class="col-lg-9 col-md-8">${employee.empId}@exaient.com</div>
		                  </div>
		                  
		                   <div class="row">
		                    <div class="col-4 label">초기비밀번호 부여</div>
		                    <input id="password" class="col-4 form-control"style="width:250px">
		                    <button class="col-2  btn btn-danger" type="button" onclick="initPassword('${employee.empId}')" style="margin-left:15px">부여</button>
		                  </div>
		                  
		                  <input name="empId" type="hidden" value="${employee.empId}">
		                   
		                  
		                  <script>
		                  function initPassword(empId){
		                	  var password = $("#password").val();
		                	  if(password == ""){
		                		  $("#nopassword").modal('show');
		                	  }else {
		                		 var data = {"newPwd" : password, "empId" : empId};
		                		 $.ajax({
		    							url : "${pageContext.request.contextPath}/employee/grantinitial",
		    							method : "post",
		    							data : JSON.stringify(data),
		    							contentType: "application/json"
		    						}).done((data)=> {
		    							console.log("성공: "+data);
		    							if(data == 'success'){
		    								$("#init").modal('show');  							
		    								} 
		    						});
		                	  }
		                  }
		                  
		                  
		                  </script>
		                  
		                  
		                </div>
		              </div><!-- End Bordered Tabs -->
		            </div>
		            <div style="width:300px;text-align:center" class="mx-auto">
		            	<a class="btn btn-danger" href="${pageContext.request.contextPath}/hr/group">취소</a>
		            	<button class="btn btn-primary" type="submit">수정 완료</button>
		            </div>
            	</div>
          	</div>
	    </form>
      </div>
    </section>
    
    <!-- 메일 그냥 삭제시 Modal -->
	<div class="modal fade" id="nopassword" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"> 비밀번호 부여
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">부여할 비밀번호를 입력하세요</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-primary" data-bs-dismiss="modal">닫기</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메일 그냥 삭제시 Modal -->
	<div class="modal fade" id="init" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"> 비밀번호 부여
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">초기 비밀번호가 부여되었습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-primary" data-bs-dismiss="modal">닫기</a>
	      </div>
	    </div>
	  </div>
	</div>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <!-- End Footer -->

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>