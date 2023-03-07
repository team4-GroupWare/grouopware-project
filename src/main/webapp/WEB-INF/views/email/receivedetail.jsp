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
		        <a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/email/write" style="width:100%">
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
		        <a class="nav-link collapsed " href="${pageContext.request.contextPath}/email/sendlist">
		          <i class="bi bi-envelope"></i><span>보낸 메일함</span>
		        </a>
		      </li><!-- End Icons Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/email/templist">
		          <i class="bi bi-envelope-exclamation"></i>
		          <span>임시저장함</span>
		        </a>
		      </li><!-- End Contact Page Nav -->
		      
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/email/trashlist">
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
		              	<c:if test="${not emailDetail.important}">
		              	<i class="bi bi-star" style="margin-top:28px;margin-right:8px;font-size:23px;color:#F0D14A"></i>
		              	</c:if>
		              	<c:if test="${emailDetail.important}">
		              	<i class="bi bi-star-fill" style="margin-top:28px;margin-right:8px;font-size:23px;color:#F0D14A"></i>
		              	</c:if>
		              	<span class=" mt-4" style="font-size:24px;"><b>${emailDetail.title}</b></span>
		              	<div style="text-align:center;margin-top:24px;margin-left:20px;">
		              		<!-- 휴지통에서 조회한 경우 -->
		              		<c:if test="${emailDetail.strashDate ne null}">
		              		<a type="button" class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/email/restoreEmail?emailId=${emailDetail.sendEmailId}">복구</a>
		              		</c:if>
		              		<c:if test="${emailDetail.rtrashDate ne null}">
		              		<a type="button" class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath}/email/restoreEmail?emailId=${emailDetail.receiveEmailId}">복구</a>
		              		</c:if>
		                    <button type="button" class="btn btn-secondary btn-sm">답장</button>
		                    <button type="button" class="btn btn-primary btn-sm">전달</button>
		                    <c:if test="${emailDetail.rtrashDate eq null}">
		                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
		                    <button type="button" class="btn btn-danger btn-sm" onclick="checkEmail('${emailDetail.receiveEmailId}','trash')">삭제</button>
		                    </c:if>
		                    <!-- 휴지통에서는 영구삭제가 가능함 -->
		                    <c:if test="${emailDetail.rtrashDate ne null}">
		                    <button type="button" class="btn btn-danger btn-sm" onclick="checkEmail('${emailDetail.receiveEmailId}','delete')">영구삭제</button>
		                  	</c:if>
		                  </div>
		                  <script>
		                  	function checkEmail(emailId, type){
									var data = {"emailId" : emailId};
									$.ajax({
										url : "${pageContext.request.contextPath}/email/importantdetailcheck",
										method : "post",
										data : data,
									}).done((data)=> {
										console.log("성공: "+data);
										if(data == 'important'){
											if(type == 'delete'){
												$("#importantTrashModal").modal('show');	
											} else {
												$("#importantDeleteModal").modal('show');	
											}
										} else{
											if(type == 'delete'){
												$("#deleteModal").modal('show');
											} else if(type == 'trash'){
												trashEmail(emailId);
											}
										} 
									});
								}
		                  	
		                  	function trashEmail(emailId){
		                  		var type = 'receive'
		                  		var data = {"emailId" : emailId, "type" : type};
		                  		$.ajax({
									url : "${pageContext.request.contextPath}/email/trashemaildetail",
									method : "post",
									data : data,
								}).done((data)=> {
									console.log("성공");
										$("#trashModal").modal('show');
								});
		                  		
		                  	}
		                  	
		                  	
		                  	function reload() {
		                  		location.reload();
		                  	}
		                  </script>
		              	
		              </div>
		
		              <!-- General Form Elements -->
		                <div class="row ">
		                  <label for="inputText" class="col-sm-2 col-form-label">보낸 사람</label>
		                  <div class="col-sm-10 my-auto d-flex">
		                   		<p style="color:grey" class="my-auto">${emailDetail.sendName} </p>
		                   		<p style="color:grey;margin-left:2px" class="my-auto">${emailDetail.sendGrade} </p>
		                   		<p  class="my-auto mx-1">| </p>
		                   		<p style="color:grey" class="my-auto">${emailDetail.sendId}@exaient.com</p>
		                  </div>
		                </div>
		                
		                <div class="row mb-3">
		                  <label for="inputText" class="col-sm-2 col-form-label">보낸 날짜</label>
		                  <div class="col-sm-10 my-auto">
		                    <p class="my-auto" style="color:grey;font-size:15px">${emailDetail.sentDate}</p>
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
		                    	${emailDetail.content}
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
			        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 중요메일 삭제시 Modal -->
			<div class="modal fade" id="importantTrashModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
			        <button type="button" class="btn btn-primary" onclick="trashEmail(${emailDetail.receiveEmailId})">삭제</button>
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
			        <button type="button" class="btn btn-secondary" onclick="reload()">확인</button>
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
			        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/email/deleteDetail?emailId=${emailDetail.sendEmailId}">삭제</a>
			      </div>
			    </div>
			  </div>
			</div>
			    
		
		  </main><!-- End #main -->
		
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

	</body>

</html>