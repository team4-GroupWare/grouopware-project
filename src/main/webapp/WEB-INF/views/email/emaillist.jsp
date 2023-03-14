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
	  color : #18264d;
	}
	table a:active {
	  color : #97ACFC;
	}
	
	table a:visited {
	  color : #aaafb6;
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
	  <div class="pagetitle">
	  	  <c:if test="${type eq 'receive'}">
	      <h1>받은메일함</h1>
	      </c:if>
	      
	      <c:if test="${type eq 'trash'}">
	      <h1>휴지통</h1>
	      </c:if>
	      
	      <c:if test="${type eq 'temp'}">
	      <h1>임시저장함</h1>
	      </c:if>
	    </div><!-- End Page Title -->

    <section class="section">
      <div id="part" class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <div class="card-title d-flex" style="padding-top:10px;margin-bottom:0px;padding-bottom:0px">
              		 <div class=" my-auto" style="text-align:left">
	              		<c:if test="${type eq 'trash'}">
	              		<!-- 휴지통에서 조회한 경우 -->
	              		<button type="submit" class="btn btn-secondary btn-sm " onclick="restore()">복구</button>
	              		</c:if>
	              		<c:if test="${type ne 'trash'}">
	              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
	                    <button onclick="checkEmail('${type}')" class="btn btn-danger btn-sm">삭제</button>
	                    </c:if>
	                    <c:if test="${type eq 'trash'}">
	                    <!-- 휴지통에서는 영구삭제가 가능함 -->
	                    <button type="submit" class="btn btn-danger btn-sm" onclick="checkEmail('${type}')">영구삭제</button>
	                    </c:if>
	                    <c:if test="${type eq 'trash'}">
		                <p class="small" style="color:grey;margin-bottom:0px;margin-top:5px">휴지통에 보관된 이메일은 10일 이후 자동으로 삭제됩니다.</p>
		                </c:if>
	                    <script>
	                    	function restore(){
	                    		var checkArr = [];
								$('input[type=checkbox][name="selectone"]:checked').each(function() {
									var checkValue = $(this).val();
									console.log(checkValue);
									checkArr.push(checkValue);
								})
								
								var data = {"checkArr" : checkArr};
								$.ajax({
									url : "${pageContext.request.contextPath}/email/restore",
									method : "post",
									data : data,
									contentType : "application/x-www-form-urlencoded",
									traditional: true
								}).done((data)=> {
									console.log("성공: "+data);
									reload();
								});
	                    	}
	                    	
							function checkEmail(type){
								if(type != 'temp'){
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
										} else if(type != 'trash'){
											trashEmail(type);
										} else if(type == 'trash'){
											$("#deleteModal").modal('show');
										}
									});
								} else {
									deleteEmail(type);
								}
								
								
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
									if(type == 'receive'){
										$("#trashModal").modal('show');	
									} 
									
								});
							}
							
							function reload(type){
								location.reload();
							}
							
							function deleteEmail(type){
								var checkArr = [];
								$('input[type=checkbox][name="selectone"]:checked').each(function() {
									var checkValue = $(this).val();
									console.log(checkValue);
									checkArr.push(checkValue);
								})
								
								var data = {"checkArr" : checkArr, "type" : type};
								
								$.ajax({
									url : "${pageContext.request.contextPath}/email/deleteemail",
									method : "post",
									data : data,
									contentType : "application/x-www-form-urlencoded",
									traditional: true
								}).done((data)=> {
									reload();
								});
								
							}
							
							function trashOrDeleteEmail(type){
								if(type == 'trash'){
									$("#deleteModal").modal('show');
								} else {
									trashEmail(type);
								}
							}
							
							function search(type){
								var keyword = $("#keyword").val();
								location.href='${pageContext.request.contextPath}/email/search?keyword='+keyword+'&type='+type;
								
							}
						</script>
	                    
	              </div>
	               <div class="input-group p-2" style="width:350px;margin-left:auto">
		             <span class="input-group-text" id="basic-addon1">
		              	<i class="bi bi-search"></i>
		             </span>
	               	<input type="text" id="keyword" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               	<button type="button" onclick="search('${type}')" class="btn btn-secondary btn-sm ">검색</button>
	              </div>
	            
	             
              </div>
			  <div id="emailListpart">
	              <!-- Table with hoverable rows -->
	              <table class="table table-hover">
	                <thead>
	                  <tr style="border-bottom:2px solid #004389;">
	                  	<th scope="col" ><input name="selectall" class="form-check-input" onclick='selectAll(this)' type="checkbox"></input></th>
	                    <th scope="col">이름</th>
	                    <th scope="col">제목</th>
	                    <th scope="col">날짜</th>
	                  </tr>
	                </thead>
	                <tbody>
	               	  <c:if test="${not empty emailList}">
	                  <c:forEach var="emailList" items="${emailList}" varStatus="status">
	                  	<tr>
	                  	<c:if test="${type eq 'receive'}">
	                  	<td><input name="selectone" class="form-check-input" value="${emailList.receiveEmailId}" onclick='checkSelectAll()' type="checkbox"></td>
	                  	</c:if>
	                  	<c:if test="${type eq 'trash'and emailList.sentId eq loginEmployee.empId}">
	                  	<td><input name="selectone" class="form-check-input" value="${emailList.sendEmailId}" onclick='checkSelectAll()' type="checkbox"></td>
	                  	</c:if>
	                  	<c:if test="${type eq 'trash'and emailList.receiveId eq loginEmployee.empId}">
	                  	<td><input name="selectone" class="form-check-input" value="${emailList.receiveEmailId}" onclick='checkSelectAll()' type="checkbox"></td>
	                  	</c:if>
	                  	<c:if test="${type eq 'temp'}">
	                  	<td><input name="selectone" class="form-check-input" value="${emailList.tempEmailId}" onclick='checkSelectAll()' type="checkbox"></td>
	                  	</c:if>
	                  	<!-- 임시저장함이 아니고, 내가 보낸 사람일때 받은 사람 출력 -->
	                  	<c:if test="${loginEmployee.empId eq emailList.sentId and type ne 'temp' and type ne 'trash'}">
	                    <td>${emailList.receiveName}</td>
	                    </c:if>
	                    <!-- 내가 받은 사람일 때 보낸 사람 출력 -->
	                    <c:if test="${loginEmployee.empId eq emailList.receiveId and type ne 'trash'}">
	                    <td>${emailList.sentName}</td>
	                    </c:if>
	                    <c:if test="${ type eq 'trash'}">
	                    <td>${emailList.name}</td>
	                    </c:if>
	                    <!-- 임시보관함일 때 작성자(보내는 사람) 출력-->
	                    <c:if test="${type eq 'temp'}">
	                    <td>${loginEmployee.name}</td>
	                    </c:if>
	                    <!-- 쓰레기통이 아니고, 임시보관함이 아닐 땐 작성날짜를 출력 -->
	                    <c:if test="${type eq 'receive'}">
	                    <td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
	                    	<a href="${pageContext.request.contextPath}/email/readReceiveEmail?receiveEmailId=${emailList.receiveEmailId}">
	                    	${emailList.title}
	                    	</a>
	                    </td>
	                    </c:if>
	                    <!-- if조건을 바꿔야할 듯 -->
	                    <c:if test="${type eq 'trash'and emailList.sentId eq loginEmployee.empId}">
	                    <td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
	                    	<a href="${pageContext.request.contextPath}/email/readSendEmail?sendEmailId=${emailList.sendEmailId}">${emailList.title}</a>
	                    </td>
	                    </c:if>
	                    <!-- if조건을 바꿔야할 듯 -->
	                    <c:if test="${type eq 'trash' and emailList.receiveId eq loginEmployee.empId}">
	                    <td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
	                    	<a href="${pageContext.request.contextPath}/email/readReceiveEmail?receiveEmailId=${emailList.receiveEmailId}">${emailList.title}</a>
	                    </td>
	                    </c:if>
	                     <c:if test="${type eq 'temp'}">
	                    <td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
	                    	<a href="${pageContext.request.contextPath}/email/writeTempEmail?tempEmailId=${emailList.tempEmailId}">${emailList.title}</a>
	                    </td>
	                    </c:if>
	                    
	                    <c:if test="${type ne 'trash' and type ne 'temp'}">
	                    <td>${emailList.sentDate}</td>
	                    </c:if>
	                    <!-- 임시보관함일 때는 임시저장 날짜를 출력 -->
	                    <c:if test="${type eq 'temp'}">
	                    <td>${emailList.tempDate}</td>
	                    </c:if>
	                    <!-- 쓰레기통일 때는 쓰레기통에 넣었던 날짜를 출력. s는 내가 보낸 메일에서 삭제한 것, r은 내가 받은 메일에서 삭제한 것 -->
	                    <c:if test="${not empty emailList.strashDate and loginEmployee.empId eq emailList.sentId}">
	                    <td>${emailList.strashDate}</td>
	                    </c:if>
	                    <c:if test="${not empty emailList.rtrashDate and loginEmployee.empId eq emailList.receiveId}">
	                    <td>${emailList.rtrashDate}</td>
	                    </c:if>
	                    </tr>
	                  </c:forEach>
	                  </c:if>
	                </tbody>
	              </table>
	              <!-- End Table with hoverable rows -->
	              <c:if test="${empty emailList}">
	                <div style="height:200px;text-align:center;margin-top:150px">
	              			메일이 존재하지 않습니다.
	              	</div>
	              </c:if>
	              <c:if test="${not empty emailList}">
				  <div class="d-flex justify-content-center" style="vertical-align:bottom">
	  				<nav aria-label="Page navigation example">
		   				<ul class="pagination">
		   					<li class="page-item">
		   						<c:if test="${type eq 'receive'}">
		       					<a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=1" aria-label="Previous">
		         						<span aria-hidden="true">처음</span>
	       						</a>
	       						</c:if>
	       						<c:if test="${type eq 'trash'}">
		       					<a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=1" aria-label="Previous">
		         						<span aria-hidden="true">처음</span>
	       						</a>
	       						</c:if>
	       						<c:if test="${type eq 'important'}">
		       					<a class="page-link" href="${pageContext.request.contextPath}/email/importantlist?pageNo=1" aria-label="Previous">
		         						<span aria-hidden="true">처음</span>
	       						</a>
	       						</c:if>
	       						<c:if test="${type eq 'temp'}">
		       					<a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=1" aria-label="Previous">
		         						<span aria-hidden="true">처음</span>
	       						</a>
	       						</c:if>
	     					</li>	
	   						<c:if test="${pager.groupNo>1}">
	      					<li class="page-item">
	      						<c:if test="${type eq 'receive'}">
	        					<a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	          						<span aria-hidden="true">이전</span>
	        					</a>
	        					</c:if>
	        					<c:if test="${type eq 'trash'}">
	        					<a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	          						<span aria-hidden="true">이전</span>
	        					</a>
	        					</c:if>
	        					<c:if test="${type eq 'important'}">
	        					<a class="page-link" href="${pageContext.request.contextPath}/email/importantlist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	          						<span aria-hidden="true">이전</span>
	        					</a>
	        					</c:if>
	        					<c:if test="${type eq 'temp'}">
	        					<a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	          						<span aria-hidden="true">이전</span>
	        					</a>
	        					</c:if>
	      					</li>
	     					</c:if>
	     					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
	     						<c:if test="${pager.pageNo != i}">
	     						<c:if test="${type eq 'receive'}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${type eq 'trash'}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${type eq 'temp'}">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=${i}">${i}</a></li>
								</c:if>
								</c:if>
								<c:if test="${pager.pageNo == i}">
								<c:if test="${type eq 'receive'}">
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${type eq 'trash'}">
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${type eq 'temp'}">
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=${i}">${i}</a></li>
								</c:if>
								</c:if>
							</c:forEach>
									
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<li class="page-item">
								<c:if test="${type eq 'receive'}">
	            				<a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=${pager.endPageNo+1}" aria-label="Next">
	           						<span aria-hidden="true">다음</span>
	         					</a>
	         					</c:if>
	         					<c:if test="${type eq 'trash'}">
	            				<a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=${pager.endPageNo+1}" aria-label="Next">
	           						<span aria-hidden="true">다음</span>
	         					</a>
	         					</c:if>
	         					<c:if test="${type eq 'temp'}">
	            				<a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=${pager.endPageNo+1}" aria-label="Next">
	           						<span aria-hidden="true">다음</span>
	         					</a>
	         					</c:if>
	   						</li>
							</c:if>
							<li class="page-item">
								<c:if test="${type eq 'receive'}">
	       						<a class="page-link" href="${pageContext.request.contextPath}/email/receivelist?pageNo=${pager.totalPageNo}" aria-label="Previous">
	    							<span aria-hidden="true">맨끝</span>
	   							</a>
	   							</c:if>
	   							<c:if test="${type eq 'trash'}">
	       						<a class="page-link" href="${pageContext.request.contextPath}/email/trashlist?pageNo=${pager.totalPageNo}" aria-label="Previous">
	    							<span aria-hidden="true">맨끝</span>
	   							</a>
	   							</c:if>
	   							<c:if test="${type eq 'temp'}">
	       						<a class="page-link" href="${pageContext.request.contextPath}/email/templist?pageNo=${pager.totalPageNo}" aria-label="Previous">
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
	        <button type="button" class="btn btn-primary" onclick="trashOrDeleteEmail('${type}')">삭제</button>
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
	        <button type="button" class="btn btn-primary" onclick="deleteEmail('${type}')">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>