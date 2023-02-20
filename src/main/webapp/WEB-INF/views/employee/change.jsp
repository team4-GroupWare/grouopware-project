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
      		  <img src="../assets/img/exaint_logo.png" width="100px" height="100px">
      			<a href="index2.html" class="logo d-flex align-items-center">
        		<span class="d-none d-lg-block">엑사아이엔티</span>
      			</a>
    	  	  </div><!-- End Logo -->

              <div class="card" style="margin-bottom: 300px">
                <div class="card-body">
                  <div class="pt-2 pb-1">
                    <h5 class="card-title text-center pb-0 fs-4">비밀번호 변경</h5>
                    <p class="text-center small">현재 비밀번호는 초기 비밀번호이며 변경이 필요합니다.</p>
                  </div>

                  <form class="row g-3 needs-validation" novalidate>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <div class="input-group has-validation">
                        <input type="password" name="password" class="form-control" placeholder="비밀번호 입력" required>
                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                      </div>
                    </div>

                    <div class="col-12 pb-3">
                      <label for="yourPassword" class="form-label">비밀번호 확인</label>
                      <input type="password" name="password" class="form-control" placeholder="비밀번호 재입력" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                    </div>
                    <div class="col-12 pb-2 mx-auto" style="width:250px;">
                      <button class="btn btn-primary w-100" type="submit">비밀번호 변경</button>
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