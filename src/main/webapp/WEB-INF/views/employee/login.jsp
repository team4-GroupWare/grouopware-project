<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>

</head>
	<body>
  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
			  <!-- Start Logo -->
              <div class="d-flex align-items-center justify-content-between">
      		  <img src="${pageContext.request.contextPath}/resources/assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티 </span>
      			</a>
    	  	  </div><!-- End Logo -->

              <div class="card" style="margin-bottom: 300px">
                <div class="card-body">
                  <div class="pt-2 pb-1">
                    <h5 class="card-title text-center pb-0 fs-4">Login</h5>
                    <p class="text-center small">아이디와 비밀번호를 입력해주세요</p>
                  </div>

                  <form class="row g-3 needs-validation" method="post" action="login" >

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">아이디</label>
                      <div class="input-group has-validation">
                        <input type="text" name="empId" class="form-control" id="yourUsername" placeholder="emp1" value="emp1" required>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                      </div>
                    </div>

                    <div class="col-12 pb-3">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <input type="password" name="password" class="form-control" placeholder="1234" value="1234" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                    </div>
                    <div class="col-12 pb-2 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="submit">로그인</button>
                    </div>
                  </form>
                  
                  <c:if test="${not empty result}">
                  <script>
		   			$( function(){ 
		    			$('#errorModal').modal('show');
		   			 } )
				  </script>
				   </c:if>
                  	<!-- ERROR Modal -->
					<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="errorModalLabel">로그인 실패</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ${result}
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
                </div>
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