<%@page import="com.spring.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 부트스트랩 -->
<!-- <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link href='../resources/lib/main.css' rel='stylesheet' />
<script src='../resources/lib/main.js'></script>
<script src='../resources/lib/locales-all.js'></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
	var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '${memoDTO.now_date}',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정 추가 :');
        // AJAX 호출
        var startDate = moment(arg.start).format('YYYY-MM-DD');
        var endDate = moment(arg.end).format('YYYY-MM-DD');
        $.ajax({
			type : 'POST',
			url : '/memo/ajaxInsert',
			dataType : 'json', 
			data : {"memo_title" : title, "memo_startdate" : startDate, "memo_enddate" : endDate},
			success : function(result){
			}
		});
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('삭제하시겠습니까???')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
    	  <c:forEach items="${memoList }" var="memo">
	        {
	          title: '${memo.memo_title}',
	          start: '${memo.memo_startdate}',
	          end : '${memo.memo_enddate}'
	        },
       	  </c:forEach>
      ]
    });

    calendar.render();
    
    // build the locale selector's options
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
      var optionEl = document.createElement('option');
      optionEl.value = localeCode;
      optionEl.selected = localeCode == initialLocaleCode;
      optionEl.innerText = localeCode;
      localeSelectorEl.appendChild(optionEl);
    });
    
 	// when the selected option changes, dynamically change the calendar option
    localeSelectorEl.addEventListener('change', function() {
      if (this.value) {
        calendar.setOption('locale', this.value);
      }
    });
  });

</script>
<%@ include file="../include/header.jsp" %>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    /* font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='top'>

    Locales:
    <select id='locale-selector'></select>

  </div>

  <div id='calendar'></div>

<%@ include file="../include/footer.jsp" %>	
