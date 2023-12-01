<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	width: 80%;
	margin: auto;
}

.navigation {
	margin-top: 100px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}
</style>

<div class="form-group row" >
	<div class="col-sm-2" align="left">
		<select id="selectPeople" class="custom-select" onchange="showCal()">
			<option value="0" selected>::: 원생 :::</option>
			<c:forEach var="plist" items="${plist}">
				<option value="${plist.pno}" value="${plist.pno}">${plist.pname}(${plist.pinfo})</option>
			</c:forEach>
		</select>
	</div>
</div>

<div class="calendar" align="center">
	<table class="calendar_body">

		<thead>
			<tr bgcolor="#CECECE">
				<td class="day sun" >
					일
				</td>
				<td class="day" >
					월
				</td>
				<td class="day" >
					화
				</td>
				<td class="day" >
					수
				</td>
				<td class="day" >
					목
				</td>
				<td class="day" >
					금
				</td>
				<td class="day sat" >
					토
				</td>
			</tr>
		</thead>
		
		<tbody id="calendarPrint" />
	</table>

</div>

<script>
function showCal() {
	var s = getYM();
	showCalendar(s[0], s[1].trim());
}

function showCalendar(y, m) {
	var url = "${ContextPath}/calendar/getAttendance";
	var dataParam = {
			"year"  : y,
			"month" : m,
			"key"   : "p",
			"num"   : $("#selectPeople option:selected").val()
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			
			var htmls = '<tr>';
			
			$(result).each(function(index){
				
				if(this.value == 'today') {
					htmls += '<td class="today"><div class="date">'+this.date+'</div>';
				} else if(index % 7 == 6){
					htmls += '<td class="sat_day"><div class="date">'+this.date+'</div>';
				} else if(index % 7 == 0){
					htmls += '</tr><tr><td class="sun_day"><div class="sun">'+this.date+'</div>';
				} else {
					htmls += '<td class="normal_day"><div class="date">'+this.date+'</div>';
				}
				
				if(this.attDTO != null) {
					htmls += '<div>';
					
					if(this.attDTO.att == 0) {htmls += '결석';}
					else if(this.attDTO.att == 1) {htmls += '지각';}
					else if(this.attDTO.att == 2) {htmls += '조퇴';}
					else if(this.attDTO.att == 3) {htmls += '출석';}
					else if(this.attDTO.att == 4) {htmls += '공결';}
					
					if(this.attDTO.beforcon != null) {htmls += '<br>오전 : ' + this.attDTO.beforcon;}
						
					if(this.attDTO.aftercon != null) {htmls += '<br>오후 : ' + this.attDTO.aftercon;}
					
					htmls += '</div>';
				}
				
				htmls += '</td>';
				
			});
			
			$('#calendarPrint').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}
</script>
