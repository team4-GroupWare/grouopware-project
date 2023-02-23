<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <a class="btn btn-primary" type="button" href="../email/email_writeform.html" style="width:100%">
          <i class="bi bi-pencil-square"></i> 
          <span>메일 작성</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed"  href="../email/email_list.html">
          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
        </a>
      </li><!-- End Charts Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed " data-bs-target="#icons-nav" data-bs-toggle="collapse" >
          <i class="bi bi-envelope"></i><span>보낸 메일함</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          <li>
            <a href="../email/send_email_list.html">
              <span>전체</span>
            </a>
          </li>
          <li>
            <a href="../email/email_list.html" >
              <span>미수신 메일</span>
            </a>
          </li>
          <li>
            <a href="../email/email_list.html">
              <span>수신 메일</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-star-fill"></i>
          <span>중요 메일함</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-envelope-exclamation"></i>
          <span>임시저장함</span>
        </a>
      </li><!-- End Contact Page Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="../email/email_list.html">
          <i class="bi bi-trash3-fill"></i>
          <span>휴지통</span>
        </a>
      </li><!-- End Contact Page Nav -->

    </ul>

  </aside><!-- End Sidebar -->

  <main id="main" class="main ">
	  <div class="pagetitle">
	      <h1>받은메일함</h1>
	      <nav>
	        <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="index.html">받은메일함</a></li>
	        </ol>
	      </nav>
	    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
        

          <div class="card">
            <div class="card-body">
              <div class="card-title d-flex" >
	               <div class="input-group me-auto p-2" style="width:350px">
		             <span class="input-group-text" id="basic-addon1">
		              	<i class="bi bi-search"></i>
		             </span>
	               	<input type="text" class="form-control" placeholder="제목이나 이름으로 검색" aria-label="검색" aria-describedby="basic-addon1">
	               	<button type="submit" class="btn btn-secondary btn-sm ">검색</button>
	              </div>
	            
	              <div class=" my-auto" style="text-align:right">
	              		<!-- 휴지통에서 조회한 경우 -->
	              		<button type="submit" class="btn btn-secondary btn-sm ">복구</button>
	              		<!-- 중요메일일 때 modal로 삭제 여부 확인 -->
	                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#importantDeleteModal">삭제</button>
	                    <!-- 휴지통으로 들어갔다는 모달창 띄움 -->
	                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#trashModal">삭제</button>
	                    <!-- 휴지통에서는 영구삭제가 가능함 -->
	                    <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">영구삭제</button>
	              </div>
              </div>

              <!-- Table with hoverable rows -->
              <table class="table table-hover">
                <thead>
                  <tr>
                  	<th scope="col" ><input class="form-check-input" type="checkbox"></input></th>
                    <th scope="col">이름</th>
                    <th scope="col">제목</th>
                    <th scope="col">날짜</th>
                  </tr>
                </thead>
                <tbody>
                  <tr onClick="location.href='receive_email_detail.html'">
                  	<td><input type="checkbox"></td>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    <td>2016-05-25</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Bridie Kessler</td>
                    <td>Developer</td>
                    <td>2014-12-05</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Ashleigh Langosh</td>
                    <td>Finance</td>
                    <td>2011-08-12</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Angus Grady</td>
                    <td>HR</td>
                    <td>2012-06-11</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                 	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
                  </tr>
                  <tr>
                  	<td><input class="form-check-input" type="checkbox"></td>
                    <td>Raheem Lehner</td>
                    <td>Dynamic Division Officer</td>
                    <td>2011-04-19</td>
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
    
    <!-- 중요메일 삭제시 Modal -->
	<div class="modal fade" id="importantDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 중요메일
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">중요메일입니다.</p>
	        <p> 삭제하시겠습니까? </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 메일 그냥 삭제시 Modal -->
	<div class="modal fade" id="trashModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header"> 휴지통
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p style="margin-bottom:4px">삭제한 메일은 10일동안 휴지통에 보관됩니다.</p>
	        <p>10일 이후에는 자동으로 영구삭제되며, 복구할 수 없습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
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
	        <button type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	    

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>