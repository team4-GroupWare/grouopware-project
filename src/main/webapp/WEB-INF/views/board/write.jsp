<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<%@ include file="/WEB-INF/views/common/head.jsp" %>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
  		<!-- ======= Sidebar ======= -->
		<aside id="sidebar" class="sidebar">
		 	<ul class="sidebar-nav" id="sidebar-nav">
		 		<c:if test="${loginEmployee.deptName eq '경영지원실' }">
					<li class="nav-item">
			        	<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/email/write" style="width:100%">
			          		<i class="bi bi-pencil-square"></i> 
			          		<span>게시글 작성</span>
			        	</a>
			      	</li><!-- End 게시글 작성 -->
		      	</c:if>
		      	<li class="nav-item">
		        	<a class="nav-link collapsed"  href="${pageContext.request.contextPath}/board/list">
		          		<i class="bi bi-envelope-paper"></i><span>공지사항</span><i></i>
		        	</a>
		      	</li><!-- End 공지사항 -->
		      	<li class="nav-item">
		        	<a class="nav-link collapsed " href="${pageContext.request.contextPath}/board/list">
		          		<i class="bi bi-envelope"></i><span>사내 경조사</span>
		        	</a>
		      	</li><!-- End 사내 경조사 -->
			</ul>
		</aside><!-- End Sidebar -->
		<main id="main" class="main ">
			<section class="section">
	      		<div class="row">
	        		<div class="col-lg-12">
	          			<div class="card p-3"> 
	            			<div class="card-body">
	              				<div class="row">
		              				<h2 class="card-title col-8"><b>알림마당 작성</b></h2>
		              				<div class="col-sm-4 my-auto" style="text-align:right">
		                				<button type="submit" class="btn btn-primary" form="boardWirte">작성</button>
		              				</div>
	              				</div>
	
	              				<!-- General Form Elements -->
	              				<form id="boardWirte" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/board/write">
	                				<input id="writer" type="hidden" name="writer" value="${loginEmployee.empId}">
	                				<div class="row mb-3">
	                 					<label for="inputText" class="col-sm-2 col-form-label">제목</label>
	                  					<div class="col-sm-9">
	                    					<input type="text" class="form-control" name="noticeTitle" id="title">
	                  					</div>
	                				</div>
	                
	                				<div class="row mb-3" >
	                					<label for="inputText" class="col-sm-2 col-form-label">카테고리</label>
		                 				<select name="boardCateId" class="form-select col-sm-10" aria-label="Default select example" style="width:200px;margin-left:9px">
					    					<option value="1">공지사항</option>
					    					<option value="2">사내 경조사</option>
										</select>
	                				</div>
	                
	                				<div class="row mb-3">
	                					<label for="inputText" class="col-sm-2 col-form-label">파일 첨부</label>
			        					<input class="form-control" id="formFile" type="file" name="file" style="width:340px;margin-left:9px"/>
	                				</div>
	                
	                				<div class="row mb-3">
	                  					<div class="col-sm-12 px-3"style="height:500px">
	                     					<textarea name="noticeContent" id="tinymce-editor" class="mx-auto" style="height:80%;width:95%">
	              							</textarea><!-- End TinyMCE Editor -->
	              							<!-- <input id="content" type="hidden" name="content"> -->
	                  					</div>
	                				</div>
	              				</form><!-- End General Form Elements -->
	            			</div>
	          			</div>
	        		</div>
	      		</div>
	    	</section>
	  	</main><!-- End #main -->
		<%-- <script src="${pageContext.request.contextPath}/resources/assets/vendor/tinymce/tinymce.min.js"></script> --%>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>