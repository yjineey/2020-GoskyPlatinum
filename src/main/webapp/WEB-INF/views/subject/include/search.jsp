<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<div class="form-group row" >
		<div class="col-sm-2">
			<select id="selectStatus" class="custom-select" onchange="showSubjectList(1)">
				<option value="n" selected>::: 상태 :::</option>
				<option value="r">준비 중</option>
				<option value="o">진행 중</option>
				<option value="x">진행 중지</option>
			</select>
		</div>
		
		<div class="col-sm-2">
			<select id="selectTime" class="custom-select" onchange="showSubjectList(1)">
				<option value="n" selected>::: 시간 :::</option>
				<option value="a">오전</option>
				<option value="p">오후</option>
			</select>
		</div>
		
		<div class="col-sm-6">
			<div class="input-group">
				<div class="col-sm-3">
					<select id="selectSearchType" class="custom-select" >
						<option value="n" selected>::: 검색 :::</option>
						<option value="t">종목 이름</option>
						<option value="r">강의 제목</option>
						<option value="tn">강사 이름</option>
					</select>
				</div>
			
				<div class="col-sm-7">
					<input type="text" class="form-control" id="keywordInput" placeholder="Search for..." 
						onkeyup="javascript:if (event.keyCode == 13) showSubjectList(1);"> 
				</div>
				
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-flat" >
						<i class="fa fa-search"></i> 검색
					</button>
				</div>
			</div>
			
		</div>
		
		<div class="col-sm-2" align="right" id="writeButton">
			<input class="btn btn-success" type="button" value="강의 등록" id="registSubject"/>
			
			<script>
			$("#registSubject").click(function () {
				location.href="${ContextPath }/subject/regist";
			});
			
			$(".btn-primary").click(function () {
				showSubjectList(1);
			})
			</script>
		</div>
	</div>

</div>

