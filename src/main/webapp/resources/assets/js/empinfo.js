function empInfo(empId) {
	console.log("empInfo 실행");
	
	$.ajax({
		url: "/webapp/employee/empinfo",
		data: {"empId" : empId},
		type: "GET"
	}).done((result) => {
		console.log("성공");
		console.log(result);
		$('#empName').html(result.name);
		$('#empGrade').html(result.gradeName);
		$('#empDept').html(result.deptName);
		$('#empTeam').html(result.teamName);
		$('#empEmail').html(result.empId + "@mycompany.com");
		$('#empPhone').html(result.phone);
		$("#popup").css('display','flex').hide().fadeIn();
	})
	
};

$(function(){
	  $("#confirm").click(function(){
	      modalClose();
	      //컨펌 이벤트 처리
	  });
	  $("#close").click(function(){
	      modalClose();
	  });
	  function modalClose(){
	    $("#popup").fadeOut();
	  }
});