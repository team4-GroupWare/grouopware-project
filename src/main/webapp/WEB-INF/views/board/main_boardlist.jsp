<%@page contentType="text/jsp; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-borderless datatable" style="table-layout:fixed">
	<thead style="border-bottom: 2px solid #EBEEF4;">
		<tr>
			<th scope="col" width="10%">No.</th>
			<th scope="col" width="60%">제목</th>
			<th scope="col" width="20%">날짜</th>
			<th scope="col" width="10%">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><a href="${pageContext.request.contextPath}/board/detail/${board.noticeId}">${board.noticeTitle}</a></td>
				<td>${board.writeDate}</td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${empty boardList}">
    <div style="height:130px;text-align:center;margin-top:110px">
		내용이 존재하지 않습니다.
    </div>
</c:if>
<%-- <!-- 공지사항 -->
<div id="notice" class="notice">
	<c:forEach var="board" items="${boardList}" varStatus="status">
		<div class="post-item clearfix">
			<h4><a href="${pageContext.request.contextPath}/board/detail/${board.noticeId}">${board.noticeTitle}</a></h4>
		</div>
	</c:forEach>
</div>
<!-- End 공지사항 --> --%>
