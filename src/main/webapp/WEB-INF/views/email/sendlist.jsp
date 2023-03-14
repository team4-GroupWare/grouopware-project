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
	  color : #aaafb6;
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
	        <a class="nav-link" href="${pageContext.request.contextPath}/email/sendlist">
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
	              <div class="card-title d-flex" style="padding-top:10px;margin-bottom:0px;padding-bottom:0px">
	              	<div class=" my-auto" style="text-align:right">
	              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
	                    <button type="submit" class="btn btn-danger btn-sm"  onclick="checkEmail()">삭제</button>
	                    <script>
	                    //중요메일 여부인지 확인하고 휴지통이나 삭제처리
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
						}
						//휴지통에 메일 넣기
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
						//검색할 경우 알맞은 키워드의 페이지를 가지고 이동
						function search(){
							var keyword = $("#keyword").val();
							location.href='${pageContext.request.contextPath}/email/search?keyword='+keyword+'&type=send';
							
						}
					 	</script>
	              </div>
	              <!-- 검색 -->
	               <div class="input-group p-2" style="width:350px;margin-left:auto">
		             <span class="input-group-text" id="basic-addon1">
		              	<i class="bi bi-search"></i>
		             </span>
	               	<input type="text" id="keyword" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               	<button type="button" onclick="search()" class="btn btn-secondary btn-sm ">검색</button>
	              </div>
               </div>
			   <!-- 본문 위에 카테고리 영역 -->
               <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
              		<li class="nav-item" role="presentation">
              			<c:if test="${kind eq 'send' }">
              			<a class="nav-link w-100 active"  href="${pageContext.request.contextPath}/email/sendlist">전체</a>
              			</c:if>
              			<c:if test="${kind ne 'send' }">
              			<a class="nav-link w-100" href="${pageContext.request.contextPath}/email/sendlist">전체</a>
              			</c:if>
              		</li>
               		<li class="nav-item" role="presentation">
               			<!-- 읽은 메일에는 수신 -->
               			<c:if test="${kind eq 'read' }">
                 		<a class="nav-link w-100 active" href="${pageContext.request.contextPath}/email/readlist">수신</a>
               			</c:if>
               			<c:if test="${kind ne 'read' }">
               			<a class="nav-link w-100" href="${pageContext.request.contextPath}/email/readlist">수신</a>
               			</c:if>
               		</li>
               		<li class="nav-item" role="presentation">
               			<!-- 읽지 않은 메일에는 미수신 -->
               			<c:if test="${kind eq 'unread' }">
                 		<a class="nav-link w-100 active" href="${pageContext.request.contextPath}/email/unreadlist">미수신</a>
               			</c:if>
               			<c:if test="${kind ne 'unread' }">
               			<a class="nav-link w-100" href="${pageContext.request.contextPath}/email/unreadlist">미수신</a>
               			</c:if>
               		</li>
           	    </ul>
	              	
	          	<div class="tab-content pt-2" id="borderedTabContent">
	                <div aria-labelledby="home-tab">
			              <!-- 본문 -->
			              <table class="table table-hover">
			                <thead>
			                  <tr style="border-bottom:2px solid #004389;">
			                  	<th scope="col" ><input name="selectall" onclick='selectAll(this)' class="form-check-input" type="checkbox"></input></th>
			                    <th scope="col">이름</th>
			                    <th scope="col">제목</th>
			                    <th scope="col">날짜</th>
			                    <th scope="col">수신</th>
			                  </tr>
			                </thead>
			                <tbody>
		              		<c:if test="${not empty emailList}">
			                <c:forEach var="emailList" items="${emailList}" varStatus="status">
		                  		<tr>
		                  			<td><input name="selectone" value="${emailList.sendEmailId}" onclick='checkSelectAll()' class="form-check-input" type="checkbox"></td>
		                    		<td>${emailList.receiveName}</td>
		                    		<td>
		                    			<c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
		                    			<a href="${pageContext.request.contextPath}/email/readSendEmail?sendEmailId=${emailList.sendEmailId}">${emailList.title}</a>
		                    		</td>
		                    		<td>${emailList.sentDate}</td>
		                    		<c:if test="${empty emailList.readDate}">
		                    		<td>미수신</td>
		                    		</c:if>
		                    		<c:if test="${not empty emailList.readDate}">
		                    		<td>${emailList.readDate} 읽음</td>
		                    		</c:if>
		                    	</tr>
		                  	  </c:forEach>
		                  	  </c:if>
			                </tbody>
			              </table>
			              <c:if test="${empty emailList}">
		              	  <div style="height:200px;text-align:center;margin-top:150px">
		              			메일이 존재하지 않습니다.
		              	  </div>
		              	  </c:if>
			              <!-- 메일이 존재하면 네비게이터를 보여줌, 각 카테고리마다 페이지 이동이 다름 -->
			              <c:if test="${not empty emailList}">
			              <div class="d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
				   				<ul class="pagination">
				   					<li class="page-item">
				   						<c:if test="${kind eq 'send'}">
				       					<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=1" aria-label="Previous">
				         						<span aria-hidden="true">처음</span>
			       						</a>
			       						</c:if>
			       						<c:if test="${kind eq 'read'}">
				       					<a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=1" aria-label="Previous">
				         						<span aria-hidden="true">처음</span>
			       						</a>
			       						</c:if>
			       						<c:if test="${kind eq 'unread'}">
				       					<a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=1" aria-label="Previous">
				         						<span aria-hidden="true">처음</span>
			       						</a>
			       						</c:if>
			     					</li>	
			   						<c:if test="${pager.groupNo>1}">
			      					<li class="page-item">
			      						<c:if test="${kind eq 'send'}">
			        					<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
			          						<span aria-hidden="true">이전</span>
			        					</a>
			        					</c:if>
			        					<c:if test="${kind eq 'read'}">
			        					<a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
			          						<span aria-hidden="true">이전</span>
			        					</a>
			        					</c:if>
			        					<c:if test="${kind eq 'unread'}">
			        					<a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
			          						<span aria-hidden="true">이전</span>
			        					</a>
			        					</c:if>
			      					</li>
			     					</c:if>
			     					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			     						<c:if test="${pager.pageNo != i}">
			     						<c:if test="${kind eq 'send'}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${kind eq 'read'}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${kind eq 'unread'}">
										<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=${i}">${i}</a></li>
										</c:if>
										</c:if>
										<c:if test="${pager.pageNo == i}">
										<c:if test="${kind eq 'send'}">
										<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${kind eq 'read'}">
										<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${kind eq 'unread'}">
										<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=${i}">${i}</a></li>
										</c:if>
										</c:if>
									</c:forEach>
											
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<li class="page-item">
										<c:if test="${kind eq 'send'}">
			            				<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.endPageNo+1}" aria-label="Next">
			           						<span aria-hidden="true">다음</span>
			         					</a>
			         					</c:if>
			         					<c:if test="${kind eq 'read'}">
			            				<a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=${pager.endPageNo+1}" aria-label="Next">
			           						<span aria-hidden="true">다음</span>
			         					</a>
			         					</c:if>
			         					<c:if test="${kind eq 'unread'}">
			            				<a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=${pager.endPageNo+1}" aria-label="Next">
			           						<span aria-hidden="true">다음</span>
			         					</a>
			         					</c:if>
			   						</li>
									</c:if>
									<li class="page-item">
										<c:if test="${kind eq 'send'}">
			       						<a class="page-link" href="${pageContext.request.contextPath}/email/sendlist?pageNo=${pager.totalPageNo}" aria-label="Previous">
			    							<span aria-hidden="true">맨끝</span>
			   							</a>
			   							</c:if>
			   							<c:if test="${kind eq 'read'}">
			       						<a class="page-link" href="${pageContext.request.contextPath}/email/readlist?pageNo=${pager.totalPageNo}" aria-label="Previous">
			    							<span aria-hidden="true">맨끝</span>
			   							</a>
			   							</c:if>
			   							<c:if test="${kind eq 'unread'}">
			       						<a class="page-link" href="${pageContext.request.contextPath}/email/unreadlist?pageNo=${pager.totalPageNo}" aria-label="Previous">
			    							<span aria-hidden="true">맨끝</span>
			   							</a>
			   							</c:if>
			   						</li>	
			   					 </ul>
			 				  </nav>
		 					</div>
		 					</c:if>
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
		        <button type="button" class="btn btn-primary" onclick="trashEmail('send')">삭제</button>
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
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="reload()">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	  </main><!-- End #main -->
	
	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	</body>

</html>