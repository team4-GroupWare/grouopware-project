<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	
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
		input[name=employee]:checked{
			color :red;
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
			let empId = $("input:radio[name=employee]:checked").attr("value");
			let empName = $("span[id='"+empId+"']").text();
			
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
		
	</script>
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	  	<!-- =========================sideber=============================== -->
		<aside id="sidebar" class="sidebar">
			<ul class="sidebar-nav" id="sidebar-nav">
			 
				<!--휴가 작성 -->
				<li class="nav-item">
					<a class="btn btn-primary" type="button" href="#" style="width:100%">
					    <i class="bi bi-pencil-square"></i> 
					    <span>휴가 작성</span>
				  	</a>
				</li>
			
				<!--근무 현황 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>근무 현황</span>
				  	</a>
				</li>
			
				<!--휴가 문서 -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#">
				    	<i class="bi bi-eye"></i>
				    	<span>휴가 문서</span>
					</a>
				</li>
			
				<!--부서 근무 현황 -->
				<li class="nav-item">
					<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
				    	<i class="bi bi-clipboard2-check"></i><span>부서 근무 현황</span><i class="bi bi-chevron-down ms-auto"></i>
				  	</a>
					<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
						<li>
					    	<a href="#">
					      		<span>공공사업1</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>공공사업2</span>
					    	</a>
					  	</li>
					  	<li>
					    	<a href="#">
					      		<span>전략사업</span>
					    	</a>
					  	</li>
					  	<li>
				    		<a href="#">
					      		<span>경영관리</span>
					    	</a>
					  	</li>
					</ul>
				</li>
			
			</ul>
		</aside>
		<!-- ======================================End Sidebar ============================================ -->
	  	<!-- ======================================Main==================================================== -->
		<main id="main" class="main">
			<!-- PageTitle -->
			<div class="pagetitle">
			  <h1>휴가 신청</h1>
			  <nav>
			    <ol class="breadcrumb">
			      <li class="breadcrumb-item"><a href="#">근태관리</a></li>
			      <li class="breadcrumb-item">휴가 신청</li>
			    </ol>
			  </nav>
			</div>
			
			<!-- PageContent -->
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body m-4">
								
								<!-- Form -->
								<form>
									<!-- 제출하기 Button -->
									<div class="row mb-3">
										<div class="col-sm-12 d-flex justify-content-end">
											<button type="submit" class="btn btn-primary">제출하기</button>
										</div>
									</div>
									
									<!-- 휴가 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>휴가</b></label>
										<div class="col-sm-6">
											<script>
												$(function (){
													$('input[type=radio][name=tp_cd]').on('click', function() {
														var chkValue = $('input[type=radio][name=tp_cd]:checked').val();
														if (chkValue == '1') {
															$('#POP1').css('display', 'block');
															$('#POP2').css('display', 'none');
															$('#POP3').css('display', 'none');
														} else if(chkValue == '2') {
															$('#POP1').css('display', 'none');
															$('#POP2').css('display', 'block');
															$('#POP3').css('display', 'none');
														}
														else if(chkValue == '3') {
															$('#POP1').css('display', 'none');
															$('#POP2').css('display', 'none');
															$('#POP3').css('display', 'block');
														}
													});
												});
											</script>
											<input type="radio" name="tp_cd" value="1" checked="checked"> 정기휴가
											<input type="radio" name="tp_cd" value="2" > 경조사
											<input type="radio" name="tp_cd" value="3" > 공가
										</div>
									</div>
									
									<!-- 휴가 종류 -->
									<div class="row mb-3">
										<label class="col-sm-2 col-form-label"><b>휴가 종류</b></label>
									 
										<div id="POP1" class="col-sm-4">
											<select class="form-select" aria-label="Default select example">
												<option value="0">연차</option>
												<option value="1">오전 반차</option>
												<option value="2">오후 반차</option>
											</select>
										</div>
									  
										<div id="POP2" style="display: none;" class="col-sm-4">
											<select class="form-select" aria-label="Default select example">
												<option value="0">결혼</option>
												<option value="1">출산</option>
												<option value="2">사망</option>
											</select>
										</div>
									
										<div id="POP3" style="display: none;"  class="col-sm-4">
											<select class="form-select" aria-label="Default select example">
												<option value="0">병가</option>
												<option value="1">예비군</option>
											</select>
										</div>
									</div>
									
									<!-- 시작 날짜 -->
									<div class="row mb-3">
										<label for="inputDate" class="col-sm-2 col-form-label"><b>시작날짜</b></label>
										<div class="col-sm-10">
											<input type="date" class="form-control">
										</div>
									</div>
									
									<!-- 끝날짜 -->
									<div class="row mb-3">
										<label for="inputDate" class="col-sm-2 col-form-label"><b>끝날짜</b></label>
										<div class="col-sm-10">
											<input type="date" class="form-control">
										</div>
									</div>
									
									<!-- 사유 -->
									<div class="row mb-3">
										<label for="text" class="col-sm-2 col-form-label"><b>사유</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control">
										</div>
									</div>
									
									<!-- 첨부파일 -->
									<div class="row mb-3">
                						<label for="text" class="col-sm-2 col-form-label"><b>파일선택</b></label>	
											<div class="insert col-sm-10">
												<input id="input-file" type="file"  onchange="addFile(this);" style="display:none" multiple />
											    <label class="btn btn-secondary btn-sm mb-2 " for="input-file">파일선택</label>
											    <div class="file-list"></div>
											</div>
					                </div>
					                
									<!-- 결재선 -->
									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label"><b>결재선</b></label>
										<div class="col-sm-10">
											<!-- 결재선 선택 Button -->
											<div class="row mb-3">
												<div class="col-sm-10">
													<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                    								결재선 선택
              										</button>
												</div>
											</div>
											
											<!-- 결재선 선택란-->
											<div class="row">
												<div class="col-sm-3">
													<div class="card mb-3" style="background-color:#FCF6C2;">
													    <div class="row g-0">
															<div class="col-md-12">
																<div class="card-body">
																	<div class="row">
																  		<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
																  		<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
																  	</div>
																  <p>공공사업1 / 솔루션개발팀</p>
																</div>
															</div>
													    </div>
													</div>
												</div>
												<div class="col-sm-3">
													<div class="card mb-3" style="background-color:#FCF6C2;">
														<div class="row g-0">
															<div class="col-md-12">
																<div class="card-body">
																	<div class="row">
																		<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
																		<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
																	</div>
																	<p>공공사업1 / 솔루션개발팀</p>  
																</div>
															</div>
														</div>
													</div>
												</div>
											        
												<div class="col-sm-3">
													<div class="card mb-3" style="background-color:#FCF6C2;">
														<div class="row g-0">
															<div class="col-md-12">
																<div class="card-body">
																	<div class="row">
																		<div class="col-lg-10"><h5 class="card-title"><b>이연희</b> <span>차장</span></h5></div>
																		<div class="col-lg-2 mt-2"><i class="bi bi-x-square"></i></div>
																	</div>
																	<p>공공사업1 / 솔루션개발팀</p> 
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								    
								    <!-- 결재선 선택 modal -->
									<div class="modal fade" id="verticalycentered" tabindex="-1" aria-hidden="true" style="display: none;">
										<div class="modal-dialog modal-dialog-centered modal-lg" >
											<div class="modal-content" style="min-height:500px">
												
												<!-- Header -->
												<div class="modal-header">
													<h5 class="modal-title">결재선 설정</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												
												<!-- Body -->
												<div class="modal-body">
													
													<!-- search -->
													<div class="row mb-3">
														<div class="col-3" >
															<div class="input-group rounded">
																<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
																<span class="input-group-text border-0" id="search-addon">
															    	<button><i class="bi bi-search"></i></button>
															  	</span>
															</div>
														</div>
													</div>
													
													<!-- 순서 변경 버튼 -->
													<div class="row d-flex justify-content-end">
														<div class=col-1>
															<button type="button" class="btn btn-light" OnClick="moveCategory('U')">↑</button>
														</div>
														<div class=col-1>
															<button  type="button" class="btn btn-light" OnClick="moveCategory('D')">↓</button>
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
															              	<li class="team" id="${team.teamId}">
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
																				teamHtml += '<div>'+'<label  style="width:100%">'+'<input type="radio" name="employee" value="'
																							+data[i].empId+'">'+
																				    '<span id="'+data[i].empId+'" style="width:100%">'+data[i].name+'</span>'
																				   +'</label>'+'</div>';
																			}
																			$("#empByteam").html(teamHtml);
																		},
																		error: function() {
																			console.log("통신실패!");
																		}
																	});
																	
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
																>
																</button >
															</div>
															
															<div>
																<button type="button" class="btn btn-light" onclick="btnDelete()">
																	<
																</button>
															</div>
														</div>
														
														<!-- 선택된 사원 -->
														<div class="col-3 border">
															<form id="seq"  name="categoryform" method="post" action="./test3.php" >
																<select  id = "selectEl" name="category_list" size="10" style="width: 120px;">
																	
																</select> <input type="hidden" name="category_code" value=""><br>
															</form>
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
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main><!-- ======================================Main==================================================== -->
	  	
	  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>