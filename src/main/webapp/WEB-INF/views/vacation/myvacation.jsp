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
  
  		
  	<!-- =========================sideber=============================== -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<!--휴가 작성 -->
			<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/form'">
				<a class="btn btn-primary" type="button" href="#" style="width:100%">
				    <i class="bi bi-pencil-square"></i> 
				    <span>휴가 작성</span>
			  	</a>
			</li>
			<!--근무 현황 -->
			<li class="nav-item"  onclick="location.href='${pageContext.request.contextPath}/attendance/status/info'">
				<a class="nav-link collapsed" href="#">
			    	<i class="bi bi-eye"></i>
			    	<span>근무 현황</span>
			  	</a>
			</li>
		
			<!--부서 근무 현황 -->
			<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/attendance/dept'">
				<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
			    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span>
			  	</a>
			</li>
		
			<!--내 휴가 문서 -->
			<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/my'" >
				<a class="nav-link collapsed" data-bs-target="#document2-nav" data-bs-toggle="collapse" href="#">
			    	<i class="bi bi-eye"></i>
			    	<span>내 휴가</span>
				</a>
				
			</li>
		
			<!--휴가 결제 문서 -->
			<li class="nav-item" onclick="location.href='${pageContext.request.contextPath}/vacation/document'"  >
				<a class="nav-link collapsed" data-bs-target="#document1-nav" data-bs-toggle="collapse" href="#">
			    	<i class="bi bi-eye"></i>
			    	<span>휴가 결제 문서</span>
				</a>
			</li>
		</ul>
	</aside>
	<!-- ======================================End Sidebar ============================================ -->

  	<main id="main" class="main">
    	
    	<!-- 페이지 제목 -->
		
		<section class="section mt-3">
      		<div class="row">
      			<div class="col-lg-6">
      				<div class="pagetitle">
			   			<h1>휴가 현황</h1>
					</div>
      				<div class="card info-card sales-card mt-3" >
	           			<div class="card-body mt-4">
			          		
			          		<div class="row ">
								<div class="col border-end">총 휴가 : 18일</div>
								<div class="col border-end">사용 휴가: 1일</div>
								<div class="col">잔여 휴가: 17일(잔여 연차)</div>
							</div>
		            	
		            	</div>
	        		</div>
      			</div>
      			<div class="col-lg-6">
      				<div class="pagetitle">
			   			<h1>대체휴가 현황</h1>
					</div>
      				<div class="card info-card sales-card mt-3" >
	           			<div class="card-body mt-4">
			          		
			          		<div class="row ">
								<div class="col border-end">지급 : 7일</div>
								<div class="col">휴가 종류: 경조사 (출산)</div>
							</div>
		            	
		            	</div>
	        		</div>
      			</div>
      		</div>
      		<div class="row">
        		<div class="col-lg-12">
        		<div class="pagetitle">
			   			<h1>휴가 신청 목록</h1>
					</div>
          			<div class="card" style="height:400px">
            			<div class="card-body">
              				<h5 class="card-title"></h5>

              				<!-- Table with hoverable rows -->
              				<table class="table table-hover">
                				<thead>
                  					<tr>
					                    <!-- <th scope="col" width="10%">#</th> -->
					                    <th scope="col" width="15%">결재양식</th>
					                    <th scope="col" width="35%">제목</th>
					                    <th scope="col" width="15%">기안자/부서</th>
					                     <th scope="col" width="10%">
						                    <a class="nav-link" href="#" data-bs-toggle="dropdown">
	            								<span class="d-none d-md-block dropdown-toggle ps-2">상태</span>
	          								</a>
		          							<ul class="dropdown-menu ">
		            							<li>
		              								<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>전체</span>
		              								</a>
		            							</li>
		            							<li>
		              								<hr class="dropdown-divider">
		            							</li>
		            							<li>
		              								<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>대기</span>
		              								</a>
		            							</li>
		            							<li>
		              								<hr class="dropdown-divider">
		            							</li>
		            							<li>
		              								<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>진행</span>
		              								</a>
									            </li>
									            <li>
		              								<hr class="dropdown-divider">
		            							</li>
									            <li>
		              								<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>승인</span>
		              								</a>
		            							</li>
		            							<li>
		              								<hr class="dropdown-divider">
		            							</li>
		            							<li>
		              								<a class="dropdown-item d-flex align-items-center" href="#">
		                								<span>반려</span>
		              								</a>
		            							</li>
		            							
									    	</ul>
          								</th>
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
            			<div class="d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
                				<ul class="pagination">
                					<li class="page-item">
                    					<a class="page-link" href="list?pageNo=1&status=${status}" aria-label="Previous">
                      						<span aria-hidden="true">처음</span>
                    					</a>
                  					</li>	
                					<c:if test="${pager.groupNo>1}">
	                  					<li class="page-item">
	                    					<a class="page-link" href="list?pageNo=${pager.startPageNo-1}&status=${status}" aria-label="Previous">
	                      						<span aria-hidden="true">이전</span>
	                    					</a>
	                  					</li>
                  					</c:if>
                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                  						<c:if test="${pager.pageNo != i}">
											<li class="page-item"><a class="page-link" href="list?pageNo=${i}&status=${status}">${i}</a></li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<li class="page-item active"><a class="page-link" href="list?pageNo=${i}&status=${status}">${i}</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<li class="page-item">
		                    				<a class="page-link" href="list?pageNo=${pager.endPageNo+1}&status=${status}" aria-label="Next">
		                      					<span aria-hidden="true">다음</span>
		                    				</a>
	                  					</li>
									</c:if>
									<li class="page-item">
                    					<a class="page-link" href="list?pageNo=${pager.totalPageNo}&status=${status}" aria-label="Previous">
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