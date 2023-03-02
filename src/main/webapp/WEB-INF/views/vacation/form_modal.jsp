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
	function ListSubmit(form) {
		var gnum = form.category_list.options.length;
		var value_arr = "";

		for (i = 0; i < gnum; i++) {
			if (i == 0) {
				value_arr = form.category_list.options[i].value;
			} else {
				value_arr = value_arr + ","
						+ form.category_list.options[i].value;
			}
		}

		form.category_code.value = value_arr;
		form.submit();

	}
	
	function moveCategory(type) {
		//select 박스 안
		let selectEl = document.querySelector("#selectEl");
		//선택된 option
		var target = document.querySelector('select[name="category_list"]');
		//선택된 option의 인덱스 번호
		var index = target.selectedIndex;
		
		//위로 가는 버튼일 경우에
		if (type == "U") {
			if (index > 0) {
				//값 변경
				selText = selectEl.options[index].text;
				selectEl.options[index].text = selectEl.options[index-1].text;
				selectEl.options[index-1].text = selText;
				
				//ID 변경
				selId = selectEl.options[index].id;
				selectEl.options[index].id = selectEl.options[index-1].id;
				selectEl.options[index-1].id = selId;
				
				selectEl.options[index-1].selected = true;
			}
		} else if (type == "D") {
			if (index < selectEl.length-1) {
				selText = selectEl.options[index].text;
				selectEl.options[index].text = selectEl.options[index+1].text;
				selectEl.options[index+1].text = selText;
				
				selId = selectEl.options[index].id;
				selectEl.options[index].id = selectEl.options[index+1].id;
				selectEl.options[index+1].id = selId;
				
				
				selectEl.options[index+1].selected = true;
			}
			
		}
	}
	//선택된 사원 insert
	function btnInsert(){
		let empId = $("input[type=radio]:checked").attr("value");
		console.log(empId);
		let empName = $("label[id='"+empId+"']").text();
		
		let selectEl = document.querySelector("#selectEl");
	    var objOption = document.createElement("option");
	    
	    //사원 이름
	    objOption.text = empName;
	    //순서
	    objOption.value = selectEl.length+1;
	    //사원 ID
	    objOption.id = empId;
	    
	    var type = 'false';
	    var length = document.getElementById('selectEl').length;
	   	//이미 있는 사원인지 검사
	    for (i = 0; i < length; i++) {
			if(objOption.id == selectEl.options[i].id){
				type = 'true';
				break;
			}
		}
	   	//중복되지 않는 사원이면 넣어줌
	    if(type == 'false' ){
	    	selectEl.options.add(objOption);
	    }
	   	
	    selectEl.options[selectEl.options.length-1].selected = true;
	}
	
	//선택된 사원 delete
	function btnDelete(){
		//select 박스 안
		let selectEl = document.querySelector("#selectEl");
		//선택된 option
		var target = document.querySelector('select[name="category_list"]');
		//선택된 option의 인덱스 번호
		var index = target.selectedIndex;
		
		if (index < selectEl.length-1) {
			var moveCount = selectEl.options.length - index-1 ;
			var selText = selectEl.options[index].text;
			var selId = selectEl.options[index].id;
			
			for(i =selectEl.options.length-moveCount; i<= selectEl.options.length-1; i++){
				
				selectEl.options[i - 1].id = selectEl.options[i].id;
				selectEl.options[i - 1].text = selectEl.options[i].text;
			}
			selectEl.options[selectEl.options.length-1].id = selId;
			selectEl.options[selectEl.options.length-1].text = selText;
			selectEl.options[selectEl.options.length-1].selected = true;
		}
		selectEl.options.length = selectEl.options.length-1;
		selectEl.options[selectEl.options.length-1].selected = true;
	}
	
	function changeColor() {
		
	}
	
</script>

<!-- 결재선 선택 modal -->
<div class="modal fade" id="verticalycentered" tabindex="-1" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-dialog-centered modal-lg" >
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
				<div class="row d-flex justify-content-end">
					<div class="col-9" >
						<form name="emp-search">
							<div class="input-group me-auto p-2" style="width:200px">
			               		<input name="keyword" type="text" class="form-control" placeholder="이름으로 검색" aria-label="이름으로 검색" aria-describedby="basic-addon1" value=""></input>
			               		<button class="input-group-text" id="basic-addon1" onclick="searchEmp()">
				              		<i class="bi bi-search"></i>
				             	</button>
			              	</div>
						</form>
					</div>
					<div class="col-3">
						<div class="d-flex justify-content-end mt-2" style="vertical-align:bottom">
							<button type="button" class="btn btn-light updown" OnClick="moveCategory('U')"><i class="bi bi-caret-up-fill"></i></button>
							<button  type="button" class="btn btn-light updown" OnClick="moveCategory('D')"><i class="bi bi-caret-down-fill"></i></button>
						</div>
					</div>
				</div>
				
				<!-- Content -->
				<div class="row m-0">
					
					<!-- 부서 선택 -->
					<div class="col-4 border m-0" style="min-height:300px">
						<div class="mt-3" id="box">
							<c:forEach var="dept" items="${departments}" varStatus="status">
			          			<li class="nav-item">
				            		<a class="nav-link collapsed" data-bs-target="#nav-dept${status.count}" data-bs-toggle="collapse" href="#" aria-expanded="false">
				              			<span>${dept.deptName}</span>
				            		</a>
					            	<ul id="nav-dept${status.count}" class="nav-content collapse m-0" data-bs-parent="#sidebar-nav">
						              	<c:forEach var="team" items="${teams[status.index]}">
						              	<li style="" class="team" id="${team.teamId}" onclick="changeColor()">
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
											    +data[i].name+'</label>'+'</div>';
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
					<div id="empByteam" class="col-4 border">
						
					
					</div>
					
					<!-- 이동 Button -->
					<div class="col-1 ">
						<div>
							<button type="button" class="btn btn-light" onclick="btnInsert()">
								<i class="bi bi-caret-right-fill"></i>
							</button >
						</div>
						
						<div>
							<button type="button" class="btn btn-light" onclick="btnDelete()">
								<i class="bi bi-caret-left-fill"></i>
							</button>
						</div>
					</div>
					
					<!-- 선택된 사원 -->
					<div class="col-3 border">
						<select  id = "selectEl" name="category_list" size="10" style="width: 120px;">
							
						</select> <input type="hidden" name="category_code" value=""><br>
					</div>
				
				</div><!-- End Content -->
			</div><!-- End Body -->
			
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				<button  class="btn btn-primary" form="seq"  onclick="ListSubmit(this.form)">확인</button>
			</div>
		</div>
	</div>
</div>
								