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
	    		<c:if test="${loginEmployee.deptName eq '경영지원실' }">
	      		<li class="nav-item">
	        		<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/board/write" style="width:100%">
	          			<i class="bi bi-pencil-square"></i> 
	          			<span>게시글 작성</span>
	        		</a>
	      		</li><!-- End 게시글 작성 -->
	      		</c:if>
	
	      		<li class="nav-item">
	        		<a class="nav-link collapsed"  href="${pageContext.request.contextPath}/board/list/1">
	          			<i class="bi bi-envelope-paper"></i><span>공지사항</span><i></i>
	        		</a>
	      		</li><!-- End 공지사항 -->
	
	      		<li class="nav-item">
	        		<a class="nav-link collapsed " href="${pageContext.request.contextPath}/board/list/2">
	          			<i class="bi bi-envelope"></i><span>사내 경조사</span>
	        		</a>
	      		</li><!-- End 사내 경조사 -->
	
	    	</ul>
	  	</aside><!-- End Sidebar -->
	  	
		<main id="main" class="main ">
			<section class="section">
		      	<div class="row">
		        	<div class="col-lg-12">
		          		<div class="card">
		            		<div class="card-body">
		              			<div class="d-flex mb-4">
					              	<span class="mt-4" style="font-size:24px;"><b>${noticeNoard.noticeTitle}</b></span>
					              	<div style="text-align:center;margin-top:24px;margin-left:20px;">
		                    			<button type="button" class="btn btn-danger btn-sm">삭제</button>
		                  			</div>
		              			</div>
		
		              			<!-- General Form Elements -->
		                		<div class="row ">
			                		<div class="col-sm-6 row">
			                  			<label for="inputText" class="col-md-2 col-form-label">조회수</label>
			                  			<div class="col-md-8 my-auto d-flex">
			                   				<p style="color:grey" class="my-auto">${noticeNoard.readCount}</p>
			                  			</div>
			                		</div>
			                
			                 		<div class="col-sm-6 row">
			                  			<label for="inputText" class="col-md-2 col-form-label">작성 날짜</label>
			                  			<div class="col-sm-8 my-auto">
			                    			<p class="my-auto" style="color:grey;font-size:15px">${noticeNoard.writeDate}</p>
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
						               						<a href="#">${noticeNoard.noticeFileName}</a>
						               					</td>
						               					<td  style="width:30%;color:#949291">
						               						${noticeNoard.noticeFileSize/1000}KB<i class="bi bi-paperclip"></i>
						               					</td>
						                 			</tr>
					               				</table>
					             			</li>
				             			</ul>	
		               				</div>
		                		</div>
		                
		                		<div class="row mb-3 px-4">
		                			<div class="col-sm-12 mail-content px-3" style="height:500px">
		                  				${noticeNoard.noticeContent}
		                  			</div>
		                		</div>
		            		</div>
		         		</div>
		        	</div>
		      	</div>
		    </section>
		</main><!-- End #main -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>