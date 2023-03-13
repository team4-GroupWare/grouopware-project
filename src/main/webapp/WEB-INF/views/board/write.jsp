<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/ckeditor/build/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
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
		              <div class="row">
			              <h2 class="card-title col-7"><b>알림마당 작성</b></h2>
			              <div class="col-sm-5 my-auto" style="text-align:right">
			                <button type="button" class="btn btn-primary">작성</button>
			              </div>
		              </div>
		
		              <!-- General Form Elements -->
		              <form id="writeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/board/write">
		                <div class="row mb-3">
		                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="title" id="title">
		                  </div>
		                </div>
		                
		                <div class="row mb-3" >
		                	<label for="inputText" class="col-sm-2 col-form-label">카테고리</label>
			                 <select class="form-select col-sm-10" aria-label="Default select example" style="width:200px;margin-left:9px">
						    	<option value="1">공지사항</option>
						    	<option value="2">사내 경조사</option>
							</select>
		                </div>
		                
		                <div class="row mb-3">
		                	<label for="inputText" class="col-sm-2 col-form-label"></label>
				        	<input class="form-control" id="formFile" type="file" name="file" style="width:340px;margin-left:9px"/>
		                </div>
		                
		                <div class="row mb-3">
		                  <div class="col-sm-12 px-3"style="height:500px">
		                     <textarea id="tinymce-editor" class="mx-auto" style="height:80%;width:95%">
		              		</textarea><!-- End TinyMCE Editor -->
		              		<input id="content" type="hidden" name="content">
		                  </div>
		                </div>
		              </form><!-- End General Form Elements -->
		            </div>
		          </div>
		        </div>
		      </div>
		    </section>
		    
		    <!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="tempModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 임시저장
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">임시저장 되었습니다.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="notMe" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 나에게 메일
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">나에게 메일을 작성할 수 없습니다.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="inputName" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 수신인
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">받는 사람의 아이디를 입력해주세요.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		
		  </main><!-- End #main -->
		  <script src="${pageContext.request.contextPath}/resources/assets/vendor/tinymce/tinymce.min.js"></script>
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>