<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<a href="sendmessage">
	<div class="card ${bg } text-white shadow">
		<div class="card-body">
			메세지 작성
			<div class="text-white-50 small"></div>
		</div>
	</div>
</a>

<a href="receivedmessagelist">
	<div class="card ${bg } text-white shadow">
		<div class="card-body">
			받은 메세지함
			<div class="text-white-50 small"></div>
		</div>
	</div>
</a>

<a href="sendmessagelist">
	<div class="card ${bg } text-white shadow">
		<div class="card-body">
			보낸 메시지함
			<div class="text-white-50 small"></div>
		</div>
	</div>
</a>

<a href="delmessagelist">
	<div class="card bg-dark text-white shadow">
		<div class="card-body">휴지통</div>
	</div>
</a>

<a href="emptymessage">
	<div class="card bg-dark text-white shadow">
		<div class="card-body">휴지통 비우기</div>
	</div>
</a>
