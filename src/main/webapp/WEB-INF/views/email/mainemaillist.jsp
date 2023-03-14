<%@page contentType="text/jsp; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-borderless datatable">
	<thead style="border-bottom: 2px solid #EBEEF4;">
		<tr>
			<th scope="col" width="20%">받는사람</th>
			<th scope="col" width="60%">제목</th>
			<th scope="col" width="20%">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="emailList" items="${emailList}" varStatus="status">
			<tr>
				<td>
					<!-- 보낸 사람이 프로필 사진이 있다면 사진 출력 -->
					<c:if test="${emailList.receiveProfileData ne null}">
					<img
						src="${pageContext.request.contextPath}/employee/img?empId=${emailList.receiveId}"
						alt="Profile" class="rounded-circle" style="margin-right: 8px"
						width="30px">
					</c:if>
					<!-- 보낸 사람이 프로필 사진이 없다면 기본 이미지 출력 -->
					<c:if test="${emailList.receiveProfileData eq null}">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/basic-user.png"
						alt="Profile" class="rounded-circle" style="margin-right: 8px"
						width="30px">
					</c:if>
					 ${emailList.receiveName}
				</td>
				<td><c:if test="${emailList.important}"><i style="color:red" class="bi bi-exclamation-circle"></i>[중요]</c:if>
				<a href="${pageContext.request.contextPath}/email/readSendEmail?sendEmailId=${emailList.sendEmailId}" class="mail-title">${emailList.title}</a></td>
				<td>${emailList.sentDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${empty emailList}">
    <div style="height:130px;text-align:center;margin-top:110px">
             메일이 존재하지 않습니다.
    </div>
</c:if>