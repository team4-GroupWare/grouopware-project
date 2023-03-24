<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="https://cdn.tiny.cloud/1/smqgcpcmka5xnxwldh4kb6l5hf8upaeo1svd0dgxd7oi52gy/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
	<script>
		$(function(){
			var content= $('#content').val();
			
		    tinymce.init({
		    	language: "ko_KR",
		        // Select the element(s) to add TinyMCE to using any valid CSS selector
		        selector: "#myTextarea",
		        entity_encoding : "UTF-8",
		        setup: function (editor) {
		       		editor.on('init', function (e) {
		            	editor.setContent(content);
		            });
		        },
		        plugins: "preview searchreplace autolink autosave save directionality visualblocks visualchars fullscreen image link media template codesample table charmap pagebreak nonbreaking anchor advlist lists wordcount help emoticons",
		        height: '900px',
		        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
		        autosave_restore_when_empty: true,
		        content_style: `
		            body {
		                background: #fff;
		            }
		
		            @media (min-width: 840px) {
		                html {
		                    background: #eceef4;
		                    min-height: 100%;
		                    padding: 0 .5rem
		                }
		
		                body {
		                    background-color: #fff;
		                    box-shadow: 0 0 4px rgba(0, 0, 0, .15);
		                    box-sizing: border-box;
		                    margin: 1rem auto 0;
		                    max-width: 820px;
		                    min-height: calc(100vh - 1rem);
		                    padding:4rem 6rem 6rem 6rem
		                }
		            }
		        `,
		    });
	
		    //임시저장
		    $("#temp_save").on("click", function(){
				var content = tinymce.activeEditor.getContent();
		        
				if(!$("#title").val()) {
					$("#title").attr("value", "(제목없음)");
				}
				console.log(document.getElementById("refEmpId").value);
				
				console.log("refEmpId : " );
				/* if(!$("#refEmpId").val()) {
					$("#refEmpId").attr("value", null);
				} */
					
		        $("#content").val(content);
		        $("#tempApproval").val("y");
		        //$("form").attr("action", "${pageContext.request.contextPath}/approval/updateTemp");
		        
		        //$("#approval_form").submit();
		        var path = sessionStorage.getItem("contextpath");
		        var formData = $("#approval_form").serialize();
		        
		    	$.ajax({
		    	    method: 'POST',
		    	    url: path+'/approval/updateTemp',
		    	    data: formData,
		    	    success: function(data) {
		    	    	location.replace(path+"/approval/templist");
		    	    },
		    	    error: function(request, statust, error) {
		    	    	//alert(err);
	    	    	 	console.log("code: " + request.status);
	    	         	console.log("message: " + request.responseText);
	    	         	console.log("error: " + error);
		    	        return;
		    	    }
		    	})
		    });
		    
		    //전자결재 제출
		    $("#approval").on("click", function(){
		        var content = tinymce.activeEditor.getContent();
		        
		        var approval_line = $('.approvalLines').val();
		        var title = $('#title').val();
		        
		        if( approval_line == undefined || title == "" ){
		        	$('#inputModal').modal('show');
		        	return;
		        }
		        
		        $("#content").val(content);
		        $("#tempApproval").val("n");
		      	//폼데이터 담기
		    	var form = document.querySelector("#approval_form");
		    	var formData = new FormData(form);
		    	for (var i = 0; i < filesArr.length; i++) {
		    	    // 삭제되지 않은 파일만 폼데이터에 담기
		    	    if (!filesArr[i].is_delete) {
		    	        formData.append("attachFiles", filesArr[i]);
		    	    }
		    	}

		    	var path = sessionStorage.getItem("contextpath");

		    	$.ajax({
		    	    method: 'POST',
		    	    url: path+'/approval/updateTemp',
		    	    dataType: 'json',
		    	    data: formData,
		    	    contentType: false,			
		    	    processData: false,
		    		cache: false,
		    	    success: function(data) {
		    	    	location.replace(path+"/approval/mylist");
		    	    },
		    	    error: function (xhr, desc, err) {
		    	        console.log('에러');
		    	        console.log('error:' + err);
		    	        $('#inputModal').modal('show');
		    	        return;
		    	    }
		    	})
		        
		    });
		    
		});
		
		function getForm() {
			//선택된 카테고리 전자결재 양식 가져오기
			var value = $("#approvalCategoryId > option:selected").val();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/approval/categoryform",
				method: "get",
				data: {"approvalCategoryId": value}
			}).done(function(data) {
				tinymce.activeEditor.setContent(data);
			});
			
		}
	</script>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

  	<!-- ======= Sidebar ======= -->
  	<%@ include file="/WEB-INF/views/approval/approval_sidebar.jsp" %>
	<!-- ======= End Sidebar ======= -->

  	<main id="main" class="main">
    	<div class="pagetitle">
      		<h1>결재 작성</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="#">전자결재</a></li>
          			<li class="breadcrumb-item">결재 작성</li>
        		</ol>
      		</nav>
    	</div>
	
    	<section class="section">
      		<div class="row">
        		<div class="col-lg-11">
          			<div class="card">
            			<div class="card-body m-4">
             				<!-- General Form Elements -->
             				<div class="row mb-3">
               					<div class="col-sm-12 d-flex justify-content-end">
               						<button id="temp_save" class="btn btn-secondary" style="margin-right: 8px">임시저장</button>
                 					<button id="approval" class="btn btn-primary">결재 제출</button>
               					</div>
               				</div>
               				<input type="hidden" id="category_form" name="category_form" value='${form}'>
               				
              				<form method="post" id="approval_form" action="${pageContext.request.contextPath}/approval/updateTemp" enctype="multipart/form-data">
              					<input type="hidden" id="empId" name="empId" value="${loginEmployee.empId}">
              					<input type="hidden" id="tempApproval" name="tempApproval" value="">
              					<input type="hidden" id="approvalId" name="approvalId" value="${approval.approvalId}">
                				<div class="row mb-3">
                  					<label class="col-sm-2 col-form-label"><b>결재 양식</b></label>
                  					<div class="col-sm-4">
                    					<select class="form-select" aria-label="Default select example" id="approvalCategoryId"  name="approvalCategoryId" onchange="getForm()">
                    						<c:forEach var="category" items="${approval_category}">
                    							<c:if test="${category.approvalCategoryId == approval.approvalCategoryId}">
                    								<option value='${category.approvalCategoryId}' selected>${category.approvalName}</option>
                    							</c:if>
                    							<option value='${category.approvalCategoryId}'>${category.approvalName}</option>
                    						</c:forEach>
                    					</select>
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>제목</b></label>
                 					<div class="col-sm-10">
                    					<input id="title" name="title" type="text" class="form-control" value="${approval.title}">
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>참조</b></label>
	                  				<div class="col-sm-10 d-flex">
	                  					<c:if test="${refEmp != null}">
	                  						<input id="reference" type="text" style="width:260px;" class="form-control" value="[경영지원실]${manager.empId}  ${manager.name} (${manager.gradeName})" readonly>
	                  						<input id="refEmpId" type="hidden" name="refEmpId" style="width:260px;" class="form-control" value="${manager.empId}">
	                  						<input class="checkBoxId form-check-input my-auto" type="checkbox" style="margin-left: 10px;" checked>
	                  					</c:if>
	                  					<c:if test="${refEmp == null}">
	                  						<input id="reference" type="text" style="width:260px;" class="form-control" value="" disabled>
	                  						<input class="checkBoxId form-check-input my-auto" type="checkbox" style="margin-left: 10px;">
	                  					</c:if>
	                  				</div>
	                  				<script>
	                  				$(document).ready(function(){
	                  				    $(".checkBoxId").change(function() {
	                  				        if($(".checkBoxId").is(":checked")){
	                  				          	$('#reference').attr("disabled", false); 
	                  				        	$('#refEmpId').attr("disabled", false); 
	                  				        	$('#reference').attr("value", "[경영지원실] ${manager.name} (${manager.gradeName})");
	                  				        	$('#refEmpId').attr("value", "${manager.empId}"); 
	                  				        } else {
	                  				          	$('#reference').attr("value", ""); 
	                  				          	$('#reference').attr("disabled", true); 
	                  				          	$('#refEmpId').attr("disabled", true);
	                  				            $('#refEmpId').attr("value", null); 
	                  				        }
	                  				    });
	                  				});
	                  				</script>
                				</div>
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>결재선</b></label>
                  					<div class="col-sm-10">
                  						<div class="row mb-3">
                  							<div class="col-sm-10">
                    							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                    								결재선 선택
              									</button>
              								</div>
              							</div>
              		
	              						<div class="row">
	              							<div id="approval_line" class="d-flex">
	              								<c:forEach var="approvalLine" items="${approvalLines}" varStatus="status">
		              								<div style="background-color:#EDEEF0; width:250px; padding:15px">
		              									<input type="hidden" class="approvalLines" name="approvalLine[${status.index}].empId" value="${approvalLine.empId}">
		              									<span style="font-size:18px; font-weight:bold;">${approvalLine.empName}</span>
		              									${approvalLine.gradeName}<br>
														${approvalLine.deptName} / ${approvalLine.teamName}
													</div>
													<c:if test="${status.count != fn:length(approvalLines)}">
														<div style="text-align: center; margin: auto 10px;"><i class="bi bi-caret-right-fill" style="font-size:25px;"></i></div>
													</c:if> 
	              								</c:forEach>
	              							</div>
	                  					</div>
                					</div>
                				</div>
                				<div class="row mb-3">
                  					<div class="insert">
                  						<label class="btn btn-primary btn-sm mb-2" for="input-file">
  											파일 첨부
				  						</label>
		        						<input id="input-file" type="file" name="files" onchange="addFile(this);" style="display:none" multiple />
			        					<div class="file-list"></div>
									</div>
                				</div>
                				<div class="row mb-3">
                  					<div class="col-sm-12">
                  						<input type="hidden" id="content" name="content" value='${approval.content}'>
                  						<textarea id="myTextarea">
										</textarea>
        							</div>
        						</div>
        						<%@ include file="/WEB-INF/views/approval/approvalform_modal.jsp" %>
    						</form>
    					</div>
    				</div>
    				<!-- 모달 -->
    				<div class="modal fade" id="inputModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog">
					    	<div class="modal-content">
					      		<div class="modal-header"><b>전자결재 작성</b>
					        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      		</div>
					      		<div class="modal-body">
					        		<p style="margin-bottom:4px"><i class="bi bi-exclamation-triangle" style="margin-right:10px; color:red;"></i>제목과 결재선은 필수항목입니다.</p>
					        		<p>필수항목을 입력해주세요.</p>
					      		</div>
					      		<div class="modal-footer">
					        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
					      		</div>
					    	</div>
					  	</div>
					</div>
    			</div>
    		</div>
    	</section><!-- End section -->
  	</main><!-- End #main -->

  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>