<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/assets/js/file.js"></script>
	
	<script>
		//에디터
		$(function(){
		    tinymce.init({
		        // Select the element(s) to add TinyMCE to using any valid CSS selector
		        selector: "#tinymce-editor",
		      	menubar:false,
		        height: '900px',
		        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
		        autosave_restore_when_empty: true,
		    });
		});
		
		//본문 값 얻어내어 controller으로 submit
		function getContent(empId){
			var content = tinymce.get("tinymce-editor").getContent();
			$("#content").attr('value', content);
			var receivers = $("#receivers").val();
			if(receivers == ''){
				$('#inputName').modal('show');
			} else {
				var receiverArr = receivers.split(",");
				var count = 0;
				for(var i=0; i<receiverArr.length;i++){
					if(receiverArr[i].trim()==empId){
						count = 1;
					} 
				}
				
				if(count != 1){
					var title = $("#title").val();
					if(title == ''){
						$("#title").val('제목 없음');
					}
					submitEmailForm();
				} else {
					$("#notMe").modal('show');
				}
			}
		}
		
		//임시저장 수정하기
		function tempSave() {
			var content = tinymce.get("tinymce-editor").getContent();
			$("#content").attr('value', content);
			var receiveId = $("#receivers").val();
			var title = $("#title").val();
			if(title == ''){
				title = '제목 없음';
			}
			var contentId = $("#emailContentId").val();
			var tempId = $("#tempEmailId").val();
			var important = false;
         	if($("#important").is(':checked')){
            	important = true;
         	} 
         	if(title == '') {
            	title = '제목 없음';
        	}

			var data = {receiveId : receiveId, 
						title : title, 
						content : content,
						emailContentId : contentId,
						tempEmailId : tempId,
						important : important
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/email/tempupdate",
				method : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=UTF-8"
			}).done((data)=> {
				$("#tempModal").modal('show');	
			});
		}
	</script>
	
	
	
</head>
	<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
  
		  <!-- ======= Sidebar ======= -->
		  <aside id="sidebar" class="sidebar">
		
		    <ul class="sidebar-nav" id="sidebar-nav">
		
		      <li class="nav-item">
		        <a class="btn btn-primary" type="button" href="${pageContext.request.contextPath}/email/write" style="width:100%">
		          <i class="bi bi-pencil-square"></i> 
		          <span>메일 작성</span>
		        </a>
		      </li><!-- End Dashboard Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed"  href="${pageContext.request.contextPath}/email/receivelist">
		          <i class="bi bi-envelope-paper"></i><span>받은 메일함</span><i></i>
		        </a>
		      </li><!-- End Charts Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed " href="${pageContext.request.contextPath}/email/sendlist">
		          <i class="bi bi-envelope"></i><span>보낸 메일함</span>
		        </a>
		      </li><!-- End Icons Nav -->
		
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/email/templist">
		          <i class="bi bi-envelope-exclamation"></i>
		          <span>임시저장함</span>
		        </a>
		      </li><!-- End Contact Page Nav -->
		      
		      <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/email/trashlist">
		          <i class="bi bi-trash3-fill"></i>
		          <span>휴지통</span>
		        </a>
		      </li><!-- End Contact Page Nav -->
		
		    </ul>
		
		  </aside><!-- End Sidebar -->

		  <main id="main" class="main ">
			<section class="section">
		      <div class="row">
		        <div class="col-lg-12">
		
		          <div class="card"> 
		            <div class="card-body">
		             <div class="row">
		              <h2 class="card-title col-7"><b>메일 작성</b></h2>
		                  <div class="col-sm-5 my-auto" style="text-align:right">
		                    <button type="button" class="btn btn-secondary" onclick="tempSave()">임시저장</button>
		                    <button type="button" class="btn btn-primary" onclick="getContent('${loginEmployee.empId}')">보내기</button>
		                  </div>
		             </div>
		
		              <!-- 본문 -->
		              <form id="writeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/email/write">
		                <div class="row mb-2">
		                  <label for="inputText" class="col-sm-2 col-form-label">받는 사람</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="receiveId" id="receivers" value="${tempEmail.receiveId}">
		                    <p style="color:grey" class="small"> ","로 받을 아이디를 구분하여 입력해주세요
		                  </div>
		                </div>
		                
		                <div class="row mb-3">
		                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" name="title" id="title" value="${tempEmail.title}">
		                  </div>
		                </div>
		                
		                 <input type="hidden" id="tempEmailId" name="tempEmailId" value="${tempEmail.tempEmailId}">
		                
		                <input type="hidden" id="emailContentId" name="emailContentId" value="${tempEmail.emailContentId}">
		                
		                <fieldset class="row mb-3">
		                  <legend class="col-form-label col-sm-2 pt-0">중요 메일</legend>
		                  <div class="col-sm-10">
		                    <div class="form-check">
							  <c:if test="${tempEmail.important eq true}">
	                          	<input class="form-check-input" type="checkbox" name="important" id="important" checked>
	                          </c:if>
                            
	                          <c:if test="${tempEmail.important eq false}">
	                          	<input class="form-check-input" type="checkbox" name="important" id="important">
	                          </c:if>
		                      <label class="form-check-label" for="gridCheck1">
		                      	중요
		                      </label>
		                    </div>
		                  </div>
		                </fieldset>
		                
		                <div class="row mb-3">
		                  <div class="insert">
		                  <label class="btn btn-primary btn-sm mb-2" for="input-file">
		  						파일선택
						  </label>
				        	<input id="input-file" type="file" name="files" onchange="addFile(this);" style="display:none" multiple />
					        <div class="file-list"></div>
						</div>
		                </div>
		                
		                <div class="row mb-3">
		                  <div class="col-sm-12">
		                  	 <input type="hidden" id="content" name="content">
		                     <textarea id="tinymce-editor">
		                		${tempEmail.content}
		              		</textarea><!-- End TinyMCE Editor -->
		                  </div>
		                </div>
		              </form><!-- End General Form Elements -->
		
		            </div>
		          </div>
		        </div>
		      </div>
		    </section>
		    
		    <!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="tempModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 임시저장
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">임시저장 되었습니다.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="notMe" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 나에게 메일
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">나에게 메일을 작성할 수 없습니다.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
				<!-- 아이디가 존재하지 않음 -->
			<div class="modal fade" id="noID" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 수신인
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">해당하는 아이디가 존재하지 않습니다.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 메일 영구 삭제시 Modal -->
			<div class="modal fade" id="inputName" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header"><i class="bi bi-exclamation-circle-fill" style="color:tomato;font-size:25px;margin-right:8px"></i> 수신인
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <p style="margin-bottom:4px">받는 사람의 아이디를 입력해주세요.</p>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		  </main><!-- End #main -->
		  <script src="${pageContext.request.contextPath}/resources/assets/vendor/tinymce/tinymce.min.js"></script>
		  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
</html>