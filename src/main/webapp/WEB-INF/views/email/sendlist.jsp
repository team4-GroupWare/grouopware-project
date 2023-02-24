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
	        <a class="btn btn-primary" type="button" href="email_writeform.html" style="width:100%">
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
	        <a class="nav-link" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="icons-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="${pageContext.request.contextPath}/email/sendlist">
	              <span>전체</span>
	            </a>
	          </li>
	          <li>
	            <a href="../email/email_list.html">
	              <span>미수신 메일</span>
	            </a>
	          </li>
	          <li>
	            <a href="../email/email_list.html">
	              <span>수신 메일</span>
	            </a>
	          </li>
	        </ul>
	      </li><!-- End Icons Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="../email/email_list.html">
	          <i class="bi bi-star-fill"></i>
	          <span>중요 메일함</span>
	        </a>
	      </li><!-- End Profile Page Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="../email/email_list.html">
	          <i class="bi bi-envelope-exclamation"></i>
	          <span>임시저장함</span>
	        </a>
	      </li><!-- End Contact Page Nav -->
	      
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="../email/email_list.html">
	          <i class="bi bi-trash3-fill"></i>
	          <span>휴지통</span>
	        </a>
	      </li><!-- End Contact Page Nav -->
	
	    </ul>
	
	  </aside><!-- End Sidebar -->
	
	  <main id="main" class="main ">
		  <div class="pagetitle">
		      <h1>보낸 메일함</h1>
		      <nav>
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/email/sendlist">보낸메일함</a></li>
		        </ol>
		      </nav>
		    </div><!-- End Page Title -->
	
	    <section class="section">
	      <div class="row">
	        <div class="col-lg-12">
	        
	
	          <div class="card">
	            <div class="card-body">
	              <div class="card-title d-flex" >
		               <div class="input-group me-auto p-2" style="width:350px">
			             <span class="input-group-text" id="basic-addon1">
			              	<i class="bi bi-search"></i>
			             </span>
		               	<input type="text" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
		               	<button type="submit" class="btn btn-secondary btn-sm ">검색</button>
		              </div>
		            
		              <div class=" my-auto" style="text-align:right">
		              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
		                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#importantDeleteModal">삭제</button>
		                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
		                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#trashModal">삭제</button>
		              </div>
	              </div>
	
	              <!-- Table with hoverable rows -->
	              <table class="table table-hover">
	                <thead>
	                  <tr>
	                  	<th scope="col" ><input class="form-check-input" type="checkbox"></input></th>
	                    <th scope="col">이름</th>
	                    <th scope="col">제목</th>
	                    <th scope="col">날짜</th>
	                    <th scope="col">수신</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach var="emailList" items="${emailList}" varStatus="status">
                  		<tr>
                  			<td><input class="form-check-input" type="checkbox"></td>
                    		<td>${emailList.receiveId}</td>
                    		<td><a href="${pageContext.request.contextPath}/email/write">${emailList.title}</a></td>
                    		<td>${emailList.sentDate}</td>
                    		<c:if test="${emailList.readDate == null} ">
                    		<td>미수신</td>
                    		</c:if>
                    		<c:if test="${emailList.readDate != null} ">
                    		<td>${emailList.readDate}</td>
                    		</c:if>
                    	</tr>
                  	  </c:forEach>
	                </tbody>
	              </table>
	              <!-- End Table with hoverable rows -->
	              <div class="card-footer d-flex justify-content-center" style="vertical-align:bottom">
	  				<nav aria-label="Page navigation example">
		   				<ul class="pagination">
		   					<li class="page-item">
		       					<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=1" aria-label="Previous">
		         						<span aria-hidden="true">처음</span>
	       						</a>
	     					</li>	
	   						<c:if test="${pager.groupNo>1}">
	      					<li class="page-item">
	        					<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	          						<span aria-hidden="true">이전</span>
	        					</a>
	      					</li>
	     					</c:if>
	     					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
	     						<c:if test="${pager.pageNo != i}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${pager.pageNo == i}">
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/snedlist?pageNo=${i}">${i}</a></li>
								</c:if>
							</c:forEach>
									
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<li class="page-item">
	            				<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.endPageNo+1}" aria-label="Next">
	           						<span aria-hidden="true">다음</span>
	         					</a>
	   						</li>
							</c:if>
							<li class="page-item">
	       						<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.totalPageNo}" aria-label="Previous">
	    							<span aria-hidden="true">맨끝</span>
	   							</a>
	   						</li>	
	   					 </ul>
	 				  </nav>
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
		      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 영구삭제
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