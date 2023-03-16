<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/assets/js/approvalDelete.js"></script>
	
	<style>
		thead tr {
			border-bottom:2px solid #004389;
		}
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
  	<%@ include file="/WEB-INF/views/approval/approval_sidebar.jsp" %>
	<!-- ======= End Sidebar ======= -->	

  	<main id="main" class="main" style="height: 800px;">
    	<div class="pagetitle">
    		<h1>임시저장함</h1>
    	</div><!-- End Page Title -->

		<section class="section">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card" style="height:620px">
            			<div class="card-body">
              				<div class="card-title d-flex" style="padding-top:20px;margin-bottom:0px;padding-bottom:10px">
		              			<div class=" my-auto" style="text-align:left">
			                    	<button type="submit" form="delete" class="btn btn-danger btn-sm">삭제</button>
			              		</div>
		              		</div>
              				<!-- Table with hoverable rows -->
              				<form method="post" id="delete" action="${pageContext.request.contextPath}/approval/delete">
	              				<table class="table table-hover">
	                				<thead>
	                  					<tr>
						                    <th scope="col" width="5%"><input name="selectall" class="form-check-input" onclick='selectAll(this)' type="checkbox"></input></th>
						                    <th scope="col" width="10%">
							                    <a class="nav-link" href="#" data-bs-toggle="dropdown">
		            								<span class="d-none d-md-block dropdown-toggle">결재 양식</span>
		          								</a>
		          								<ul class="dropdown-menu ">
		            							<c:forEach var="approval_category" items="${approval_category}">
		          									<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>${approval_category.approvalName}</span>
		              								</a>
		          								</c:forEach>
									    	</ul>
	          								</th>
						                    <th scope="col" width="40%">제목</th>
						                    <th scope="col" width="20%">기안자/부서</th>
						                    <th scope="col" width="10%">상태</th>
						                    <th scope="col" width="15%">기안일시</th>
	                  					</tr>
	                				</thead>
	                				<tbody>
	                					<c:forEach var="approval" items="${approvals}" varStatus="index">
	                						<tr>
												<td><input name="approvalId" class="form-check-input" value="${approval.approvalId}" onclick='checkSelectAll()' type="checkbox"></td>						                    <td>${approval.categoryName}</td>
							                    <td><a href="${pageContext.request.contextPath}/approval/tempForm?approvalId=${approval.approvalId}">${approval.title}</a></td>
							                    <td>${approval.empName} / ${approval.deptName}</td>
							                    <c:if test="${approval.status eq '대기'}">
							                    	<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
							                    </c:if>
												<c:if test="${approval.status eq '진행'}">
							                    	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
							                    </c:if>						                    
							                    <c:if test="${approval.status eq '승인'}">
							                    	<td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
							                    </c:if>
							                    <c:if test="${approval.status eq '반려'}">
							                    	<td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
							                    </c:if>
							                    <td>${approval.writeDate}</td>
	                  						</tr>
	                					</c:forEach>
	                				</tbody>
	              				</table>
              				</form>
             				<!-- End Table -->
            			</div>
            			<c:if test="${empty approvals}">
		              		<div style="height:200px;text-align:center;">
		              			내용이 존재하지 않습니다.
		              	  	</div>
		              	</c:if>
		              	<c:if test="${not empty approvals}">
            			<div class="card-footer d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
                				<ul class="pagination">
                					<li class="page-item">
                    					<a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=1" aria-label="Previous">
                      						<span aria-hidden="true">처음</span>
                    					</a>
                  					</li>	
                					<c:if test="${pager.groupNo>1}">
	                  					<li class="page-item">
	                    					<a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	                      						<span aria-hidden="true">이전</span>
	                    					</a>
	                  					</li>
                  					</c:if>
                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                  						<c:if test="${pager.pageNo != i}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<li class="page-item">
		                    				<a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=${pager.endPageNo+1}" aria-label="Next">
		                      					<span aria-hidden="true">다음</span>
		                    				</a>
	                  					</li>
									</c:if>
									<li class="page-item">
                    					<a class="page-link" href="${pageContext.request.contextPath}/approval/templist/${approvalCategoryId}?pageNo=${pager.totalPageNo}" aria-label="Previous">
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

  	<!-- ======= Footer ======= -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>