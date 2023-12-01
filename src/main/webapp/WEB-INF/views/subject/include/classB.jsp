<%@page import="kr.co.gugu.domain.SubjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>


<div class="form-group row" style="margin-top: 40px;">
	<label class="col-sm-2 control-label" style="margin-top: 5px">시간</label>

	<div class="input-group col-sm-8">
  			<style>
  				label.cb {
  					margin-top : 8px;
  					margin-right:10px;
  					margin-left :10px;
  				}
  			</style>
  		
      		<label class="cb"><input type="radio" name="stime" value="0" checked> 오전 </label>
      		<label class="cb"><input type="radio" name="stime" value="1" > 오후 </label>
	</div>
</div>

<%
SubjectDTO subject = (SubjectDTO) request.getAttribute("subject");
if (subject != null) {
%>
<script>
	$(document).ready(function () {
		$('input:radio[name=stime]:input[value="${subject.stime}"]').attr("checked", true);
	})
</script>
<%
}
%>

<div class="form-group row">
	<label class="col-sm-2 control-label" style="margin-top: 5px">강사</label>

	<div class="col-sm-4" id="selectTeacher"></div>
</div>

<div class="form-group row">
	<label class="col-sm-2 control-label" style="margin-top: 5px">강의 내용</label>

	<div class="col-sm-8">
		<textarea id="content" name="content" type="text" class="form-control" placeholder="강의 내용"
		required><c:if test="${not empty subject }">${subject.content}</c:if></textarea>
	</div>
</div>

<script>
$(document).ready(function () {
	<%
	if(subject != null) {
	%>
		getTeacherList("${subject.ssort}");
	<%
	} else {
	%>
		getTeacherList("1");
	<% 
	}
	%>
	//getRoomList();
});

function getTeacherListOnChange() {
	getTeacherList($("#ssort").find(":selected").val());
}

function getTeacherList(ssort) {
	var url = "${ContextPath}/subject/getTeacherList";	
	var dataParam = { "ssort" : ssort };
	
	$.ajax({
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success: function(result) {	
			var htmls = '';
			
			if(result.length < 1){
				htmls += "강사님이 없습니다.";
			} else {
				htmls += '<select id="mid" name="mid" class="custom-select">';
				
				$(result).each(function(){
					
					htmls += '<option value="' + this.mid + '" ';
					
					<%
					if(subject != null) {
					%>
						if(this.mid == "${subject.mid}") {
							htmls += 'selected="selected"';
						}
					<%
					}
					%>
					
					htmls += '>' + this.mname + '</option>';
					
				});
				
				htmls += '</select>';
			}
			
			$('#selectTeacher').html(htmls);
			
		}, // success end
	
		error : function(){
			alert('ajax error');
		}
	}); // Ajax end
} // function getTeacherList end

</script>

<c:if test="${not empty subject }">
	<div class="form-group row">
		<label class="col-sm-2 control-label" style="margin-top: 5px">상태</label>

		<div class="input-group col-sm-8">
			<style>
				label.cb {
					margin-top : 8px;
					margin-right:10px;
					margin-left :10px;
				}
			</style>
						  		
			<label class="cb"><input type="radio" name="status" value="0" checked> 준비 </label>
			<label class="cb"><input type="radio" name="status" value="1" > 진행 </label>
			<label class="cb"><input type="radio" name="status" value="2" > 중지 </label>
		</div>
							
		<script>
			$(document).ready(function () {
				$('input:radio[name=status]:input[value="${subject.status}"]').attr("checked", true);
			})
		</script>
	</div>
</c:if>
