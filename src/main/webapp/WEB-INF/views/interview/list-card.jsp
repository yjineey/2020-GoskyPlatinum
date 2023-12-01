
			
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>

</head>

<body id="page-top">
	

					  	<!-- 리스트 테이블  -->									
						 <div class="table-responsive">
							 <table class="table">
								  <tr>
								  	<td>선택</td>
								  	<td>상담번호</td>
								  	<td>제목</td>
								  	<td>작성자</td>
								  	<td>작성날짜</td>
								  	
								  </tr>
								  
								<c:forEach var="message" items="${list}">
								 	<tr>
									<td>
			 							<div class="radio">
  											<label>
   												 <input type="radio" name="blankRadio" id="blankRadio1" value="${message.msno }" aria-label="...">
 				 							</label>
										</div>
									</td>
								 	<td>${message.msno}</td>
								 	<td><a href="interviewdetail?msno=${message.msno}"> ${message.title} </a></td>
								 	<td>${message.toid}</td>
								 	<td>${message.regdate}</td>
								 </tr>
								</c:forEach>
							 </table>
							</div>	
	
	

	
</body>
</html>