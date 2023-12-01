<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<div class="form-group row" >
		<div class="col-sm-2">
			<select id="selectStatus" class="custom-select" onchange="showList(1)">
				<option value="n" selected>::: 상태 :::</option>
				<option value="a">수강 신청</option>
				<option value="l">수강 중</option>
				<option value="c">취소</option>
			</select>
		</div>
		
		<div class="col-sm-8">
			<div class="input-group">
				<div class="col-sm-3">
					<select id="selectSearchType" class="custom-select" >
						<option value="n" selected>::: 검색 :::</option>
						<option value="m">회원 이름</option>
						<option value="s">학생 이름</option>
					</select>
				</div>
			
				<div class="col-sm-7">
					<input type="text" class="form-control" id="keywordInput" placeholder="Search for..." 
						onkeyup="javascript:if (event.keyCode == 13) showList(1);"> 
				</div>
				
				<div class="col-sm-2">
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

