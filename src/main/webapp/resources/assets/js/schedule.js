$(document).ready(function() {
    calendarInit();
});
/*
    달력 렌더링 할 때 필요한 정보 목록 

    현재 월(초기값 : 현재 시간)
    금월 마지막일 날짜와 요일
    전월 마지막일 날짜와 요일
*/

function calendarInit() {
    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    
    // 달력에서 표기하는 날짜 객체
    var month = (date.getMonth()+1);
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
    var path = sessionStorage.getItem("contextpath");
    
    // kst 기준 현재시간
    //console.log(thisMonth);
    
    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    
    var year1 = firstDay.getFullYear();
    var month1 = firstDay.getMonth()+1;
    var day1 = firstDay.getDate();
    var format1 = year1+"-"+(("00"+month1.toString()).slice(-2))+"-"+(("00"+day1.toString()).slice(-2));
    var year2 = lastDay.getFullYear();
    var month2 = lastDay.getMonth()+1;
    var day2 = lastDay.getDate();
    var format2 = year2+"-"+(("00"+month2.toString()).slice(-2))+"-"+(("00"+day2.toString()).slice(-2));
    
    $.ajax({
    	url: path+"/statuslist",
    	data:{
    		"startDay":format1,
    		"endDay" : format2
    		
    	}
    }).done(function(data){
    	 // 캘린더 렌더링
        renderCalender(thisMonth,data);
    });
    function renderCalender(thisMonth,months) {
    	var months = months;
        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
       
        var nextDate = endDay.getDate(); 	//nextDate31
       
        var nextDay = endDay.getDay();		//nextDay5
       

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
        	if(months[i-1] == undefined){
        		calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        	}
        	else if(months[i-1]=='결근'||months[i-1]=='퇴근미처리'){
        		calendar.innerHTML = calendar.innerHTML + '<div class="day current empty">' + i + '</div>'
        	}else{
        		if(months[i-1]=='출근'){
        			calendar.innerHTML = calendar.innerHTML + '<div class="day current attendance">' + i + '</div>'
        		}else if(months[i-1]=='지각'){
        			calendar.innerHTML = calendar.innerHTML + '<div class="day current late">' + i + '</div>'
        		}else if(months[i-1]=='연장근무'){
        			calendar.innerHTML = calendar.innerHTML + '<div class="day current overtime">' + i + '</div>'
        		}else {
        			calendar.innerHTML = calendar.innerHTML + '<div class="day current holiday">' + i + '</div>'
        		}
	        }
        	
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay-1 == 7 ? 0 : 7 - nextDay-1); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            
           
        }
    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        console.log(thisMonth);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}