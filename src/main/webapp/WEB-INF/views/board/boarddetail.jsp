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
			<section class="section">
		      <div class="row">
		        <div class="col-lg-12">
		
		          <div class="card">
		            <div class="card-body">
		              <div class="d-flex mb-4">
		              	<!-- 중요메일 표시 아이콘 -->
		              	<span class="mt-4" style="font-size:24px;"><b>[공지] 출결(전자출결,휴가,지하철 연착 등)관련 안내</b></span>
		              	<div style="text-align:center;margin-top:24px;margin-left:20px;">
		                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
		                    <button type="button" class="btn btn-danger btn-sm">삭제</button>
		                  	<script>
		                  	
		                  	function reply(sendEmailId){
		                  		location.href="${pageContext.request.contextPath}/email/reply?emailId="
	                  				+ sendEmailId;
		                  	}
		                  	
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
												$("#importantDeleteModal").modal('show');	
											} else {
												$("#importantTrashModal").modal('show');	
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
		                  		var type = ''
		                  		var data = {"emailId" : emailId, "type" : 'send'};
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
		              	
		              </div>
		
		              <!-- General Form Elements -->
		                <div class="row ">
			                <div class="col-sm-6 row">
			                  <label for="inputText" class="col-md-2 col-form-label">조회수</label>
			                  <div class="col-md-8 my-auto d-flex">
			                   		<p style="color:grey" class="my-auto">129 </p>
			                  </div>
			                </div>
			                
			                 <div class="col-sm-6 row">
			                  <label for="inputText" class="col-md-2 col-form-label">작성 날짜</label>
			                  <div class="col-sm-8 my-auto">
			                    <p class="my-auto" style="color:grey;font-size:15px">2023-03-12</p>
			                  </div>
			                 </div>
		                </div>
		               <hr/>
		                
		                <div class="row mb-3 file-list" style="margin-left:15px; margin-right:15px;background-color:#F6F6F6">
			                <div class="filebox">
			                <ul style="list-style:none;">
				                <li>
				                   <table style="width:60%;overflow: auto;">
						                 <tr>
						               		<td style="width:70%;padding-bottom:3px">
						               			<a href="#">출결.jpg</a>
						               		</td>
						               		<td  style="width:30%;color:#949291">
						               			100KB<i class="bi bi-paperclip"></i>
						               		</td>
						                 </tr>
					               </table>
					             <li>
				             </ul>	
		               		</div>
		                </div>
		                
		                <div class="row mb-3 px-4">
		                  <div class="col-sm-12 mail-content px-3" style="height:500px">
		             			<p>수 신 : ○○○ 님<br>일 자 : 20 년 월 일<br>제 목 : 본사 해외지사의 올해 업무 보고입니다.<br>---------------------------------------------------------------------------------------------------<br>귀 부서의 노고에 감사를 드립니다.<br>본사는 현재 ○지역에서 해외지사를 운영하고 있습니다. 이들 해외지사는 지난 ○○년에 본사가 글로벌 경영이라는 경영기본 방침을 세우면서 추진되었던 사항으로 본사에서는 이들 해외지사를 통해 해외시장 개척을 통한 글로벌 경영이라는 목적을 달성하고 있습니다. 하지만 국제유가 상승 등 국제적으로 경제가 안 좋은 상황에 놓여있기 때문에 본사에서는 이들 문제를 해결하기 위한 방안을 마련 중에 있습니다. 이런 영향때문인지 본사의 해외지사들도 지난해 매출 및 경영상황이 그리 좋아지지 않았습니다. 올해에도 여전히 국제 경영환경이 좋아질 것이라는 전망이 나오지 않고 있기 때문에 본사에서는 여러 방안을 강구하고 있는 상황이지만 이를 돌파할 수 있는 대책마련은 어려운 상황입니다.<br>본사 해외지사의 올해 업무보고를 첨부하오니 해외지사들의 올해 계획 설정에 참고해 주시기 바랍니다.<br>○○○ 올림</p>
		                  </div>
		                </div>
		
		
		            </div>
		          </div>
		        </div>
		      </div>
		    </section>
		    
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
			        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/email/deleteDetail?emailId=${emailDetail.sendEmailId}">삭제</a>
			      </div>
			    </div>
			  </div>
			</div>
			    
		
		  </main><!-- End #main -->
		
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
		
		</body>

</html>