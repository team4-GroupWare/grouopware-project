<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/assets/js/emailCheck.js"></script>
	<style>
	
	table a:link {
  	color : black;
	}
	table a:visited {
	  color : black;
	}
	table a:hover {
	  color : #97ACFC;
	}
	table a:active {
	  color : #97ACFC;
	}
	
	
	</style>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		 <!-- ======= Sidebar ======= -->
		  <aside id="sidebar" class="sidebar">
		 
		    <ul class="sidebar-nav" id="sidebar-nav">
		
		      <li class="nav-item">
		        <a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/board/write" style="width:100%">
		          <i class="bi bi-pencil-square"></i> 
		          <span>게시글 작성</span>
		        </a>
		      </li><!-- End Dashboard Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/board/list">
		          <i class="bi bi-envelope-paper"></i><span>공지사항</span><i></i>
		        </a>
		      </li><!-- End Charts Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed " href="${pageContext.request.contextPath}/board/list">
		          <i class="bi bi-envelope"></i><span>사내 경조사</span>
		        </a>
		      </li><!-- End Icons Nav -->
		
		    </ul>
		
		  </aside><!-- End Sidebar -->
	
  <main id="main" class="main ">
	  <div class="pagetitle">
	      <h1>알림 마당</h1>
	    </div><!-- End Page Title -->
	
	    <section class="section">
	      <div class="row">
	        <div class="col-lg-12">
	          <div class="card">
	            <div class="card-body">
	              <div class="card-title d-flex" style="padding-top:10px;margin-bottom:0px;padding-bottom:0px">
	              	<div class=" my-auto" style="text-align:right">
	              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
	                    <button type="submit" class="btn btn-danger btn-sm"  onclick="checkEmail()">삭제</button>
	                    <script>
						function checkEmail(){
							var type = 'send';
							var checkArr = [];
							$('input[type=checkbox][name="selectone"]:checked').each(function() {
								var checkValue = $(this).val();
								console.log(checkValue);
								checkArr.push(checkValue);
							})
							
							console.log(checkArr);
							
							var data = {"checkArr" : checkArr, "type" : type};
							$.ajax({
								url : "${pageContext.request.contextPath}/email/importantcheck",
								method : "post",
								data : data,
								contentType : "application/x-www-form-urlencoded",
								traditional: true
							}).done((data)=> {
								console.log("성공: "+data);
								if(data == 'important'){
									$("#importantDeleteModal").modal('show');	
								} else {
									trashEmail(type);
								}
							});
							
							/*$.ajax({
								url : "${pageContext.request.contextPath}/email/deletecheck",
								method : "post",
								data : JSON.stringify(data),
								contentType : "application/json; charset=UTF-8",
								traditional: true
							}).done((data)=> {
								console.log("성공");
								$("#importantDeleteModal").modal('show');	
							});*/
								
						}
						
						function trashEmail(type){
							var checkArr = [];
							$('input[type=checkbox][name="selectone"]:checked').each(function() {
								var checkValue = $(this).val();
								console.log(checkValue);
								checkArr.push(checkValue);
							})
							var data = {"checkArr" : checkArr, "type" : type};
							$.ajax({
								url : "${pageContext.request.contextPath}/email/trashemail",
								method : "post",
								data : data,
								contentType : "application/x-www-form-urlencoded",
								traditional: true
							}).done((data)=> {
								console.log("성공: "+data);
								$("#trashModal").modal('show');	
							});
						}
						
						function reload(){
							location.reload();
						}
						
						function search(){
							var keyword = $("#keyword").val();
							location.href='${pageContext.request.contextPath}/email/search?keyword='+keyword+'&type=send';
							
						}
					 	</script>
	              </div>
	               <div class="input-group p-2" style="width:350px;margin-left:auto">
		             <span class="input-group-text" id="basic-addon1">
		              	<i class="bi bi-search"></i>
		             </span>
	               	<input type="text" id="keyword" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               	<button type="button" onclick="search()" class="btn btn-secondary btn-sm ">검색</button>
	              </div>
               </div>
               <!-- Bordered Tabs Justified -->
	              	
	          	<div class="tab-content pt-2" id="borderedTabContent">
	                <div aria-labelledby="home-tab">
			              <!-- Table with hoverable rows -->
			              <table class="table table-hover">
			                <thead>
			                  <tr style="border-bottom:2px solid #004389;">
			                  	<th scope="col" ><input name="selectall" onclick='selectAll(this)' class="form-check-input" type="checkbox"></input></th>
			                    <th scope="col">이름</th>
			                    <th scope="col">제목</th>
			                    <th scope="col">날짜</th>
			                  </tr>
			                </thead>
			                <tbody>
		                  		<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>김잡스</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 출결(전자출결,휴가,지하철 연착 등)관련 안내</a>
		                    		</td>
		                    		<td>2023-03-12</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>김철수</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 그룹웨어 사진 변경 안내</a>
		                    		</td>
		                    		<td>2023-03-12</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>김잡스</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지]사내 건강검진 안내</a>
		                    		</td>
		                    		<td>2023-03-11</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>이연희</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 개인정보처리방침 개정안내</a>
		                    		</td>
		                    		<td>2023-03-11</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>이지호</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 계량기 공사 관련 안내</a>
		                    		</td>
		                    		<td>2023-03-11</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>이예승</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[안내]경조사 게시판 이용방법 안내</a>
		                    		</td>
		                    		<td>2023-03-11</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>장백기</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[안내]공공사업1div 이지호 차장 결혼 안내</a>
		                    		</td>
		                    		<td>2023-03-10</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>공구민</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 출결(전자출결,휴가,지하철 연착 등)관련 안내</a>
		                    		</td>
		                    		<td>2023-03-10</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>한송밍</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 출결(전자출결,휴가,지하철 연착 등)관련 안내</a>
		                    		</td>
		                    		<td>2023-03-09</td>
		                    	</tr>
		                    	<tr>
		                  			<td><input name="selectone" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>김잡스</td>
		                    		<td>
		                    			<a href="${pageContext.request.contextPath}/board/detail">[공지] 계량기 공사 관련 안내</a>
		                    		</td>
		                    		<td>2023-03-09</td>
		                    	</tr>
			                </tbody>
			              </table>
			              <!-- End Table with hoverable rows -->
			              <div class="d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
				   				<ul class="pagination">
				   					<li class="page-item">
				       					<a class="page-link" href="#" aria-label="Previous">
				         						<span aria-hidden="true">처음</span>
			       						</a>
			     					</li>	
			   						<c:if test="${pager.groupNo>1}">
			      					<li class="page-item">
			        					<a class="page-link" href="#" aria-label="Previous">
			          						<span aria-hidden="true">이전</span>
			        					</a>
			      					</li>
			     					</c:if>
			     					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			     						<c:if test="${pager.pageNo != i}">
										<li class="page-item"><a class="page-link" href="#">${i}</a></li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
										<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
										</c:if>
									</c:forEach>
											
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<li class="page-item">
			            				<a class="page-link" href="#" aria-label="Next">
			           						<span aria-hidden="true">다음</span>
			         					</a>
			   						</li>
									</c:if>
									<li class="page-item">
			       						<a class="page-link" href="#" aria-label="Previous">
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
	        </div>
	     </div>
	    </section>
	    
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
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="reload()">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	  </main><!-- End #main -->
	
	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	</body>

</html>