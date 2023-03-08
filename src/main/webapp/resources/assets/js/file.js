var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    for (const file of obj.files) {
        // 첨부파일 검증
        if (validation(file)) {
            // 파일 배열에 담기
            var reader = new FileReader();
            reader.onload = function () {
                filesArr.push(file);
            };
            reader.readAsDataURL(file);

            // 목록 추가
            let htmlData = '';
            htmlData += '<div id="file' + fileNo + '" class="filebox" style="margin-bottom:0">';
            htmlData += '   <p class="email-file name" style="margin-bottom:0">' + file.name + '</p>';
            htmlData += '	<p class="email-file size"style="margin-bottom:0">' + file.size/1000 + 'KB</p>'; 	
            htmlData += '   <a class="email-file delete" onclick="deleteFile(' + fileNo + ');"><i class="bi bi-dash-square"></i></a>';
            htmlData += '</div>';
            $(".file-list").append(htmlData);
            fileNo++;
        } else {
            continue;
        }
    }
    
    // 초기화
    //document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
}

/* 폼 전송 */
function submitEmailForm() {
    // 폼데이터 담기
    var form = document.querySelector("#writeForm");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("attachFiles", filesArr[i]);
        }
    }
    
    var path = sessionStorage.getItem("contextpath");

    $.ajax({
        method: 'POST',
        url: path+'/email/write',
        dataType: 'json',
        data: formData,
        contentType: false,			
	    processData: false,
		cache: false,
        success: function (data) {
        	let url = path + '/email/complete';
        	location.replace(url);
        },
        error: function (xhr, desc, err) {
            console.log('에러');
            console.log('error:' + err);
            return;
        }
    })
}