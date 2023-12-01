<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<div class="card-body">
	<div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-dark text-uppercase mb-1">수강 신청</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800" id="acount"></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-dark text-uppercase mb-1">수강 중</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800" id="lcount"></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-danger shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-dark text-uppercase mb-1">수강 취소</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800" id="ccount"></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

function writeCards(ym) {
	getCardsData(ym, 'a');
	getCardsData(ym, 'l');
	getCardsData(ym, 'c');
}

function getCardsData(ym, status) {
	var url = "${ContextPath}/classApply/getCardsData";
	var dataParam = {
			"status" : status,
			"cdate" : ym,
			"dateType" : "m"
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			
			$('#'+status+'count').html(result);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}

</script>