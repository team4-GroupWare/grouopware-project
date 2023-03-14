<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		        <a class="btn btn-primary" type="button" style="width:100%">
		          <i class="bi bi-person-rolodex"></i> 
		          <span>마이페이지</span>
		        </a>
		      </li><!-- End Dashboard Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/employee/myPage">
		          <i class="bi bi-person-vcard-fill"></i><span>나의 정보</span><i></i>
		        </a>
		      </li><!-- End Charts Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/employee/change">
		          <i class="bi bi-key-fill"></i>
		          <span>비밀번호 변경</span>
		        </a>
		      </li><!-- End Profile Page Nav -->
		    </ul>
		  </aside><!-- End Sidebar -->
		  <!-- ======= Main====== -->
		  <main id="main" class="main">
		
		    <div class="pagetitle mt-2">
		      <h1>마이페이지</h1>
		      <nav>
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
		          <li class="breadcrumb-item">Users</li>
		          <li class="breadcrumb-item active">마이페이지</li>
		        </ol>
		      </nav>
		    </div><!-- End Page Title -->
		
		    <section class="section profile">
		      <div class="row">
		        <form id="updateUser" method="post" action="${pageContext.request.contextPath}/employee/update" enctype="multipart/form-data">
		          <div class="card col-md-9">
		          	<div class="row my-4">
				      <div class="col-md-4 card-body profile-card pt-4 d-flex flex-column align-items-center"style="text-align:center">
						<c:if test="${loginEmployee.profileData eq null}">
						<div class="mb-1" style="width:100%">
							<img id="profile-image" src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
						</div>
						</c:if>
						<c:if test="${loginEmployee.profileData ne null}">
						<div class="mb-1" style="width:100%">
							<img id="profile-image" src="${pageContext.request.contextPath}/employee/img?empId=${loginEmployee.empId}" alt="Profile" class="rounded-circle" style="width:100%;height:100%">
						</div>
						<input id="originFile" type="hidden" name="profileContentType" type="hidden" value="${loginEmployee.profileContentType}">
						</c:if>
						<div class="mt-3" style="text-align:center;vertical-align:middle">
							<label class="btn btn-primary btn-sm" for="my-input">
			  					<i class="bi bi-upload"></i>
							</label>
					        <input id="my-input" type="file" name="attachFiles" onchange="onClickUpload(this);" style="display:none"/>
			                <script>
								function onClickUpload(obj) {
								   var myInput = $("#my-input");
								   $('#originFile').val('');
								   myInput.click();
								  }
								        
								function readImage(input) {
								  // 인풋 태그에 파일이 있는 경우
								  if(input.files && input.files[0]) {
								  // 이미지 파일인지 검사 (생략)
								  // FileReader 인스턴스 생성
								  const reader = new FileReader()
								  // 이미지가 로드가 된 경우
								  reader.onload = e => {
								  const previewImage = document.getElementById("profile-image");
								  previewImage.src = e.target.result
								  }
								  // reader가 이미지 읽도록 하기
								  reader.readAsDataURL(input.files[0])
								  }
								 }
								 // input file에 change 이벤트 부여
								 const inputImage = document.getElementById("my-input");
								 inputImage.addEventListener("change", e => {
								    readImage(e.target)
								  })
								        
								 function changeImg() {
									document.getElementById("profile-image").src = "${pageContext.request.contextPath}/resources/assets/img/basic-user.png";
									var myInput = $("#my-input");
									myInput.value=null;
									$('#originFile').val('delete');
									
								  }
							</script>
			                <button onclick="changeImg()" type="button" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></button>
			              </div>
						  <div style="text-align:center;margin-top:30px">
				             <h2>${loginEmployee.name}</h2>
			             	 <p style="color: grey;size:20px">${loginEmployee.gradeName}</p>
				          </div>
				       </div>
				       <div class="col-md-7 card-body pt-3">
				          <div class="tab-content pt-2">
				             <div class="tab-pane fade show active profile-overview" id="profile-overview">
				                 <h4 class="card-title"><b>나의 정보</b></h4>
				                 <div class="row">
				                    <div class="col-lg-3 col-md-4 label ">이름</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.name}</div>
				                  </div>
				
				                  <div class="row">
				                    <div class="col-lg-3 col-md-4 label">부서</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.deptName}</div>
				                  </div>
				
				                  <div class="row">
				                    <div class="col-lg-3 col-md-4 label">팀</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.teamName}</div>
				                  </div>
				
				                  <div class="row">
				                    <div class="col-lg-3 col-md-4 label">직급</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.gradeName}</div>
				                  </div>
				                  
				                  <div class="row">
				                    <div class="col-lg-3 col-md-4 label">Phone</div>
				                    <input name="phone" type="text" class="form-control" id="phone" value="${loginEmployee.phone}" style="width:250px">
				                  </div>
					                  
				                   <div class="row">
				                    <div class="col-lg-3 col-md-4 label">생년월일</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.birth}</div>
				                  </div>
				
				                  <div class="row">
				                    <div class="col-lg-3 col-md-4 label">Email</div>
				                    <div class="col-lg-9 col-md-8">${loginEmployee.empId}@exaient.com</div>
				                  </div>
				                </div>
				              </div><!-- End Bordered Tabs -->
				            </div>
				            <div style="width:300px;text-align:center" class="mx-auto">
				            	<button class="btn btn-primary">수정 완료</button>
				            </div>
		            	</div>
		          	</div>
			    </form>
		      </div>
		    </section>
		  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <!-- End Footer -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>