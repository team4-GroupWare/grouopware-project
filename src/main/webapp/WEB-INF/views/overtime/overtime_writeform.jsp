<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
	<style>
	.card-header {
		background-color: #d5e0fd;
		color: black;
	}
	</style>
</head>
	<script>
		$(document).ready(function(){                                                     
		var date = new Date();
		var start;
		var end;
		var sunday = new Date().setDate(date.getDate()-date.getDay());
		var saturday = new Date().setDate(date.getDate()-date.getDay()+6);
        date.setTime(sunday);
        start = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
        date.setTime(saturday);
        end = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
		document.getElementById("workDate").setAttribute("min", start);
		document.getElementById("workDate").setAttribute("max", end);
		
    	});
		function submitButton(){
			var workDate = $('#workDate').val();
       		if( workDate == ""){
	       		$('#workDateModal').modal('show');
	       		return "";
			}
       		var workTime = $('#workTime').val();
       		var timeRemain = ${12-weekOverTime};
       		if( workTime == ""){
	       		$('#workTimeModal').modal('show');
	       		return "";
			}
       		if( workTime > timeRemain){
          		$('#workTime2Modal').modal('show');
          		return "";
   			}
			var approval_line = $('.approvalEmpId').val();
       		if( approval_line == undefined){
	       		$('#approvalModal').modal('show');
	       		return "";
			}
       		var content = $('#content').val();
       		if( content == ""){
	       		$('#contentModal').modal('show');
	       		return "";
			}
       		var path = sessionStorage.getItem("contextpath");
       		var formData = $("#overtime_form").serialize();
       		console.log(formData);
       		$.ajax({
	    	    method: 'POST',
	    	    url: path+'/overtime/write',
	    	    data: formData,
	    	    success: function(data) {
	    	    	const data1 = $.trim(data);
	    	    	if(data1 == 'success'){
	    	    		location.replace(path+"/overtime/list/1");
	    	    	}else{
	    	    		alert(data);
	    	    	}
	    	    },
	    	    error: function(err) {
	    	    	alert("??????");
	    	    }
	    	})
		}
</script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/vacation/vacation_sidebar.jsp"%>
	<!-- ======================================Main==================================================== -->
	<main id="main" class="main"> <!-- PageContent -->
	<section class="section">
		<div class="row mt-5">
			<div class="col-lg-8">
				<div class="card profile mt-3">
					<div class="card-header">???????????? ?????????</div>
						<div class="card-body m-4">
							<form class="profile-overview" method="post" id="overtime_form" action="${pageContext.request.contextPath}/overtime/write">
								<div class="row">
									<div class="col">
										<div class="row mb-4">
											<input type="hidden" id="empId" name="empId" value="${loginEmployee.empId}">
											<div class="col-lg-3 col-md-4 label ">??????</div>
											<div class="col-lg-9 col-md-8">${loginEmployee.name}</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label">??????</div>
											<div class="col-lg-9 col-md-8">${loginEmployee.gradeName}</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label">??????</div>
											<div class="col-lg-9 col-md-8">${loginEmployee.deptName}</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label">???</div>
											<div class="col-lg-9 col-md-8">${loginEmployee.teamName}</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label">????????????</div>
											<div class="col-sm-6">
												<input id="workDate" name="workDate" type="date" class="form-control" required>
											</div>
										</div>
										<div class="row mb-4">
											<div class="col-lg-3 col-md-4 label">?????? ??????</div>
											<div class="col-sm-3">
												<input id="workTime" name="workTime" type="number" step="1" min="1" max="6" class="form-control" required>
											</div>
											<div class="col-2">??????</div>
										</div>
										<div class="row mb-4">
											<div class="col-sm-12 d-flex justify-content-start">
												<button type=button class="btn btn-primary" form="overtime_form" onclick="submitButton()" >????????????</button>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="row mb-4">
											<label class="col-lg-3 col-md-4 label">????????? ??????</label>
											<div class="col-sm-6">
												<button type="button" class="btn btn-sm btn-secondary"data-bs-toggle="modal" data-bs-target="#verticalycentered">??????</button>
											</div>
										</div>
										<div class="row mb-4">
											<div class="col-10">
												<div id="vacation_line" class="d-flex"></div>
											</div>
										</div>
										<!-- ?????? -->
										<div class="row mb-3">
											<label class="col-sm-4 col-form-label">????????????</label>
											<div class="col-sm-9">
												<input id="content" name="content" class="form-control" style="height: 100px" required></input>
											</div>
										</div>
									</div>
								</div>
								<%@ include file="/WEB-INF/views/vacation/form_modal.jsp"%>
							</form>
						</div>
					</div>
				</div>
				<!-- right -->
				<div class="col-3">
					<div class="card profile mt-3">
						<div class="card-header">?????? ????????????</div>
						<div class="card-body pt-3 m-0">
							<div class="tab-pane fade show active profile-overview" id="profile-overview">
								<div class="row">
									<div class="col-7 label">??? ?????? ?????? ?????? ??????</div>
									<div class="col-5">12??????</div>
								</div>
								<div class="row">
									<div class="col-7 label">??? ?????? ?????? ??????</div>
									<div class="col-5">${weekOverTime}??????</div>
								</div>
								<div class="row">
									<div class="col-7 label ">??? ?????? ?????? ?????? ??????</div>
									<div class="col-5">${12-weekOverTime}??????</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="row" style="height:100px"> </div>
	</section>
	<!-- ????????? ?????? ?????? -->
	<div class="modal fade" id="approvalModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="bi bi-exclamation-circle-fill" style="color: tomato; font-size: 25px; margin-right: 8px"></i>
					?????? ??????
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p style="margin-bottom: 4px">???????????? ???????????? ???????????????.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ???????????? ?????? ?????? -->
	<div class="modal fade" id="contentModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="bi bi-exclamation-circle-fill" style="color: tomato; font-size: 25px; margin-right: 8px"></i>
					?????? ??????
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p style="margin-bottom: 4px">?????? ????????? ????????? ?????????.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ?????? ?????? ?????? -->
	<div class="modal fade" id="workDateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="bi bi-exclamation-circle-fill" style="color: tomato; font-size: 25px; margin-right: 8px"></i>
					?????? ??????
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p style="margin-bottom: 4px">??????????????? ??????????????????.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ?????? ?????? ?????? ?????? -->
	<div class="modal fade" id="workTimeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="bi bi-exclamation-circle-fill" style="color: tomato; font-size: 25px; margin-right: 8px"></i>
					?????? ??????
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p style="margin-bottom: 4px">???????????? ????????? ??????????????????.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ?????? ?????? ?????? ?????? -->
	<div class="modal fade" id="workTime2Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<i class="bi bi-exclamation-circle-fill" style="color: tomato; font-size: 25px; margin-right: 8px"></i>
					?????? ??????
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p style="margin-bottom: 4px">???????????? ????????? ?????????????????????. </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- ======================================Main==================================================== -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>