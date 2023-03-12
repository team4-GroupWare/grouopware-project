<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	<script src="https://cdn.tiny.cloud/1/smqgcpcmka5xnxwldh4kb6l5hf8upaeo1svd0dgxd7oi52gy/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
	<script>
		$(function(){
			var content= $('#approval_content').val();
		    tinymce.init({
		    	language: "ko_KR",
		        // Select the element(s) to add TinyMCE to using any valid CSS selector
		        selector: "#myTextarea",
		        menubar: false,
		        toolbar: false,
		        readinly: 1,
		        setup: function (editor) {
		       		editor.on('init', function (e) {
		            	editor.setContent(content);
		            });
		        },
		        height: '900px',
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
		    tinymce.activeEditor.mode.set("readonly");
		    
		    $("#delete").on("click", function(){
		    	console.log("delete!");
				$("form").attr("action", "${pageContext.request.contextPath}/approval/delete");
				$("#approval_form").submit();
		    });
		});
		
	</script>
	<script>
		
	</script>
	<style>
		.line th, td {
			text-align : center;
		  	vertical-align : middle;
		}
	</style>
 
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>

  	<!-- ======= Sidebar ======= -->
  	<%@ include file="/WEB-INF/views/approval/approval_sidebar.jsp" %>
	<!-- ======= End Sidebar ======= -->

	<!-- 내용 -->
  	<main id="main" class="main">
	    <div class="pagetitle">
	    	<h1>전자결재 내용</h1>
	    </div>
	
    	<section class="section">
      		<div class="row">
        		<div class="col-lg-10">
          			<div class="card">
            			<div class="card-body m-4">
              				<!-- General Form Elements -->
              				<input id="approval_content" type="hidden" value='${approval.content}'>
              				<form id="approval_form" method="post" action="${pageContext.request.contextPath}/approval/confirm">
              					<input type="hidden" id="approvalId" name="approvalId" value='${approval.approvalId}'>
              					<input type="hidden" id="approvalLineId" name="approvalLineId" value='${approvalLines[mySeq].approvalLineId}'>
              					<input type="hidden" id="lastSeq" name="lastSeq" value='${fn:length(approvalLines)}'>
              					<input type="hidden" id="approvalCategoryId" name="approvalCategoryId" value="${approval.approvalCategoryId}">
              					<input type="hidden" id="empId" name="empId" value="${approval.empId}">
			              		<div class="row mb-3">
			              			<c:if test="${myTurn == 1}">
				                  		<div class="col-sm-12 d-flex justify-content-end">
				                  			<button type="submit" class="btn btn-primary" name="isApproved" style="margin-right: 8px" value="y">승인</button>
				                    		<button type="submit" class="btn btn-danger" name="isApproved" value="n">반려</button>
				                  		</div>
			                  		</c:if>
			                  		<c:if test="${loginEmployee.empId == approval.empId && approval.status=='대기'}">
			                  			<div class="col-sm-12 d-flex justify-content-end">
			                  				<button type="button" class="btn btn-danger" id="delete" name="delete">삭제</button>
			                  			</div>
			                  		</c:if>
			                	</div>
                			</form>
               				<table id="vertical-1" class="table table-bordered" style="width:100%; border:black">
               					<tr>
					                <th style="background-color:#E9EFFE; width:10%">제목</th>
					                <td style="width: 40%" colspan="3">${approval.title}</td>
					            </tr>
					            <tr>
					                <th style="background-color:#E9EFFE; width:10%">결재 양식</th>
					                <td style="width: 40%">${approval.categoryName}</td>
					                <th style="background-color:#E9EFFF; width:10%">기안 날짜</th>
					                <td style="width: 40%">${approval.writeDate}</td>
					            </tr>
					            <tr>
					                <th style="background-color:#E9EFFE; width:10%">기안자</th>
					                <td style="width: 40%"><b>${approval.empName}</b> (${approval.gradeName}) </td>
					                <th style="background-color:#E9EFFE; width:10%">소속</th>
					                <td style="width: 40%">${approval.deptName} / ${approval.teamName}</td>
					            </tr>
					            <tr>
					                <th style="background-color:#E9EFFE; width:10%">참조</th>
					                <td style="width: 40%"><c:if test="${approval.refEmpId != null}">${refEmp.refEmpName} (${refEmp.refGrade})</c:if></td>
					                <th style="background-color:#E9EFFE; width:10%">열람</th>
					                <td style="width: 40%"></td>
					        	</tr>
					        </table>
					        
					        <div class="row">
						        <div class="col-lg-5" style="margin-left: auto;">
							        <table class="line table table-bordered" style="height: 120px; border:black;">
							        	<thead>
							        	</thead>
							        	<tbody>
							        	
										<c:forEach var="i" begin="1" end="3">
											<tr>
											<c:if test="${i == 1}">
												<th style="background-color:#E9EFFE; color:black; width:30px;" rowspan="3">승인</th>
											</c:if>
										    <c:forEach var="approvalLine" items="${approvalLines}">
						        				<c:if test="${i == 1}">
						        					<td style="height: 25%; padding:0px; margin:0px;">${approvalLine.gradeName}</td>
						        				</c:if>
						        				<c:if test="${i == 2}">
						        					<td style="height: 50%;">${approvalLine.empName}</td>
						        				</c:if>
						        				<c:if test="${i == 3}">
						        					<td style="height: 25%; padding:0px; margin:0px;">
						        					<c:if test="${approvalLine.isApproved == null}"><span></span></c:if>
						        					<c:if test="${approvalLine.isApproved == 'y'}"><span style="color:#004389;">승인</span></c:if>
						        					<c:if test="${approvalLine.isApproved == 'n'}"><span style="color:red;">반려</span></c:if>
						        					<fmt:formatDate value="${approvalLine.approvalDate}" dateStyle="short"/>
						        					</td>
						        				</c:if>
						        			</c:forEach>
						        			</tr>
										</c:forEach>
							        	</tbody>
							        </table>
						        </div>
					        </div>
			                <div class="row mb-3">
			                	<div class="col-sm-12">
				                	<textarea id="myTextarea">
									</textarea>
								</div>
               				</div>
               				<div class="row mb-3">
               					<label><b>첨부 파일</b></label>
               					<div class="file-list" style="background-color:#F6F6F6; height:35px;">
               					</div>
	               				<c:if test="${approvalFiles.size() != 0}">
					                <div class="file-list" style="background-color:#F6F6F6">
						            	<div class="filebox">
						            		<ul style="list-style:none;">
						            			<li>
						            				<table style="width:60%; overflow: auto;">
										            	<c:forEach var="approvalFile" items="${approvalFiles}">
										                	<tr>
										               			<td style="width:70%; padding-bottom:3px; text-align: left;">
										               				<a href="${pageContext.request.contextPath}/approval/filedownload?approvalFileId=${approvalFile.approvalFileId}">${approvalFile.approvalFileName}</a>
										               			</td>
											               		<td style="width:30%; color:#949291; text-align: left;">
											               			${approvalFile.approvalFileSize/1000}KB<i class="bi bi-paperclip"></i>
											               		</td>
										                	</tr>
										           		</c:forEach>
									               	</table>
						            			</li>
						            		</ul>
					               		</div>
					                </div>
				                </c:if>
				        	</div>
            			</div>
          			</div>
        		</div>
      		</div>
    	</section>

  	</main><!-- End #main -->

  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>


</body>

</html>