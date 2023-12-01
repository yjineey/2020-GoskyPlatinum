<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div align="center">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4" align="center">
			<div class="card border-top-dark border-bottom-dark shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
					
						<div class="col-auto" style="padding-right: 10px;">
							<button class="btn btn-circle btn-secondary" id="minusMonth">
								<i class="fas fa-angle-double-left fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col-auto">
							<button class="btn btn-circle btn-secondary" id="minusDate">
								<i class="fas fa-angle-left fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col mr-2">
							<div class="h5 mb-0 font-weight-bold text-gray-800 text" id="date"></div>
						</div>
						
						<div class="col-auto">
							<button class="btn btn-circle btn-secondary" id="plusDate">
								<i class="fas fa-angle-right fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col-auto" style="padding-left: 10px;" id="plusMonth">
							<button class="btn btn-circle btn-secondary">
								<i class="fas fa-angle-double-right fa-2x text-gray-300"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>

<script>
$(document).ready(function () {
	if(${empty date})
		showDate(null, null, null);
	else {
		$('#date').html("${date}");
	}
})

$("#minusMonth").click(function () {
	var s = getDate();
	location.href ="${ContextPath}/attendTeacherdate?year="+s[0]+"&month="+s[1].trim()+"&date="+s[2].trim()+"&value=1";
})

$("#minusDate").click(function () {
	var s = getDate();
	location.href ="${ContextPath}/attendTeacherdate?year="+s[0]+"&month="+s[1].trim()+"&date="+s[2].trim()+"&value=2";
})

$("#plusDate").click(function () {
	var s = getDate();
	location.href ="${ContextPath}/attendTeacherdate?year="+s[0]+"&month="+s[1].trim()+"&date="+s[2].trim()+"&value=3";
})

$("#plusMonth").click(function () {
	var s = getDate();
	location.href ="${ContextPath}/attendTeacherdate?year="+s[0]+"&month="+s[1].trim()+"&date="+s[2].trim()+"&value=4";
})

function getDate() {
	var str = document.getElementById('date').innerHTML;
	var s = str.split(".");
	return s;
}

function showDate(y, m, d, v) {
	var url = "${ContextPath}/calendar/getDate";
	var dataParam = {
			"year"  : y,
			"month" : m,
			"date"  : d,
			"value" : v
	};
	
	
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			$('#date').html(result.year+". "+result.month+". "+result.date);
			
			<!--showAttendanceList(1, ((result.year*10000)+(result.month*100)+result.date*1)+"");-->
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}
</script>