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
  
  		
  	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp" %>	

  	<main id="main" class="main">
    	<c:if test="${loginEmployee.empId == vacationList[0].empId}">
			<div class="pagetitle mt-3">
				<h1>내 문서함</h1>
				<ol class="breadcrumb">
	          		<li class="breadcrumb-item">휴가</li>
	          		<li class="breadcrumb-item">휴가 신청 목록</li>
        		</ol>
			</div>
		</c:if>
		<c:if test="${loginEmployee.empId != vacationList[0].empId}">
			<div class="pagetitle mt-3">
				<h1>결재 문서함</h1>
				<ol class="breadcrumb">
	          		<li class="breadcrumb-item">휴가</li>
	          		<li class="breadcrumb-item">휴가 신청 목록</li>
        		</ol>
			</div>
		</c:if>
    	
    	<!-- 페이지 제목 -->
		
		<section class="section mt-3">
      		<div class="row">
        		<div class="col-lg-12">
        		
          			<div class="card" style="height:620px">
            			<div class="card-body px-5">
              				<h5 class="card-title"></h5>

              				<!-- Table with hoverable rows -->
              				<table class="table table-hover">
                				<thead>
                  					<tr>
					                    <!-- <th scope="col" width="10%">#</th> -->
					                    <th scope="col" width="20%">번호</th>
					                    <th scope="col" width="20%">휴가종류</th>
					                    <th scope="col" width="30%">기간</th>
					                    <th scope="col" width="15%">일수</th>
					                    <th scope="col" width="15%">상태</th>
						                   
          								
                  					</tr>

                				</thead>
                				<tbody>
                					<c:forEach var="vacation" items="${vacationList}" varStatus="index">
                						<tr onClick='location.href="${pageContext.request.contextPath}/vacation/detail?vacationId=${vacation.vacationId}&pageNo=${pager.pageNo}&status=${status}"'>
						                    <%-- <th scope="row">${index.count}</th> --%>
						                    <td>${vacation.vacationId}</td>
						                    <td>${vacation.vacationName}</td>
						                    <td>${vacation.startDate} ~ ${vacation.endDate}</td>
						                    <td>${vacation.countDay}</td>
						                    <c:if test="${vacation.status eq '대기'}">
						                    	<td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
						                    </c:if>
											<c:if test="${vacation.status eq '진행'}">
						                    	<td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
						                    </c:if>						                    
						                    <c:if test="${vacation.status eq '승인'}">
						                    	<td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
						                    </c:if>
						                    <c:if test="${vacation.status eq '반려'}">
						                    	<td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
						                    </c:if>
						                    
                  						</tr>
                					</c:forEach>
                				</tbody>
              				</table>
             				<!-- End Table -->
            			</div>
            			<c:if test="${empty vacationList}">
		              		<div class="d-flex align-items-center justify-content-center" style="height:400px;">
		              			내용이 존재하지 않습니다.
		              	  	</div>
		              	</c:if>
		              	<c:if test="${not empty vacationList}">
            			<div class="d-flex justify-content-center" style="vertical-align:bottom">
			  				<nav aria-label="Page navigation example">
                				<ul class="pagination">
                					<li class="page-item">
                    					<a class="page-link" href="?pageNo=1&status=${status}" aria-label="Previous">
                      						<span aria-hidden="true">처음</span>
                    					</a>
                  					</li>	
                					<c:if test="${pager.groupNo>1}">
	                  					<li class="page-item">
	                    					<a class="page-link" href="?pageNo=${pager.startPageNo-1}&status=${status}" aria-label="Previous">
	                      						<span aria-hidden="true">이전</span>
	                    					</a>
	                  					</li>
                  					</c:if>
                  					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                  						<c:if test="${pager.pageNo != i}">
											<li class="page-item"><a class="page-link" href="?pageNo=${i}&status=${status}">${i}</a></li>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<li class="page-item active"><a class="page-link" href="?pageNo=${i}&status=${status}">${i}</a></li>
										</c:if>
									</c:forEach>
									
									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<li class="page-item">
		                    				<a class="page-link" href="?pageNo=${pager.endPageNo+1}&status=${status}" aria-label="Next">
		                      					<span aria-hidden="true">다음</span>
		                    				</a>
	                  					</li>
									</c:if>
									<li class="page-item">
                    					<a class="page-link" href="?pageNo=${pager.totalPageNo}&status=${status}" aria-label="Previous">
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