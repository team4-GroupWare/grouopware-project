<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script>
		function getTeam() {
			//선택된 부서 아이디 가져옴
			var value = $("#deptId > option:selected").val();
			if(value != "선택"){
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
		
		function check() {
			var id = $("#empId").val();
			console.log(id);
			$.ajax({
				url: "${pageContext.request.contextPath}/employee/check",
				method: "post",
				data: {"empId": id}
			}).done(function(data){
				console.log(data);
				var message = "";
				if(data){
					message = "아이디가 이미 존재합니다";
				} else {
					message = "사용가능한 아이디 입니다";
				}
				$("#idMessage").text(message);
				
				
				
			});
		}
	</script>
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <!-- Start Logo -->
              <div class="d-flex align-items-center justify-content-between">
      		  <img src="${pageContext.request.contextPath}/resources/assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	  	  </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-2 pb-3">
                    <h5 class="card-title text-center pb-0 fs-4 mb-3"><b>회원등록</b></h5>
                  </div>

                  <form:form class="row g-3 needs-validation" method="post" action="register">
                  	<div class="row">
		                 <div class="col-9 form-floating mb-3">
		                 	  <c:if test="${result == 'init'}">
			                  <input type="text" class="form-control" name="empId" id="empId" placeholder="아이디" required>
			                  </c:if>
			                  <c:if test="${result == 'fail'}">
			                  <input type="text" class="form-control" value="${employee.empId}" name="empId" id="empId" placeholder="아이디" required >
			                  </c:if>
			                  <div class="invalid-feedback">아이디를 입력해주세요</div> 
			                  <label for="floatingName">아이디</label>
			                  <p id="idMessage" style="color:red;font-size:12px;margin-top:5px"></p>
		                 </div>
		                 <div class="col-3" style="vertical-align:middle;" >
		                 	  <!-- onclick시 중복확인하는 javascript : ajax 실행 -->
		                      <div class="btn btn-secondary btn-sm" onclick="check()">중복확인</div>
		                 </div>
	                 </div>
	                 <form:errors path="empId" class="errors"/>
	                 <div class="row">   
		                 <div class="col-9 form-floating mb-3">
		                 	  <c:if test="${result == 'init'}">
			                  <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="비밀번호" required >
			                  </c:if>
			                  <c:if test="${result == 'fail'}">
			                  <input type="password" class="form-control" value="${employee.password }" name="password" id="floatingPassword" placeholder="비밀번호" required >
			                  </c:if>
			                  <div class="invalid-feedback">비밀번호를 입력해주세요</div> 
			                  <label for="floatingName">비밀번호</label>
		                 </div>
	                 </div>
			         <form:errors path="password" class="errors"/>
	                 
	                 <div class="col-23 form-floating mb-3"> 
	                 	  <c:if test="${result == 'init'}">
		                  <input type="text" class="form-control" name="name" id="floatingName" placeholder="이름" required >
		                  </c:if>
		                  <c:if test="${result == 'fail'}">
		                  <input type="text" class="form-control" value="${employee.name}" name="name" id="floatingName" placeholder="이름" required>
		                  </c:if>
		                  <div class="invalid-feedback">이름을 입력해주세요</div> 
		                  <label for="floatingName">이름</label>
	                 </div>
	                 <form:errors path="name" class="errors"/>
	                 
	                 <div class="col-12 form-floating mb-3"> 
	                 	  <c:if test="${result == 'init'}">
		                  <input type="text" class="form-control" name="phone" id="floatingPhone" placeholder="번호" required>
		                  </c:if>
		                  <c:if test="${result == 'fail'}">
		                  <input type="text" class="form-control" value="${employee.phone}" name="phone" id="floatingPhone" placeholder="번호" >
		                  </c:if>
		                  <div class="invalid-feedback">번호를 입력해주세요</div> 
		                  <label for="floatingName">전화번호</label>
	                 </div>
	                 <form:errors path="phone" class="errors"/>
                    
                    <div class="col-12">
                      <label for="yourBirthday" class="form-label">생년월일</label>
                      <div class="input-group has-validation" style="width:250px">
                      	<c:if test="${result == 'init'}">
                        <input type="date" name="birth" class="form-control" id="birth" required>
                        </c:if>
                        <c:if test="${result == 'fail'}">
                        <input type="date" name="birth" value="${employee.birth}" class="form-control" id="birth" required>
                        </c:if>
                        <div class="invalid-feedback">생년월일을 입력해주세요.</div>
                      </div>
                    </div>
                    
                     <div class="col-4" style="width:170px">
                      <label for="yourDepartment" class="form-label">부서</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="deptId" onchange="getTeam()" id="deptId">
						    <option value=" ">선택</option>
						    <c:forEach var="department" items="${departments}" varStatus="status">
						    	<option value="${department.deptId}">${department.deptName}</option>
						    </c:forEach>
						</select>
                      </div>
                    </div>
					<form:errors path="deptId" class="errors"/>
                    
                     <div id="teamDiv" class="col-4" style="width:170px;" >
                      <label for="yourDepartment" class="form-label">팀</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="teamId" id="teamId">
						   
						</select>
                      </div>
                    </div>
                    
                     <div class="col-4 pb-2" style="width:140px">
                      	<label for="yourDepartment" class="form-label">직급</label>
                      	<div class="input-group has-validation">
                        	<select class="form-select" aria-label="Default select example" name="gradeId" id="gradeId">
					    		<c:forEach var="grade" items="${grades}" varStatus="status">
						    		<option value="${grade.gradeId}">${grade.gradeName}</option>
						    	</c:forEach>
					 	 	</select>
                      	</div>
                    </div>
                    
                    <div class="col-12 form-floating mb-3">
                    	 <c:if test="${result == 'init'}">
		                 <input type="text" class="form-control" name="managerId" id="managerId" placeholder="매니저사번" required>
		                 </c:if>
		                 
		                 <c:if test="${result == 'fail'}">
		                 <input type="text" class="form-control" value="${employee.managerId}" name="managerId" id="managerId" placeholder="매니저사번" required>
		                 </c:if>
		                 
		                  <label for="floatingName">매니저 사번</label>
	                 </div>
	                 <form:errors path="managerId" class="errors"/>

                  
                    <div class="col-12 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="submit" style="display:inline-block">회원등록</button>
                    </div>
                  </form:form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
              </div>

            </div>
          </div>
        </div>
      </section>

    </div>
  </main><!-- End #main -->

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>