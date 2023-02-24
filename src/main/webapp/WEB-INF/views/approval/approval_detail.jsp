<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<%@ include file="/WEB-INF/views/common/head.jsp" %>
	

    <!-- 텍스트 에디터 -->
  	<!-- <script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script> -->
  	<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/decoupled-document/ckeditor.js"></script>
  	<!-- <script src="../documentckeditor/build/ckeditor.js"></script> -->
  
  	<style>
    	.ck-editor { height: 800px; }
     	.ck-content { font-size: 12px; }
  
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
				                	
	                  					<!-- ckeditior content -->
	                  					<div class="col-lg-12" id="approval-content" name="approval-content">
	                      					<p class=MsoBodyText style='margin-top:.25pt'><span lang=EN-US style='font-size:6.0pt;mso-bidi-font-size:8.0pt;mso-fareast-font-family:"맑은 고딕"; mso-fareast-theme-font:minor-fareast'><o:p>&nbsp;</o:p></span></p>
											<table class=TableNormal border=1 cellspacing=0 cellpadding=0 style='width:100%; border-collapse:collapse;mso-table-layout-alt:fixed;border:none; mso-border-alt:solid black .75pt;mso-yfti-tbllook:480;mso-padding-alt:0cm 0cm 0cm 0cm; mso-border-insideh:.75pt solid black;mso-border-insidev:.75pt solid black'>
 												<tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:46.1pt'>
  													<td width=693 colspan=8 valign=top style='width:520.0pt;border:solid black 1.0pt; mso-border-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm;height:46.1pt'>
  														<p class=TableParagraph align=center style='margin-top:0cm;margin-right:218.3pt; margin-bottom:0cm;margin-left:210.55pt;margin-bottom:.0001pt;text-align:center; line-height:34.75pt;mso-line-height-rule:exactly'>
  														<span style='font-size: 24.0pt;mso-bidi-font-size:11.0pt;letter-spacing:-.25pt'>기안서</span>
  														<span lang=EN-US style='font-size:24.0pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
  														</p>
  														<p class=TableParagraph style='margin-left:1.1pt;line-height:10.75pt; mso-line-height-rule:exactly;tab-stops:405.3pt'>
  													</td>
 												</tr>
 												<tr style='mso-yfti-irow:1;height:16.3pt'>
  												<td width=83 rowspan=2 valign=top style='width:62.5pt;border:solid black 1.0pt; border-top:none;mso-border-top-alt:solid black .75pt;mso-border-alt:solid black .75pt; padding:0cm 0cm 0cm 0cm;height:16.3pt'>
  													<p class=TableParagraph style='margin-top:7.6pt;margin-right:0cm;margin-bottom: 0cm;margin-left:10.6pt;margin-bottom:.0001pt'>
  													<span style='font-size:9.5pt; mso-bidi-font-size:11.0pt;letter-spacing:-.2pt'>기안부서</span>
  													<span lang=EN-US style='font-size:9.5pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
  													</p>
  												</td>
  												<td width=112 rowspan=2 valign=top style='width:83.65pt;border-top:none; border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt; mso-border-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm;height:16.3pt'>
  													<p class=TableParagraph style='margin-top:7.6pt;margin-right:0cm;margin-bottom: 0cm;margin-left:25.75pt;margin-bottom:.0001pt'>
  													<span style='font-size:9.5pt; mso-bidi-font-size:11.0pt;letter-spacing:-.25pt'>영업팀</span>
  													<span lang=EN-US style='font-size:9.5pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
  													</p>
  												</td>
									  			<td width=84 valign=top style='width:63.3pt;border-top:none;border-left:none; border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt: solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt; padding:0cm 0cm 0cm 0cm;height:16.3pt'>
									  				<p class=TableParagraph align=center style='margin-top:.1pt;margin-right: 14.75pt;margin-bottom:0cm;margin-left:15.5pt;margin-bottom:.0001pt; text-align:center;line-height:15.4pt;mso-line-height-rule:exactly'>
									  				<span style='font-size:9.5pt;mso-bidi-font-size:11.0pt;letter-spacing:-.25pt'>사원</span>
									  				<span lang=EN-US style='font-size:9.5pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
									  				</p>
									  			</td>
									  			<td width=83 valign=top style='width:62.5pt;border-top:none;border-left:none; border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt: solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt; padding:0cm 0cm 0cm 0cm;height:16.3pt'>
									  				<p class=TableParagraph align=center style='margin-top:.1pt;margin-right: 9.55pt;margin-bottom:0cm;margin-left:10.0pt;margin-bottom:.0001pt;text-align: center;line-height:15.4pt;mso-line-height-rule:exactly'>
									  				<span style='font-size:9.5pt;mso-bidi-font-size:11.0pt;letter-spacing:-.25pt'>차장</span>
									  				<span lang=EN-US style='font-size:9.5pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
									  				</p>
									  			</td>
												<td width=83 valign=top style='width:62.5pt;border-top:none;border-left:none; border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;mso-border-top-alt: solid black .75pt;mso-border-left-alt:solid black .75pt;mso-border-alt:solid black .75pt; padding:0cm 0cm 0cm 0cm;height:16.3pt'>
													<p class=TableParagraph align=center style='margin-top:.1pt;margin-right: 9.55pt;margin-bottom:0cm;margin-left:10.45pt;margin-bottom:.0001pt; text-align:center;line-height:15.4pt;mso-line-height-rule:exactly'>
													<span style='font-size:9.5pt;mso-bidi-font-size:11.0pt;letter-spacing:-.25pt'>부장</span>
													<span lang=EN-US style='font-size:9.5pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span>
													</p>
												</td>
												<td width=84 rowspan=2 valign=top style='width:63.3pt;border-top:none; border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt; mso-border-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm;height:16.3pt'>
													<p class=TableParagraph>
													<span lang=EN-US style='font-size:9.0pt;mso-bidi-font-size: 11.0pt;font-family:"Times New Roman",serif;mso-hansi-font-family:"맑은 고딕"; mso-bidi-font-family:"맑은 고딕"'><o:p>&nbsp;</o:p></span>
													</p>
												</td>
												<td width=83 rowspan=2 valign=top style='width:62.5pt;border-top:none; border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt; mso-border-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm;height:16.3pt'>
													<p class=TableParagraph><span lang=EN-US style='font-size:9.0pt;mso-bidi-font-size: 11.0pt;font-family:"Times New Roman",serif;mso-hansi-font-family:"맑은 고딕"; mso-bidi-font-family:"맑은 고딕"'><o:p>&nbsp;</o:p></span></p>
												</td>
												<td width=80 rowspan=2 valign=top
														style='width: 59.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 16.3pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
												</td>
												</tr>
												<tr style='mso-yfti-irow: 2; height: 14.05pt'>
													<td width=84 valign=top
														style='width: 63.3pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 14.75pt; margin-bottom: 0cm; margin-left: 15.5pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span lang=EN-US
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p>이지호</o:p></span>
														</p>
													</td>
													<td width=83 valign=top
														style='width: 62.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 9.55pt; margin-bottom: 0cm; margin-left: 10.0pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span lang=EN-US
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p>이연희</o:p></span>
														</p>
													</td>
													<td width=83 valign=top
														style='width: 62.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 9.55pt; margin-bottom: 0cm; margin-left: 10.45pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span lang=EN-US
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p>김지영</o:p></span>
														</p>
													</td>
												</tr>
												<tr style='mso-yfti-irow: 3; height: 14.05pt'>
													<td width=83 valign=top
														style='width: 62.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 9.55pt; margin-bottom: 0cm; margin-left: 10.5pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>기안일</span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
													<td width=112 valign=top
														style='width: 83.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 19.05pt; margin-bottom: 0cm; margin-left: 20.3pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span lang=EN-US
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.1pt'>23/02/17</span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
													<td width=84 rowspan=2 valign=top
														style='width: 63.3pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph style='margin-top: .45pt'>
															<span lang=EN-US
																style='font-size: 11.5pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
														<p class=TableParagraph style='margin-left: 6.25pt'>
															<span lang=EN-US
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
													<td width=83 rowspan=2 valign=top
														style='width: 62.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
													<td width=83 rowspan=2 valign=top
														style='width: 62.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
													<td width=84 rowspan=2 valign=top
														style='width: 63.3pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
													<td width=83 rowspan=2 valign=top
														style='width: 62.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
													<td width=80 rowspan=2 valign=top
														style='width: 59.75pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
												</tr>
												<tr style='mso-yfti-irow: 4; height: 15.05pt'>
													<td width=83 valign=top
														style='width: 62.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 15.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: .1pt; margin-right: 9.55pt; margin-bottom: 0cm; margin-left: 10.5pt; margin-bottom: .0001pt; text-align: center; line-height: 15.4pt; mso-line-height-rule: exactly'>
															<span class=SpellE><span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>기안자</span></span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
													<td width=112 valign=top
														style='width: 83.65pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 15.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: .1pt; margin-right: 19.05pt; margin-bottom: 0cm; margin-left: 20.3pt; margin-bottom: .0001pt; text-align: center; line-height: 15.4pt; mso-line-height-rule: exactly'>
															<span class=SpellE><span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>박한비</span></span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
												</tr>
												<tr style='mso-yfti-irow: 5; height: 14.05pt'>
													<td width=83 valign=top
														style='width: 62.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 9.5pt; margin-bottom: 0cm; margin-left: 10.5pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>참조</span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
													<td width=610 colspan=7 valign=top
														style='width: 457.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
													</td>
												</tr>
												<tr style='mso-yfti-irow: 6; height: 14.05pt'>
													<td width=83 valign=top
														style='width: 62.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph align=center
															style='margin-top: 0cm; margin-right: 9.5pt; margin-bottom: 0cm; margin-left: 10.5pt; margin-bottom: .0001pt; text-align: center; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>제목</span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
													<td width=610 colspan=7 valign=top
														style='width: 457.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 14.05pt'>
														<p class=TableParagraph
															style='margin-left: 4.8pt; line-height: 13.25pt; mso-line-height-rule: exactly'>
															<span
																style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt; letter-spacing: -.25pt'>기안서</span><span
																lang=EN-US style='font-size: 9.5pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span>
														</p>
													</td>
												</tr>
												<tr style='mso-yfti-irow: 7; mso-yfti-lastrow: yes; height: 416.8pt'>
													<td width=693 colspan=8 valign=top
														style='width: 520.0pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 416.8pt'>
														<p class=TableParagraph>
															<span lang=EN-US
																style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
														</p>
														<table class=TableNormal border=1 cellspacing=0 cellpadding=0
															align=left
															style='width:95%; border-collapse: collapse; mso-table-layout-alt: fixed; border: none; mso-border-alt: solid black .75pt; mso-table-overlap: never; mso-yfti-tbllook: 480; mso-table-lspace: 7.1pt; margin-left: 4.85pt; mso-table-rspace: 7.1pt; margin-right: 4.85pt; mso-table-anchor-vertical: paragraph; mso-table-anchor-horizontal: margin; mso-table-left: left; mso-table-top: 290.45pt; mso-padding-alt: 0cm 0cm 0cm 0cm; mso-border-insideh: .75pt solid black; mso-border-insidev: .75pt solid black'>
															<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 22.3pt'>
																<td width=89 valign=top
																	style='width: 66.5pt; border: solid black 1.0pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.75pt; margin-bottom: .0001pt'>
																		<b style='mso-bidi-font-weight: normal'>문서 <span
																			style='letter-spacing: -.25pt'>번호</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=285 valign=top
																	style='width: 213.55pt; border: solid black 1.0pt; border-left: none; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 3.7pt; margin-bottom: .0001pt'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US>IS-</span>생관<span
																			lang=EN-US>-<span style='letter-spacing: -.1pt'>17032401</span>
																			<o:p></o:p></span></b>
																	</p>
																</td>
																<td width=101 valign=top
																	style='width: 75.8pt; border: solid black 1.0pt; border-left: none; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph align=center
																		style='margin-top: 1.1pt; margin-right: 13.3pt; margin-bottom: 0cm; margin-left: 13.55pt; margin-bottom: .0001pt; text-align: center'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.2pt'>기안일자</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=203 valign=top
																	style='width: 152.5pt; border: solid black 1.0pt; border-left: none; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 4.05pt; margin-bottom: .0001pt'>
																		<span class=GramE><b style='mso-bidi-font-weight: normal'><span
																				lang=EN-US>2017. <span style='letter-spacing: -.5pt'>.</span></span></b></span><b
																			style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
															</tr>
															<tr style='mso-yfti-irow: 1; height: 22.3pt'>
																<td width=89 valign=top
																	style='width: 66.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 9.65pt; margin-bottom: .0001pt'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.2pt'>기안부서</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=285 valign=top
																	style='width: 213.55pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 3.7pt; margin-bottom: .0001pt'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.1pt'>생산관리팀</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=101 valign=top
																	style='width: 75.8pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph align=center
																		style='margin-top: 1.1pt; margin-right: 13.3pt; margin-bottom: 0cm; margin-left: 13.55pt; margin-bottom: .0001pt; text-align: center'>
																		<span class=SpellE><b style='mso-bidi-font-weight: normal'><span
																				style='letter-spacing: -.25pt'>기안자</span></b></span><b
																			style='mso-bidi-font-weight: normal'><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=203 valign=top
																	style='width: 152.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph>
																		<span lang=EN-US
																			style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																</td>
															</tr>
															<tr style='mso-yfti-irow: 2; height: 22.3pt'>
																<td width=89 valign=top
																	style='width: 66.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 9.05pt; margin-bottom: .0001pt; tab-stops: 43.25pt'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.5pt'>분</span><span lang=EN-US><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			</span></span><span style='letter-spacing: -.5pt'>류</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=285 valign=top
																	style='width: 213.55pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 3.7pt; margin-bottom: .0001pt; tab-stops: 37.3pt 53.75pt 87.35pt 103.75pt 137.35pt 153.8pt'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.25pt'>품의</span><span lang=EN-US><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span><span
																				style='letter-spacing: -.5pt'>/</span><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span></span><span
																			style='letter-spacing: -.25pt'>기안</span><span lang=EN-US><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span><span
																				style='letter-spacing: -.5pt'>/</span><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span></span><span
																			style='letter-spacing: -.25pt'>보고</span><span lang=EN-US><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span><span
																				style='letter-spacing: -.5pt'>/</span><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp; </span></span><span class=SpellE><span
																				style='letter-spacing: -.25pt'>협조전</span></span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=101 valign=top
																	style='width: 75.8pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph align=center
																		style='margin-top: 1.1pt; margin-right: 13.3pt; margin-bottom: 0cm; margin-left: 13.55pt; margin-bottom: .0001pt; text-align: center'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.2pt'>협조부서</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=203 valign=top
																	style='width: 152.5pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph>
																		<span lang=EN-US
																			style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																</td>
															</tr>
															<tr style='mso-yfti-irow: 3; height: 22.3pt'>
																<td width=89 valign=top
																	style='width: 66.5pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph
																		style='margin-top: 1.1pt; margin-right: 0cm; margin-bottom: 0cm; margin-left: 9.05pt; margin-bottom: .0001pt; tab-stops: 43.25pt'>
																		<b style='mso-bidi-font-weight: normal'><span
																			style='letter-spacing: -.5pt'>제</span><span lang=EN-US><span
																				style='mso-tab-count: 1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			</span></span><span style='letter-spacing: -.5pt'>목</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
																<td width=589 colspan=3 valign=top
																	style='width: 441.95pt; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; mso-border-top-alt: solid black .75pt; mso-border-left-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 22.3pt'>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																</td>
															</tr>
															<tr
																style='mso-yfti-irow: 4; mso-yfti-lastrow: yes; height: 290.25pt'>
																<td width=678 colspan=4 valign=top
																	style='width: 508.45pt; border: solid black 1.0pt; border-top: none; mso-border-top-alt: solid black .75pt; mso-border-alt: solid black .75pt; padding: 0cm 0cm 0cm 0cm; height: 290.25pt'>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-left: 67.15pt'>
																		<b style='mso-bidi-font-weight: normal'>관련 사항을 아래와 같이 기안 
																		<span class=SpellE>하오니</span> 검토 후 재가 
																		<span style='letter-spacing: -.1pt'>바랍니다<span lang=EN-US>.</span></span>
																		<span lang=EN-US><o:p></o:p></span></b>
																	</p>
																	<p class=TableParagraph align=center style='margin-top: 10.1pt; margin-right: 189.6pt; margin-bottom: 0cm; margin-left: 253.25pt; margin-bottom: .0001pt; text-align: center; line-height: 17.5pt; mso-line-height-rule: exactly'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US>-
																		</span>아 <span class=SpellE>래</span> <span lang=EN-US style='letter-spacing: -.5pt'>-</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																	<p class=TableParagraph
																		style='margin-left: 67.15pt; line-height: 17.5pt; mso-line-height-rule: exactly'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US style='letter-spacing: -.25pt'>1.</span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-top: .5pt'>
																		<span lang=EN-US style='font-size: 18.5pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-left: 67.15pt'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US>3.</span>
																		<span class=GramE>적용시점<span lang=EN-US> :</span></span>
																		<span lang=EN-US> </span>결재 후 <span style='letter-spacing: -.25pt'>즉시
																		<span lang=EN-US>.</span></span><span lang=EN-US><o:p></o:p></span></b>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-top: .55pt'>
																		<span lang=EN-US style='font-size: 18.5pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-left: 67.15pt'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US>4.</span>
																		<span style='letter-spacing: -.25pt'>첨부<span lang=EN-US>.</span></span>
																		<span lang=EN-US><o:p></o:p></span></b>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph>
																		<span lang=EN-US style='font-size: 14.0pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph style='margin-top: .5pt'>
																		<span lang=EN-US style='font-size: 18.5pt; mso-bidi-font-size: 11.0pt; font-family: "Arial", sans-serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p>&nbsp;</o:p></span>
																	</p>
																	<p class=TableParagraph align=center
																		style='margin-top: 0cm; margin-right: 189.6pt; margin-bottom: 0cm; margin-left: 253.25pt; margin-bottom: .0001pt; text-align: center'>
																		<b style='mso-bidi-font-weight: normal'><span lang=EN-US>-
																		</span>이 상 <span lang=EN-US style='letter-spacing: -.5pt'>-</span>
																		<span lang=EN-US><o:p></o:p></span></b>
																	</p>
																</td>
															</tr>
														</table>
														<p class=TableParagraph>
															<span lang=EN-US style='font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: "Times New Roman", serif; mso-hansi-font-family: "맑은 고딕"; mso-bidi-font-family: "맑은 고딕"'><o:p></o:p></span>
														</p>
													</td>
												</tr>
											</table>
												
											<p class=MsoBodyText style='margin-top: 8.1pt; tab-stops: 536.4pt'>
												<span lang=EN-US style='mso-fareast-font-family: "맑은 고딕"; mso-fareast-theme-font: minor-fareast'><o:p>&nbsp;</o:p></span>
											</p>        
	                  					</div>
	                  					<!-- End ckeditior content -->
                  					
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