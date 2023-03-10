<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      			<a  class="logo d-flex align-items-center" href="${pageContext.request.contextPath}/">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	  	  </div><!-- End Logo -->

              <div class="card" style="margin-bottom: 300px">
                <div class="card-body">
                  <div class="pt-2 pb-1">
                    <h5 class="card-title text-center pb-0 fs-4">비밀번호 변경</h5>
                  </div>

                  <form class="row g-3 needs-validation" novalidate>
                    <div class="col-12 pb-3">
                      <label for="yourPassword" class="form-label">현재 비밀번호</label>
                      <div class="input-group has-validation">
                        <input type="password" id="oldpwd" name="password" class="form-control" placeholder="비밀번호 입력" required>
                        <div class="invalid-feedback">현재 비밀번호를 입력해주세요.</div>
                      </div>
                      <div id="wrongPwd" style="color:red;font-size:12px"></div>
                    </div>
                    
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">새 비밀번호</label>
                      <input type="password" id="newpwd" name="password" class="form-control" placeholder="비밀번호 재입력" id="yourPassword" required>
                      <div class="invalid-feedback">새 비밀번호를 입력해주세요.</div>
                      <div id="wrongexp" style="color:red;font-size:12px"></div>
                    </div>

                    <div class="col-12 pb-3">
                      <label for="yourPassword" class="form-label">비밀번호 확인</label>
                      <input type="password" id="repwd" name="password" class="form-control" placeholder="비밀번호 재입력" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                      <div id="wrong" style="color:red;font-size:12px"></div>
                    </div>
                    
                    <input id="empId" type="hidden" value="${empId}">
                    
                    <div class="col-12 pb-2 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="button" onclick="checkPwd()">비밀번호 변경</button>
                    </div>
                  </form>
                </div>
              </div>
              
              <script>
              function checkPwd(){
            	  var newPwd = $("#newpwd").val();
            	  var rePwd = $("#repwd").val();
            	  var empId = $("#empId").val();
            	  var passwordPattern =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
            	  if(newPwd.match(passwordPattern) != null){
            		  if(newPwd == rePwd){
                		  var oldPwd = $("#oldpwd").val();
                		  var data = {"newPwd" : newPwd, "oldPwd" : oldPwd, "empId" : empId};
                		  $.ajax({
    							url : "${pageContext.request.contextPath}/employee/changeinitial",
    							method : "post",
    							data : JSON.stringify(data),
    							contentType: "application/json"
    						}).done((data)=> {
    							console.log("성공: "+data);
    							if(data == 'false'){
    								$("#wrongPwd").empty();
    								$("#wrongPwd").text("비밀번호가 틀립니다.");
    							} else{
    								$("#changeModal").modal('show');
    							} 
    						});
                	  } else {
                		  $("#wrong").empty();
                		  $("#wrong").text("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
                	  }
            	  } else {
            		  $("#wrongexp").empty();
            		  $("#wrongexp").text("비밀번호는 8-15자리의 영숫자, 특수문자를 포함해주세요");
            	  }
            	  
              }
              
              
              </script>

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
      
      <!-- 메일 그냥 삭제시 Modal -->
	<div class="modal fade" id="changeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"> 비밀번호 변경
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">비밀번호가 변경되었습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/employee/login">확인</a>
	      </div>
	    </div>
	  </div>
	</div>

    </div>
  </main><!-- End #main -->

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>