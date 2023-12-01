<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<div class="form-group row" >
		<div class="col-sm-2">
			<select id="selectType" class="custom-select" onchange="showList(1)">
				<option value="t" selected>강사</option>
				<option value="p">회원</option>
			</select>
		</div>
		
		<div class="col-sm-2">
			<select id="selectStatus" class="custom-select" onchange="showList(1)">
				<option value="n" selected>::: 출결 여부 :::</option>
				<option value="a">출석</option>
				<option value="l">지각</option>
				<option value="e">조퇴</option>
				<option value="x">결석</option>
				<option value="p">공결</option>
			</select>
		</div>
		
		<div class="col-sm-8" >
			<div class="input-group col-sm-8" >
				<div class="col-sm-8">
					<input type="text" class="form-control" id="keywordInput" placeholder="이름 검색" 
						onkeyup="javascript:if (event.keyCode == 13) showList(1);"> 
				</div>
				
				<div class="col-sm-4">
					<button type="button" class="btn btn-primary btn-flat" >
						<i class="fa fa-search"></i> 검색
					</button>
					
					<script>
					$(".btn-primary").click(function () {
						showList(1);
					})
					</script>
				</div>
			</div>
			
		</div>
		
	</div>

</div>

