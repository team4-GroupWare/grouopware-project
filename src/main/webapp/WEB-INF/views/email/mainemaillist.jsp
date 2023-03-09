<%@page contentType="text/jsp; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-borderless datatable">
	<thead style="border-bottom: 2px solid #EBEEF4;">
		<tr>
			<th scope="col">보낸사람</th>
			<th scope="col">제목</th>
			<th scope="col">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emailList" items="${emailList}" varStatus="status">
			<tr>
				<td>
				<c:if test="${emailList.receiveProfileData ne null}">
				<img
					src="${pageContext.request.contextPath}/employee/img?empId=${emailList.receiveId}"
					alt="Profile" class="rounded-circle" style="margin-right: 8px"
					width="30px">
				</c:if>
				<c:if test="${emailList.receiveProfileData eq null}">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png"
					alt="Profile" class="rounded-circle" style="margin-right: 8px"
					width="30px">
				</c:if>
				
				
				 ${emailList.receiveName}</td>
				<td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
				<a href="${pageContext.request.contextPath}/email/readSendEmail?sendEmailId=${emailList.sendEmailId}" class="mail-title">${emailList.title}</a></td>
				<td>${emailList.sentDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>