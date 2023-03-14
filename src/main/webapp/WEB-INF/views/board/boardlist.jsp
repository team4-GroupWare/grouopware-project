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

 		<main id="main" class="main" style="margin-bottom: 70px;">
  			<div class="pagetitle">
      			<h1>알림 마당</h1>
    		</div><!-- End Page Title -->

    		<section class="section">
      			<div class="row">
        			<div class="col-lg-12">
          				<div class="card" style="height:620px">
            				<div class="card-body p-4">
	              				<table class="table table-hover">
	                				<thead>
	                  					<tr style="border-bottom:2px solid #004389;">
	                    					<th scope="col" width="50%">제목</th>
	                    					<th scope="col" width="20%">작성자</th>
	                    					<th scope="col" width="20%">날짜</th>
	                    					<th scope="col" width="10%">조회수</th>
	                  					</tr>
	                				</thead>
	                				<tbody>
	                					<c:forEach var="boardList" items="${boardList}" varStatus="index">
	                  						<tr>
	                    						<td><a href="${pageContext.request.contextPath}/board/detail/${boardList.noticeId}">${boardList.noticeTitle}</a>
	                    						</td>
	                    						<td>${boardList.writer}</td>
	                    						<td>${boardList.writeDate}
	                    						</td>
	                    						<td>${boardList.readCount}</td>
	                    					</tr>
                    					</c:forEach>
	                				</tbody>
	              				</table>
            				</div>
            				<c:if test="${empty boardList}">
			              		<div style="height:200px;text-align:center;margin-top:150px">
			              			내용이 존재하지 않습니다.
			              	  	</div>
			              	</c:if>
			              	<c:if test="${not empty boardList}">
	              				<div class="d-flex justify-content-center" style="vertical-align: bottom">
					  				<nav aria-label="Page navigation example">
		                				<ul class="pagination">
		                					<li class="page-item">
		                    					<a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=1" aria-label="Previous">
		                      						<span aria-hidden="true">처음</span>
		                    					</a>
		                  					</li>	
		                					<c:if test="${pager.groupNo>1}">
			                  					<li class="page-item">
			                    					<a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=${pager.startPageNo-1}" aria-label="Previous">
			                      						<span aria-hidden="true">이전</span>
			                    					</a>
			                  					</li>
		                  					</c:if>
		                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		                  						<c:if test="${pager.pageNo != i}">
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=${i}">${i}</a></li>
												</c:if>
												<c:if test="${pager.pageNo == i}">
													<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=${i}">${i}</a></li>
												</c:if>
											</c:forEach>
											
											<c:if test="${pager.groupNo<pager.totalGroupNo}">
												<li class="page-item">
				                    				<a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=${pager.endPageNo+1}" aria-label="Next">
				                      					<span aria-hidden="true">다음</span>
				                    				</a>
			                  					</li>
											</c:if>
											<li class="page-item">
		                    					<a class="page-link" href="${pageContext.request.contextPath}/board/list/${boardCateId}?pageNo=${pager.totalPageNo}" aria-label="Previous">
		                      						<span aria-hidden="true">맨끝</span>
		                    					</a>
		                  					</li>	
		                				</ul>
		              				</nav>
		              			</div>
	              			</c:if>
          				</div>
        			</div>
     			</div>
    		</section>
  		</main><!-- End #main -->
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>