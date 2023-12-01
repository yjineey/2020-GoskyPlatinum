<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div align="center">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 col-sm-8 mb-4" align="center">
			<div class="card border-top-dark border-bottom-dark shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
					
						<div class="col-auto" style="padding-right: 10px;">
							<button class="btn btn-circle btn-secondary" id="minusYear">
								<i class="fas fa-angle-double-left fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col-auto">
							<button class="btn btn-circle btn-secondary" id="minusMonth">
								<i class="fas fa-angle-left fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col mr-2">
							<div class="h5 mb-0 font-weight-bold text-gray-800 text" id="date"></div>
						</div>
						
						<div class="col-auto">
							<button class="btn btn-circle btn-secondary" id="plusMonth">
								<i class="fas fa-angle-right fa-2x text-gray-300"></i>
							</button>
						</div>
						
						<div class="col-auto" style="padding-left: 10px;" id="plusYear">
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
	showDate(null, null);	
})

$("#minusYear").click(function () {
	var s = getYM();
	showDate(String(s[0]/1-1), s[1].trim());
})

$("#minusMonth").click(function () {
	var s = getYM();
	showDate(s[0], s[1]/1-1);
})

$("#plusMonth").click(function () {
	var s = getYM();
	showDate(s[0], s[1]/1+1);
})

$("#plusYear").click(function () {
	var s = getYM();
	showDate(String(s[0]/1+1), s[1].trim());
})

function getYM() {
	var str = document.getElementById('date').innerHTML;
	var s = str.split(".");
	return s;
}

function showDate(y, m) {
	var url = "${ContextPath}/calendar/getYM";
	var dataParam = {
			"year" : y,
			"month" : m,
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			$('#date').html(result.year+". "+result.month+".");
			
			showCalendar(result.year, result.month);
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}
</script>