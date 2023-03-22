<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- option scroll 제거 -->
<style>
select {
   -ms-overflow-style: none; /* IE and Edge */
   scrollbar-width: none; /* Firefox */
}
select::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}
.nav-item {
	list-style: none;
} 
.team {
	list-style: none;
} 
input[name="employee"]{
	display:none; margin:10px;
}

input[type=radio]:checked+label{
    background-color: #CECECE;
}
.updonw {
	text-align: center;
}
.updonw {
	display :inline-block;
}
</style>
	
<!-- modal -->
<script>
	function listSubmit() {
		let empId = $("input[name=employee]:checked").attr("value");
		
		$.ajax({
			type: "post",
		    url: "${pageContext.request.contextPath}/vacation/employee",
		    data: {
		    	empId : empId
		    },
		    success: function (data) {
				var	lineHtml = '<div style="background-color:#EDEEF0; width:250px; padding:15px">' + 
							'<input type="hidden" class="approvalEmpId" name="approvalEmpId" value="' + data.empId + '">' +
							'<span style="font-size:18px; font-weight:bold;">' + data.empName + '</span> ' +
							data.gradeName + '<br>' +
							data.deptName + " / " + data.teamName + '</div>'
							
				$("#vacation_line").html(lineHtml);
				$("#verticalycentered").modal("hide"); 
			}
		});
	}
	
</script>

<!-- 결재선 선택 modal -->
<div class="modal fade" id="verticalycentered" tabindex="-1" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-dialog-centered modal-md" >
		<div class="modal-content" style="min-height:500px">
			
			<!-- Header -->
			<div class="modal-header" style="background-color:#004389; color:#ffffff;">
				<h5 class="modal-title">결재선 설정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<!-- Body -->
			<div class="modal-body">
				
				<!-- search -->
				<!-- <div class="row mb-3">
					<div class="col-3" >
						<form name="emp-search">
							<div class="input-group me-auto p-2" style="width:200px">
			               		<input name="keyword" type="text" class="form-control" placeholder="이름으로 검색" aria-label="이름으로 검색" aria-describedby="basic-addon1" value=""></input>
			               		<button class="input-group-text" id="basic-addon1" onclick="searchEmp()">
				              		<i class="bi bi-search"></i>
				             	</button>
			              	</div>
						</form>
					</div>
				</div> -->
				
				<!-- 순서 변경 버튼 -->
				<div class="row d-flex justify-content-start mb-2">
					<div class="col-12" >
					<img src="${pageContext.request.contextPath}/resources/assets/img/exaint_logo.png" width="40px" height="40px">
						<!-- <form name="emp-search">
							<div class="input-group me-auto p-2" style="width:200px">
			               		<input name="keyword" type="text" class="form-control" placeholder="이름으로 검색" aria-label="이름으로 검색" aria-describedby="basic-addon1" value=""></input>
			               		<button class="input-group-text" id="basic-addon1" onclick="searchEmp()">
				              		<i class="bi bi-search"></i>
				             	</button>
			              	</div>
						</form> -->
					</div>
				</div>
				
				<!-- Content -->
				<div class="row m-0">
					
					<!-- 부서 선택 -->
					<div class="col-6 border m-0" style="min-height:300px">
						<div class="mt-3" id="box">
							<c:forEach var="dept" items="${departments}" varStatus="status">
			          			<li class="nav-item">
				            		<a class="nav-link collapsed" data-bs-target="#nav-dept${status.count}" data-bs-toggle="collapse" href="#" aria-expanded="false">
				              			<span>${dept.deptName}</span>
				            		</a>
					            	<ul id="nav-dept${status.count}" class="nav-content collapse m-0" data-bs-parent="#sidebar-nav">
						              	<c:forEach var="team" items="${teams[status.index]}">
						              	<li style="" class="team" id="${team.teamId}">
						              		${team.teamName}
						              	</li>
						              	</c:forEach>
					            	</ul>
			          			</li>
			         		</c:forEach>
						</div>
						<script>
							$(".team").click(function(){
								var teamId = $(this).attr("id");
								console.log(teamId);
								
								$.ajax({
									type: "GET",
									url: "${pageContext.request.contextPath}/vacation/getemps/"+teamId,
									success: function(data) {
										var teamHtml = "";
										$("#empByteam").empty();
										for(var i in data){
											teamHtml += '<div class="empList">'+'<input id="' + data[i].empId +'" class="emp1" type="radio" name="employee" value="'
														+data[i].empId+'">'+'<label style="width:100%" id="'+ data[i].empId +'" for="' + data[i].empId + '">'
											    + data[i].name + ' (' + data[i].gradeName + ')</label>'+'</div>';
										}
										$("#empByteam").html(teamHtml);
									},
									error: function() {
										console.log("통신실패!");
									}
								});
								
							});
							$("input:radio[name=employee]").click(function(){
								/* var style = $(this).attr("name");
								,"width:100%;background-color:lightgray" 
								console.log(style); */
								
							});
							
						</script>
					</div>
					
					<!-- 사원 -->
					<div id="empByteam" class="col-6 border">
						
					
					</div>
					
					
				
				</div><!-- End Content -->
			</div><!-- End Body -->
			
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" onclick="listSubmit()">확인</button>
			</div>
		</div>
	</div>
</div>
								