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
			if(value != 0){
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

                  <form class="row g-3 needs-validation" method="post" action="${pageContext.request.contextPath}/employee/register">
                  	<div class="row">
		                 <div class="col-9 form-floating mb-3">
			                  <input type="text" class="form-control" value="${employee.empId}" name="empId" id="empId" placeholder="아이디"  >
			                  <label for="floatingName">아이디</label>
			                  <p id="idMessage" style="font-weight:bold;color:grey;font-size:12px;margin-top:5px;margin-bottom:0px"></p>
                 		 	  <form:errors path="employee.empId" class="errors"/>
		                 </div>
		                 <div class="col-3" style="vertical-align:middle;" >
		                 	  <!-- onclick시 중복확인하는 javascript : ajax 실행 -->
		                      <div class="btn btn-secondary btn-sm" onclick="check()">중복확인</div>
		                 </div>
	                 </div>
	                 <div class="row">   
		                 <div class="col-9 form-floating mb-3">
			                  <input type="password" class="form-control" value="${employee.password}" name="password" id="floatingPassword" placeholder="비밀번호"  >
			                  <div class="invalid-feedback">비밀번호를 입력해주세요</div> 
			                  <label for="floatingName">비밀번호</label>
			         	 	  <form:errors path="employee.password" class="errors"/>
		                 </div>
	                 </div>
	                 
	                 <div class="col-23 form-floating mb-3"> 
		                  <input type="text" class="form-control" value="${employee.name}" name="name" id="floatingName" placeholder="이름" >
		                  <div class="invalid-feedback">이름을 입력해주세요</div> 
		                  <label for="floatingName">이름</label>
	                 	  <form:errors path="employee.name" class="errors"/>
	                 </div>
	                 
	                 <div class="col-12 form-floating mb-3"> 
		                  <input type="text" class="form-control" value="${employee.phone}" name="phone" id="floatingPhone" placeholder="번호" >
		                  <div class="invalid-feedback">번호를 입력해주세요</div> 
		                  <label for="floatingName">전화번호</label>
	                 	  <form:errors path="employee.phone" class="errors"/>
	                 </div>
                    
                    <div class="col-12">
                      <label for="yourBirthday" class="form-label">생년월일</label>
                      <div class="input-group has-validation" style="width:250px">
                        <input type="date" name="birth" value="${employee.birth}" class="form-control" id="birth" required>
                        <div class="invalid-feedback">생년월일을 입력해주세요.</div>
                        <form:errors path="employee.birth" class="errors"/>
                      </div>
                    </div>
                    
                     <div class="col-4" style="width:170px">
                      <label for="yourDepartment" class="form-label">부서</label>
                      <div class="input-group has-validation">
                        <select class="form-select" aria-label="Default select example" name="deptId" onchange="getTeam()" id="deptId">
						    <option value="0">선택</option>
						    <c:forEach var="department" items="${departments}" varStatus="status">
						    	<option value="${department.deptId}">${department.deptName}</option>
						    </c:forEach>
						</select>
						<form:errors path="employee.deptId" class="errors"/>
                      </div>
                    </div>
                    
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
		                 <input type="text" class="form-control" value="${employee.managerId}" name="managerId" id="managerId" placeholder="매니저사번" >
		                 <label for="floatingName">매니저 아이디</label>
	                 	 <form:errors path="employee.managerId" class="errors"/>
	                 </div>

                  
                    <div class="col-12 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="submit" style="display:inline-block">회원등록</button>
                    </div>
                  </form>

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