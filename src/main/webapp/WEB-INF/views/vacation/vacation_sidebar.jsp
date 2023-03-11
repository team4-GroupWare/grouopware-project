<%@ page contentType="text/html; charset=UTF-8"%>
<!-- =========================sideber=============================== -->
<aside id="sidebar" class="sidebar">
	
	<!--=============================== 문서 신청 버튼 ===============================-->
	<div class="row">
		<!--휴가 신청 -->
		<div class="col p-1">
			<button class="btn btn-primary" type="button" style="width: 100%; height: 50px"
					onclick="location.href='${pageContext.request.contextPath}/vacation/write'">
				<i class="bi bi-pencil-square"></i> 휴가신청
			</button>
		</div>
		<!--근무 신청 -->
		<div class="col p-1">
			<button class="btn btn-success" type="button" style="width: 100%; height: 50px"
					onclick="location.href='${pageContext.request.contextPath}/attendance/write'">
				<i class="bi bi-pencil-square"></i> 근무신청
			</button>
		</div>
	</div>

	<!--=============================== 메뉴 리스트 ===============================-->
	<ul class="sidebar-nav mt-2" id="sidebar-nav">
		<!--근무 현황 -->
		<li class="nav-item"
			onclick="location.href='${pageContext.request.contextPath}/attendance/status'">
			<a class="nav-link collapsed" href="#"> <i class="bi bi-eye"></i>
				<span>근무 현황</span>
			</a>
		</li>
		<!--나의 근무 -->
		<li class="nav-item"
			onclick="location.href='${pageContext.request.contextPath}/attendance/my/list'">
			<a class="nav-link collapsed" href="#"> <i class="bi bi-eye"></i>
				<span>나의 근무</span>
			</a>
		<!--나의 휴가 -->
		<li class="nav-item"
			onclick="location.href='${pageContext.request.contextPath}/vacation/list/1'">
			<a class="nav-link collapsed" data-bs-target="#document2-nav"
			data-bs-toggle="collapse" href="#"> <i class="bi bi-eye"></i> <span>나의
					휴가</span>
			</a>
		</li>
		<!--결재 문사힘 -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#mydocument-nav" data-bs-toggle="collapse"
			href="${pageContext.request.contextPath}/approval/list"> <i
				class="bi bi-file-text"></i><span>결재 문서함</span><i
				class="bi bi-chevron-down ms-auto"></i>
			</a>
			<ul id="mydocument-nav" class="nav-content collapse"
				data-bs-parent="#sidebar-nav">
				<li><a href='${pageContext.request.contextPath}/attendance/document/list'><span>근무 문서</span></a></li>
				<li><a href='${pageContext.request.contextPath}/vacation/list/2'><span>휴가 문서</span></a></li>
			</ul>
		</li>
	</ul>
</aside>
<!-- ======================================End Sidebar ============================================ -->
