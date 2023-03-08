<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="https://cdn.tiny.cloud/1/smqgcpcmka5xnxwldh4kb6l5hf8upaeo1svd0dgxd7oi52gy/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
	<script>
		$(function(){
			var form= $('#category_form').val();
			
		    tinymce.init({
		    	language: "ko_KR",
		        // Select the element(s) to add TinyMCE to using any valid CSS selector
		        selector: "#myTextarea",
		        entity_encoding : "UTF-8",
		        setup: function (editor) {
		       		editor.on('init', function (e) {
		            	editor.setContent(form);
		            });
		        },
		        plugins: "preview powerpaste casechange searchreplace autolink autosave save directionality advcode visualblocks visualchars fullscreen image link media mediaembed template codesample advtable table charmap pagebreak nonbreaking anchor advlist lists checklist wordcount tinymcespellchecker a11ychecker help formatpainter permanentpen pageembed linkchecker emoticons export",
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
		        
		        $("#content").val(content);
		        $("#tempApproval").val("y");
		        
		        console.log("content:" + $("#content").val());
		        console.log("tempApproval:" + $("#tempApproval").val());
		        console.log("empId:" + $("#empId").val());
		        console.log("title: " + $("#title").val());
		        console.log("approvalCategoryId:" + $("#approvalCategoryId").val());
		        
		        $("#approval_form").submit();
		    });
		    
		    //전자결재 제출
		    $("#approval").on("click", function(){
		        var content = tinymce.activeEditor.getContent();
		        
		        $("#content").val(content);
		        $("#tempApproval").val("n");
		        
		        console.log("content:" + $("#content").val());
		        console.log("tempApproval:" + $("#tempApproval").val());
		        console.log("empId:" + $("#empId").val());
		        console.log("title: " + $("#title").val());
		        console.log("approvalCategoryId:" + $("#approvalCategoryId").val());
		        
		        /* for (i = 0; i < length; i++) {
					var testMap = new Map();
					
					testMap.set("empId", selectEl.options[i].id);
					approvalLine[i] = selectEl.options[i].id;
				} */
		        
		        $("#approval_form").submit();
		        
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
	<style>
		body {
			margin: 4rem auto;
		    padding: 0 2rem;
		    background-color: #f9f9fb;
		}
		main {
		    width: 100%;
		}
	</style>
	
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
        		<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='대기'"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='진행'"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='승인'"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/list?status='반려'"><span>반려</span></a>
          			</li>
        		</ul>
     		</li><!-- End 결재 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="#myapproval-nav" data-bs-toggle="collapse" href="${pageContext.request.contextPath}/approval/list">
          			<i class="bi bi-file-text"></i><span>내 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="myapproval-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="${pageContext.request.contextPath}/approval/mylist?"><span>전체</span></a>
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
        		<a class="nav-link collapsed" href="#">
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
        		<div class="col-lg-9">
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
               				
              				<form method="post" id="approval_form" action="${pageContext.request.contextPath}/approval/write" enctype="multipart/form-data">
              					<input type="hidden" id="empId" name="empId" value="${loginEmployee.empId}">
              					<input type="hidden" id="tempApproval" name="tempApproval" value="">
                				<div class="row mb-3">
                  					<label class="col-sm-2 col-form-label"><b>결재 양식</b></label>
                  					<div class="col-sm-4">
                    					<select class="form-select" aria-label="Default select example" id="approvalCategoryId"  name="approvalCategoryId" onchange="getForm()">
                    						<c:forEach var="category" items="${approval_category}">
                    							<option value='${category.approvalCategoryId}'>${category.approvalName}</option>
                    						</c:forEach>
                    					</select>
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>제목</b></label>
                 					<div class="col-sm-10">
                    					<input id="title" name="title" type="text" class="form-control">
                  					</div>
                				</div>
                
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>참조</b></label>
                  				<div class="col-sm-10">
                    				<input type="text" class="form-control">
                  				</div>
                				</div>
                				<div class="row mb-3">
                  					<label for="inputText" class="col-sm-2 col-form-label"><b>열람</b></label>
                  					<div class="col-sm-10">
                    					<input type="text" class="form-control">
                  					</div>
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
	              							
	              							</div>
	                  					</div>
                					</div>
                				</div>
                				<div>
                					<label class="btn btn-primary btn-sm mb-2" for="input-file">
  										파일선택
				  					</label>
		        					<input id="input-file" type="file" name="files" onchange="addFile(this);" style="display:none" multiple />
			        				<div class="file-list"></div>
			        			</div>
                				<div class="row mb-3">
                  					<div class="col-sm-12">
                  						<input type="hidden" id="content" name="content" value="">
                  						<textarea id="myTextarea">
										</textarea>
        							</div>
        						</div>
        						<%@ include file="/WEB-INF/views/approval/approvalform_modal.jsp" %>
    						</form>
    					</div>
    				</div>
    			</div>
    		</div>
    	</section><!-- End section -->
  	</main><!-- End #main -->

  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>

</html>