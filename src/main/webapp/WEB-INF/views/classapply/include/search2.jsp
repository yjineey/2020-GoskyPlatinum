<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<div class="form-group row" >
		<div class="col-sm-2">
			<select id="selectStatus" class="custom-select" onchange="showClassApplyList(1)">
				<option value="n" selected>::: 상태 :::</option>
				<option value="a">수강 신청</option>
				<option value="p">결제 완료</option>
				<option value="l">수강 중</option>
				<option value="c">취소</option>
			</select>
		</div>
		
		<div class="col-sm-2" align="left">
			<select id="selectPeople" class="custom-select" onchange="showClassApplyList(1)">
				<c:forEach var="plist" items="${plist}">
					<option value="${plist.pno}" selected  value="${plist.pno}">${plist.pname}(${plist.pinfo})</option>
				</c:forEach>
			</select>
		</div>
	
		
	</div>

</div>

