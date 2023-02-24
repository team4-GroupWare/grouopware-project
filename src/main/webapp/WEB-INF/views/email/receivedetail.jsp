<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		        <a class="btn btn-primary" type="button" href="../email/email_writeform.html" style="width:100%">
		          <i class="bi bi-pencil-square"></i> 
		          <span>메일 작성</span>
		        </a>
		      </li><!-- End Dashboard Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/email/receivelist">
		          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
		        </a>
		      </li><!-- End Charts Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed " data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
		          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
		        </a>
		        <ul id="icons-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
		          <li>
		            <a href="${pageContext.request.contextPath}/email/sendlist">
		              <span>전체</span>
		            </a>
	              </li>
		          <li>
		            <a href="#" class="active">
		              <span>미수신 메일</span>
		            </a>
		          </li>
		          <li>
		            <a href="#">
		              <span>수신 메일</span>
		            </a>
		          </li>
		        </ul>
		      </li><!-- End Icons Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="#">
		          <i class="bi bi-star-fill"></i>
		          <span>중요 메일함</span>
		        </a>
		      </li><!-- End Profile Page Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="#">
		          <i class="bi bi-envelope-exclamation"></i>
		          <span>임시저장함</span>
		        </a>
		      </li><!-- End Contact Page Nav -->
		      
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="#">
		          <i class="bi bi-trash3-fill"></i>
		          <span>휴지통</span>
		        </a>
		      </li><!-- End Contact Page Nav -->
		
		    </ul>
		
		  </aside><!-- End Sidebar -->
		
		  <main id="main" class="main ">
			<section class="section">
		      <div class="row">
		        <div class="col-lg-12">
		
		          <div class="card">
		            <div class="card-body">
		              <div class="d-flex mb-4">
		              	<i class="mt-4 bi bi-star" style="margin-right:8px;font-size:23px;color:#F0D14A"></i>
		              	<i class="mt-4 bi bi-star-fill" style="margin-right:8px;font-size:23px;color:#F0D14A"></i>
		              	<span class=" mt-4" style="font-size:24px;"><b>지호에게..지호야잘지내지나는어쩌구저쩌구우애</b></span>
		              	<div style="text-align:center;margin-top:24px;margin-left:20px;">
		              		<!-- 휴지통에서 조회한 경우 -->
		              		<button type="submit" class="btn btn-secondary btn-sm">복구</button>
		                    <button type="submit" class="btn btn-secondary btn-sm">답장</button>
		                    <button type="submit" class="btn btn-primary btn-sm">전달</button>
		                    <!-- 중요메일일 때 modal로 삭제 여부 확인 -> 삭제를 눌렀을 때 휴지통으로 들어갔다는 모달창 띄움 -->
		                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#importantDeleteModal">삭제</button>
		                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
		                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#trashModal">삭제</button>
		                    <!-- 휴지통에서는 영구삭제가 가능함 -->
		                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">영구삭제</button>
		                  </div>
		              	
		              </div>
		
		              <!-- General Form Elements -->
		                <div class="row ">
		                  <label for="inputText" class="col-sm-2 col-form-label">보낸 사람</label>
		                  <div class="col-sm-10 my-auto d-flex">
		                   		<p style="color:grey" class="my-auto">이예승 </p>
		                   		<p style="color:grey;margin-left:2px" class="my-auto">사원 </p>
		                   		<p  class="my-auto mx-1">| </p>
		                   		<p style="color:grey" class="my-auto">ys1893@coderby.com</p>
		                  </div>
		                </div>
		                
		                <div class="row mb-3">
		                  <label for="inputText" class="col-sm-2 col-form-label">보낸 날짜</label>
		                  <div class="col-sm-10 my-auto">
		                    <p class="my-auto" style="color:grey;font-size:15px">2023.02.13</p>
		                  </div>
		                </div>
		               
		               <hr/>
		                
		                <div class="row mb-3 file-list" style="margin-left:15px; margin-right:15px;background-color:#F6F6F6">
			                <div class="filebox">
			                <ul style="list-style:none;">
				                <li>
					               <p class="name">file.name</p>
					               <p class="size">file.size/1000 KB</p>
					             <li>
				             </ul>	
		               		</div>
		                </div>
		                
		                <div class="row mb-3 px-4">
		                  <div class="col-sm-12 mail-content px-3" style="height:320px">
		                    	 여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다. ====> 이 글은 예를 보이기 위한 것이므로 읽을 필요가 없다.
		
		여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다.여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다.여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다.여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다.여기는 DIV 스타일에 overflow: auto; 속성을 주었다. 내용의 양이 DIV 영역보다 많으면 스클롤바가 표시되고 적으면 표시되지 않는다.
		                  </div>
		                </div>
		
		
		            </div>
		          </div>
		        </div>
		      </div>
		    </section>
		    
		    <!-- 중요메일 삭제시 Modal -->
			<div class="modal fade" id="importantDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 중요메일
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">중요메일입니다.</p>
			        <p> 삭제하시겠습니까? </p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 그냥 삭제시 Modal -->
			<div class="modal fade" id="trashModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"> 휴지통
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">삭제한 메일은 10일동안 휴지통에 보관됩니다.</p>
			        <p>10일 이후에는 자동으로 영구삭제되며, 복구할 수 없습니다.</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"> <i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i>영구삭제
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">휴지통의 메일을 지우면 지워진 메일들은 복구할 수 없습니다. </p>
			        <p>메일을 삭제하시겠습니까?</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			    
		
		  </main><!-- End #main -->
		
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	</body>

</html>