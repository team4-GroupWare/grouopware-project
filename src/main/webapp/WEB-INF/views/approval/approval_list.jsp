<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        		<a class="btn btn-primary" type="button" href="approval_form.html" style="width:100%">
	          		<i class="bi bi-pencil-square"></i> 
	          		<span>결재 작성</span>
        		</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check"></i><span>결재 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
          			</li>
        		</ul>
     		</li><!-- End 결재 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#myapproval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check-fill"></i><span>내 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="myapproval-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#" class="active"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
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
          			<i class="bi bi-file-earmark"></i><span>임시저장함</span>
        		</a>
      		</li><!-- End 임시저장함 -->
    	</ul>
  	</aside><!-- End Sidebar -->

  	<main id="main" class="main">
    	<div class="pagetitle">
    		<h1>내 문서함</h1>
      			<nav>
		        	<ol class="breadcrumb">
		          		<li class="breadcrumb-item"><a href="index.html">전자결재</a></li>
		          		<li class="breadcrumb-item"><a href="index.html">내 문서함</a></li>
		          		<li class="breadcrumb-item">전체</li>
		        	</ol>
      			</nav>
    	</div><!-- End Page Title -->

		<section class="section">
      		<div class="row">
        		<div class="col-lg-12">
          			<div class="card">
            			<div class="card-body">
              				<h5 class="card-title"></h5>

              				<!-- Table with hoverable rows -->
              				<table class="table table-hover">
                				<thead>
                  					<tr>
					                    <th scope="col">#</th>
					                    <th scope="col">결재 양식</th>
					                    <th scope="col">제목</th>
					                    <th scope="col">기안자/부서</th>
					                    <th scope="col">상태</th>
					                    <th scope="col">기안일시</th>
                  					</tr>
                				</thead>
                				<tbody>
                  					<tr onClick="location.href='approval_detail.html'">
					                    <th scope="row">1</th>
					                    <td>기안서</td>
					                    <td>[공공사업1 Div] 하반기 기안서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-16</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">2</th>
					                    <td>기안서</td>
					                    <td>대법원 유지보수 기안서</td>
					                    <td>이예승 / 공공사업2 Div</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-12</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">3</th>
					                    <td>휴일 근무 신청서</td>
					                    <td>휴일 근무 신청서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
					                    <td>2023-02-05</td>
                  					</tr>
                  					<tr>
				                    <th scope="row">4</th>
				                    	<td>지출 품위서</td>
					                    <td>[공공사업1 Div/솔루션개발팀] 지출품위서</td>
					                    <td>이연희 / 공공사업1 Div</td>
					                    <td><span class="badge bg-warning text-dark"><i class="bi bi-clock-history me-1"></i> 진행</span></td>
					                    <td>2023-02-11</td>
				                  	</tr>
                  					<tr>
					                    <th scope="row">5</th>
					                    <td>연장 근무 신청서</td>
					                    <td>연장 근무 신청서</td>
					                    <td>이지호 / 공공사업1 Div</td>
					                    <td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
					                    <td>2023-02-04</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">6</th>
					                    <td>기안서</td>
					                    <td>신입 멘토링 기안서</td>
					                    <td>최은종 / 경영지원실</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-14</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">7</th>
					                    <td>사직서</td>
					                    <td>사직서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-01</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">8</th>
					                    <td>기안서</td>
					                    <td>기안서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> 승인</span></td>
					                    <td>2023-02-10</td>
                 					</tr>
                  					<tr>
					                    <th scope="row">9</th>
					                    <td>기안서</td>
					                    <td>기안서</td>
					                    <td>작성자/부서</td>
					                    <td><span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i> 반려</span></td>
					                    <td>2023-01-28</td>
                  					</tr>
                  					<tr>
					                    <th scope="row">10</th>
					                    <td>휴일 근무 신청서</td>
					                    <td>휴일 근무 신청서</td>
					                    <td>작성자 / 부서</td>
					                    <td><span class="badge bg-secondary"><i class="bi bi-hourglass me-1"></i> 대기</span></td>
					                    <td>2023-02-09</td>
                  					</tr>
                				</tbody>
              				</table>
             				<!-- End Table with hoverable rows -->
              				<div class="d-flex justify-content-center">
				  				<nav aria-label="Page navigation example">
	                				<ul class="pagination">
	                  					<li class="page-item">
	                    					<a class="page-link" href="#" aria-label="Previous">
	                      						<span aria-hidden="true">«</span>
	                    					</a>
	                  					</li>
	                  					<li class="page-item"><a class="page-link" href="#">1</a></li>
	                  					<li class="page-item"><a class="page-link" href="#">2</a></li>
	                  					<li class="page-item"><a class="page-link" href="#">3</a></li>
	                  					<li class="page-item">
		                    				<a class="page-link" href="#" aria-label="Next">
		                      					<span aria-hidden="true">»</span>
		                    				</a>
	                  					</li>
	                				</ul>
	              				</nav>
              				</div>
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