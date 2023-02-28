<%@ page contentType="text/html; charset=UTF-8" %>
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
		});
		
	</script>
 
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
        		<a class="nav-link collapsed" data-bs-target="#approval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check"></i><span>결재 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="approval-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
          			</li>
        		</ul>
     		</li><!-- End 결재 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" data-bs-target="myapproval-nav" data-bs-toggle="collapse" href="#">
          			<i class="bi bi-clipboard2-check-fill"></i><span>내 문서함</span><i class="bi bi-chevron-down ms-auto"></i>
        		</a>
        		<ul id="myapproval-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          			<li>
            			<a href="#"><span>전체</span></a>
          			</li>
          			<li>
            			<a href="#"><span>대기</span></a>
          			</li>
          			<li>
            			<a href="#"><span>진행</span></a>
          			</li>
          			<li>
            			<a href="#"><span>승인</span></a>
          			</li>
          			<li>
            			<a href="#"><span>반려</span></a>
          			</li>
        		</ul>
      		</li><!-- End 내 문서함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" href="${pageContext.request.contextPath}/approval/detail">
          			<i class="bi bi-eye"></i><span>열람함</span>
        		</a>
      		</li><!-- End 열람함 -->

      		<li class="nav-item">
        		<a class="nav-link collapsed" href="#">
          			<i class="bi bi-file-earmark"></i><span>임시저장함</span>
        		</a>
      		</li><!-- End 임시저장함 -->
    	</ul>
  	</aside><!-- End Sidebar -->

	<!-- 내용 -->
  	<main id="main" class="main">
	    <div class="pagetitle">
	    	<h1>결재 작성</h1>
	      	<nav>
		    	<ol class="breadcrumb">
		          	<li class="breadcrumb-item"><a href="#">전자결재</a></li>
		          	<li class="breadcrumb-item">내 문서함</li>
		        </ol>
	      	</nav>
	    </div>
	
    	<section class="section">
      		<div class="row">
        		<div class="col-lg-10">
          			<div class="card">
            			<div class="card-body m-4">
              				<!-- General Form Elements -->
              				<form>
              					<input id="approval_content" type="hidden" value='${approval.content}'>
			              		<div class="row mb-3">
			                  		<div class="col-sm-12 d-flex justify-content-end">
			                  			<button type="submit" class="btn btn-primary" style="margin-right: 8px">승인</button>
			                    		<button type="submit" class="btn btn-danger">반려</button>
			                  		</div>
			                	</div>
                
                				<table id="vertical-1" class="table table-bordered" style="width:100%">
						            <tr>
						                <th style="background-color:#E9EFFE; width:10%">결재 양식</th>
						                <td style="width: 40%">기안서</td>
						                <th style="background-color:#E9EFFF; width:10%">기안 날짜</th>
						                <td style="width: 40%">2023-02-16</td>
						            </tr>
						            <tr>
						                <th style="background-color:#E9EFFE; width:10%">기안자</th>
						                <td style="width: 40%">이지호</td>
						                <th style="background-color:#E9EFFE; width:10%">소속</th>
						                <td style="width: 40%">공공사업1 Div / 솔루션개발팀</td>
						            </tr>
						            <tr>
						                <th style="background-color:#E9EFFE; width:10%">참조</th>
						                <td style="width: 40%">최은종</td>
						                <th style="background-color:#E9EFFE; width:10%">열람</th>
						                <td style="width: 40%">이지호 > 이연희 > 김지영</td>
						        	</tr>
						        </table>
                				
				                <div class="row mb-3">
				                	<div class="col-sm-12">
					                	<textarea id="myTextarea">
										</textarea>
									</div>
                				</div>
              				</form><!-- End General Form Elements -->
            			</div>
          			</div>
        		</div>
      		</div>
    	</section>

  	</main><!-- End #main -->

  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>


</body>

</html>