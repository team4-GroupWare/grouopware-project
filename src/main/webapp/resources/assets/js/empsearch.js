function searchEmp() {
	console.log("searchEmp() 실행");
	$.ajax({
		type: "GET",
		url: "/employee/search",
		data: $("form[name=emp-search]").serialize(),
		sueccess: function(result) {
			console.log("성공");
			console.log(result);
			$('#emptable > tbody').empty();
			if(result.length >= 1) {
				result.forEach(function(item) {
					console.log(item)
					str = "<tr class='modal-open' onclick='javascript:empInfo('" + item.empId + "')'>";
					str += "<th scope='row'><img src='${pageContext.request.contextPath}/resources/assets/img/profile_img.png' alt='Profile' class='rounded-circle' width='40px'>" + item.name + "</th>"
					str += "<td>" + item.phone + "</td>";
					str += "<td>" + item.empId + "@mycompany.com</td>";
					str += "<td>" + item.deptName + "</td>";
					str += "<td>" + item.teamName + "</td>";
					str += "</tr>";
					$('#emptable').append(str);
				})
			}
		}
	})
}