<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<script>
	// 생략	

	$(document).on('click', '#btnSearch', function(e) {

		e.preventDefault();

		var url = "${ContextPath}/searchmessagelist";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});
</script>


<div class="row">

	<div class="col-md-2">
		<select class="form-control col" name="searchType" id="searchType">
			<option value="title">제목검색</option>
			<option value="toid">작성자</option>
			<option value="content">내용</option>

		</select>
	</div>


	<div class="col-md-4">
		<form
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-7 my-7 my-md-100 mw-0 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-skyblue border-0 small"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2" name="keyword" id="keyword">
				<div class="input-group-append">
					<button class="btn btn-dark" type="button" name="btnSearch"
						id="btnSearch">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	</div>



</div>


