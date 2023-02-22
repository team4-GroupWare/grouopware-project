<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<!--  -->
	<style type="text/css">
		/* IE */
	select {
    -ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
	}
	select::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	</style>
	<script type="text/javascript">
	function ListSubmit(form) {
		if (confirm("카테고리의 배열순서를 변경하시겠습니까?")) {
			gnum = form.category_list.options.length;
			value_arr = "";

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
		} else {

		}
	}

	// 상,하 이동
	function moveCategory(type, form) {
		var movewidth = 1;
		var thisform = eval(form);
		var sel = thisform.category_list.selectedIndex;
		var targetpos = sel - movewidth;

		if (type == "U") {
			if (sel > 0) {
				if (targetpos < 0)
					targetpos = 0;
				curvalue = thisform.category_list.options[sel].value;
				curtext = thisform.category_list.options[sel].text;

				for (i = sel - 1; i >= targetpos; i--) {
					thisform.category_list.options[i + 1].text = thisform.category_list.options[i].text;
				}
				thisform.category_list.options[targetpos].text = curtext;
				thisform.category_list.options[targetpos].selected = true;
			}
		} else if (type == "D") {
			if (sel == -1) {
				alert("이동할 항목을 선택하세요");
				thisform.category_list.focus();
				return;
			} else {
				lastpos = thisform.category_list.options.length - 1;
				if (sel >= lastpos || sel < 0)
					return;
				targetpos = sel + movewidth;
				if (targetpos > lastpos)
					targetpos = lastpos;
				curvalue = thisform.category_list.options[sel].value;
				curtext = thisform.category_list.options[sel].text;

				for (i = sel + 1; i <= targetpos; i++) {
					thisform.category_list.options[i - 1].text = thisform.category_list.options[i].text;
				}

				thisform.category_list.options[targetpos].text = curtext;
				thisform.category_list.options[targetpos].selected = true;

			}
		}
	}
	function btnInsert(){
		let value1 = document.querySelector('input[name="employee"]:checked').value;
		let selectEl = document.querySelector("#selectEl");
	    var objOption = document.createElement("option");
	    objOption.text = value1;
	    objOption.value = selectEl.length+1;
	    objOption.id='empid'+objOption.value;
	    console.log(objOption.id);
	    var type = 'false';
	    var home_page_count = document.getElementById('selectEl').length;
	    for (i = 0; i < home_page_count; i++) {
			console.log(selectEl.options[i].id)
			if(objOption.id == selectEl.options[i].id){
				type = 'true';
				break;
			}
			
		}
	    console.log(type)
	    if(type == 'false' ){
	    	selectEl.options.add(objOption);
	    }
	   
	}
	function btnDelete(form){
		var thisform = eval(form);
		var sel = thisform.category_list.selectedIndex;
		var movewidth=thisform.category_list.options.length - thisform.category_list.options[sel].value+1 ;
		console.log(movewidth);
		var targetpos = sel - movewidth;
		
		if (sel == -1) {
			alert("이동할 항목을 선택하세요");
			thisform.category_list.focus();
			return;
		} else {
			lastpos = thisform.category_list.options.length - 1;
			if (sel >= lastpos || sel < 0)
				return;
			targetpos = sel + movewidth;
			if (targetpos > lastpos)
				targetpos = lastpos;
			curvalue = thisform.category_list.options[sel].value;
			curtext = thisform.category_list.options[sel].text;

			for (i = sel + 1; i <= targetpos; i++) {
				thisform.category_list.options[i - 1].text = thisform.category_list.options[i].text;
			}

			thisform.category_list.options[targetpos].text = curtext;
			thisform.category_list.options.length = thisform.category_list.options.length-1;
		}
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
											
											<script>
												function showModal(){
													console.log('들어옴');
													$.ajax({
														url: "${pageContext.request.contextPath}/vacation/list",
														success: function(data){
															console.log(data);
															$('#verticalycentered').modal('show');
														}
													});
												}
											</script>
											
											<!-- 결재선 선택 Button -->
											<div class="row mb-3">
												<div class="col-sm-10">
													<button type="button" onclick="showModal()" class="btn btn-primary">
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
															<button type="button" class="btn btn-light" OnClick="moveCategory('U',this.form)">↑</button>
														</div>
														<div class=col-1>
															<button  type="button" class="btn btn-light" OnClick="moveCategory('D',this.form)">↓</button>
														</div>
													</div>
													
													<!-- Content -->
													<div class="row m-0">
														
														<!-- 부서 선택 -->
														<div class="col-4 border m-0" style="min-height:300px">
															<div class="mt-3" id="box">
																<ul>
																	<li class="main1">
																	  공공사업1
																		<ul class="sub" style="display:none">
																		    <li>개발솔루션</li>
																		    <il>프론트엔드</il>
																		</ul>
																	</li>
																	<li class="main1">
																	  	공공사업2
																		<ul class="sub" style="display:none">
																		    <li>개발솔루션</li>
																		    <il>프론트엔드</il>
																		</ul>
																	</li>
																	<li class="main1">
																	  	전략본부
																		<ul class="sub" style="display:none">
																		    <li>개발솔루션</li>
																		    <il>프론트엔드</il>
																		</ul>
																	</li>
																	<li class="main1">
																	  	경영본부
																		<ul class="sub" style="display:none">
																			<li>인사팀</li>
																		</ul>
																	</li>
																</ul>
															</div>
															<script>
																$(".main1").click(function(){
																    if($(this).find(".sub").is(":visible")){
																        $(this).find(".sub").slideUp();
																    }
																    else{
																        $(this).find(".sub").slideDown();
																    }
																});
															</script>
														</div>
														
														<!-- 사원 -->
														<div class="col-4 border">
															<div class="mt-3" >
																<label  class="test_obj" style="width:100%">
																    <input type="radio" name="employee" value="이예승">
																    <span style="width:100%">이예승(사원)</span>
																</label>
															</div>
														 
														<div>
															<label class="test_obj" style="width:100%">
														    	<input type="radio" name="employee" value="이연희">
														    	<span style="width:100%">이연희(차장)</span>
															</label>
														</div>
														 
														<div>
															<label class="test_obj" style="width:100%">
															    <input type="radio" name="employee" value="이지호">
															    <span style="width:100%">이지호(과장)</span>
															</label>
														</div>
																													
														</div>
														
														<!-- 이동 Button -->
														<div class="col-1 ">
															<div>
																<button type="button" class="btn btn-light" onclick="btnInsert()">
																>
																</button >
															</div>
															
															<div>
																<button type="button" class="btn btn-light" onclick="btnDelete(this.form)">
																	<
																</button>
															</div>
														</div>
														
														<!-- 선택된 사원 -->
														<div class="col-3 border">
															<form id="seq"  name="categoryform" method="post" action="./test3.php">
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