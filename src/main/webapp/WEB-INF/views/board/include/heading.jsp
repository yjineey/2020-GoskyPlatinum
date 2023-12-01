<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<script>
	$(document).ready(function () {
		var bsort = getParamBsort();
		getBoardName(bsort);
	});

	function getParamBsort() {
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const bsort = urlParams.get('bsort');
		return bsort;
	}
	
	function getBoardName(bsort) {
		var url = "${ContextPath}/board/getName";	
		var paramData = {"bsort" : bsort};
		
		$.ajax({
			type: 'GET',
			url: url,
			data: paramData,
			dataType: 'json',
	
			success: function(result) {	
				$('#pageHeading1').html('<h1 class="h3 mb-0 text-gray-800">'+ result.bsname +' </h1>');
				$('#pageHeading2').html('<p class="mb-4">회원들에게 보여지는 '+ result.bsname +' 입니다</p>');
				$('#pageHeading3').html('<h6 class="m-0 font-weight-bold text-primary"> '+ result.bsname +'</h6>');				
			},
		
			error : function(){
				alert('ajax error');
			}
		});	// Ajax end
	} // function getBoardName end
</script>