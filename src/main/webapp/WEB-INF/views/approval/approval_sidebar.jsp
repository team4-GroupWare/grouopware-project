<%@ page contentType="text/html; charset=UTF-8" %>
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
     		<ul id="approval-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
       			<li>
         			<a href="${pageContext.request.contextPath}/approval/confirmlist"><span>전체</span></a>
       			</li>
       			<li>
         			<a href="${pageContext.request.contextPath}/approval/confirmlist?status=대기"><span>대기</span></a>
       			</li>
       			<li>
         			<a href="${pageContext.request.contextPath}/approval/confirmlist?status=진행"><span>진행</span></a>
       			</li>
       			<li>
         			<a href="${pageContext.request.contextPath}/approval/confirmlist?status=승인"><span>승인</span></a>
       			</li>
       			<li>
         			<a href="${pageContext.request.contextPath}/approval/confirmlist?status=반려"><span>반려</span></a>
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
     		<a class="nav-link collapsed" href="${pageContext.request.contextPath}/approval/reflist">
       			<i class="bi bi-tags"></i><span>참조 문서함</span>
     		</a>
   		</li><!-- End 참조 문서함 -->

   		<li class="nav-item">
     		<a class="nav-link collapsed" href="${pageContext.request.contextPath}/approval/templist">
       			<i class="bi bi-file-earmark"></i><span>임시저장함</span>
     		</a>
   		</li><!-- End 임시저장함 -->
 	</ul>
</aside><!-- End Sidebar -->

  	