<%@page import="kr.co.gugu.domain.SubjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>


<div class="form-group row">
	<label class="col-sm-2 control-label" style="margin-top: 5px">종목 이름</label>

	<div class="col-sm-4" id="selectAct"></div>
	
							
</div>

<div class="form-group row">
	<label class="col-sm-2 control-label" style="margin-top: 5px">강의 제목</label>

	<div class="col-sm-8">
		<input id="sname" name="sname" type="text" class="form-control" placeholder="강의 제목"
		<c:if test="${not empty subject }">value="${subject.sname}"</c:if>  required>
	</div>
</div>

<%
SubjectDTO subject = (SubjectDTO) request.getAttribute("subject");
%>

<script type="text/javascript">
	$(document).ready(function () {
		getActList();
	});
	
	function getActList() {
		var url = "${ContextPath}/act/getList";	
		
		$.ajax({
			type : 'GET',
			url: url,
			
			success: function(result) {	
				var htmls = '<select id="ssort" name="ssort" class="custom-select" onchange="getTeacherListOnChange()">';
				
				$(result).each(function(){
					
					if(result.length < 1){
						htmls += "가능한 종목이 없습니다.";
					} else {
					
						htmls += '<option value="' + this.ssno + '" ';
						
						<%
						if(subject != null) {
						%>
							if(this.ssort == "${subject.ssort}") {
								htmls += 'selected="selected"';
							}
						<%
						}
						%>
						
						htmls += '>' + this.name + '</option>';
					
					}
					
				});	//each end
				
				htmls += '</select>';
				
				$('#selectAct').html(htmls);
				
			}, // success end
		
			error : function(){
				alert('ajax error');
			}
			
		}); // Ajax end
	} // function getBoardName end
</script>