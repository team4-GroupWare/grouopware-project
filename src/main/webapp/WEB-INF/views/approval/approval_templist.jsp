<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script>
		$(document).ready(function () {
			$(".docuMenu").click(function () {
				colsole.log("실행");
				$(".docuMenu").addClass("active");
		  	});
		});
	</script>
	
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
    <aside id="sidebar" class="sidebar">
    	<ul class="sidebar-nav" id="sidebar-nav">
      		<li class="nav-item">
        		<a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/approval/write" style="width:100%">
	          		<i class="bi bi-pencil-square"></i> 
	          		<span>결재 작성</span>
        		</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="${pageContext.request.contextPath}/approval/list">
          			<i class="bi bi-clipboard2-check"></i><span>결재 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='대기'"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='진행'"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='승인'"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='반려'"><span>반려</span></a>
          			</li>
        		</ul>
     		</li><!-- End 결재 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#myapproval-nav" data-bs-toggle="collapse" href="${pageContext.request.contextPath}/approval/list">
          			<i class="bi bi-file-text"></i><span>내 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="myapproval-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist?status=대기"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist?status=진행"><span>진행</span></a>
          			</li> 
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist?status=승인"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist?status=반려"><span>반려</span></a>
          			</li>
        		</ul>
      		</li><!-- End 내 문서함 -->
      		

      		<li class="nav-item">
        		<a class="nav-link collapsed" href="#">
          			<i class="bi bi-eye"></i><span>열람함</span>
        		</a>
      		</li><!-- End 열람함 -->
      		
      		<li class="nav-item">
        		<a class="nav-link collapsed" href="#">
          			<i class="bi bi-tags-fill"></i><span>참조 문서함</span>
        		</a>
      		</li><!-- End 참조 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link active" href="${pageContext.request.contextPath}/approval/templist">
          			<i class="bi bi-file-earmark"></i><span>임시저장함</span>
        		</a>
      		</li><!-- End 임시저장함 -->
    	</ul>
  	</aside><!-- End Sidebar -->

  	<main id="main" class="main">
    	<div class="pagetitle">
    		<h1>임시저장함</h1>
    	</div><!-- End Page Title -->

		<section class="section">
      		<div class="row">
        		<div class="col-lg-10">
          			<div class="card" style="height:620px">
            			<div class="card-body">
              				<h5 class="card-title"></h5>

              				<!-- Table with hoverable rows -->
              				<table class="table table-hover">
                				<thead>
                  					<tr>
					                    <!-- <th scope="col" width="10%">#</th> -->
					                    <th scope="col" width="15%">결재 양식</th>
					                    <th scope="col" width="35%">제목</th>
					                    <th scope="col" width="15%">기안자/부서</th>
					                    <th scope="col" width="10%">상태</th>
					                    <th scope="col" width="15%">기안일시</th>
                  					</tr>
                				</thead>
                				<tbody>
                					<c:forEach var="approval" items="${approvals}" varStatus="index">
                						<tr>
						                    <%-- <th scope="row">${index.count}</th> --%>
						                    <td>${approval.categoryName}</td>
						                    <td><a href="${pageContext.request.contextPath}/approval/detail?approvalId=${approval.approvalId}&pageNo=${pager.pageNo}&status=${status}">${approval.title}</a></td>
						                    <td>${approval.empName}</td>
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
             				<!-- End Table -->
            			</div>
            			<div class="card-footer d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
                				<ul class="pagination">
                					<li class="page-item">
                    					<a class="page-link" href="tmplist?pageNo=1" aria-label="Previous">
                      						<span aria-hidden="true">처음</span>
                    					</a>
                  					</li>	
                					<c:if test="${pager.groupNo>1}">
	                  					<li class="page-item">
	                    					<a class="page-link" href="templist?pageNo=${pager.startPageNo-1}" aria-label="Previous">
	                      						<span aria-hidden="true">이전</span>
	                    					</a>
	                  					</li>
                  					</c:if>
                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                  						<c:if test="${pager.pageNo != i}">
											<li class="page-item"><a class="page-link" href="templist?pageNo=${i}">${i}</a></li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<li class="page-item active"><a class="page-link" href="templist?pageNo=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<li class="page-item">
		                    				<a class="page-link" href="templist?pageNo=${pager.endPageNo+1}" aria-label="Next">
		                      					<span aria-hidden="true">다음</span>
		                    				</a>
	                  					</li>
									</c:if>
									<li class="page-item">
                    					<a class="page-link" href="templist?pageNo=${pager.totalPageNo}" aria-label="Previous">
                      						<span aria-hidden="true">맨끝</span>
                    					</a>
                  					</li>	
                				</ul>
              				</nav>
              			</div>
          			</div>
        		</div>
      		</div>
    	</section>
  	</main><!-- End #main -->

  	<!-- ======= Footer ======= -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>