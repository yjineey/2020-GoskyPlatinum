<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		
		<c:choose>
			<c:when test="${empty userID }">
				<style>
					a.login-tag:hover {
						text-decoration: none;
						font-weight: bolder;
					}
				</style>
			
				<a class="login-tag" href="${ContextPath }/login/form">
					<span class="mr-2 d-none d-lg-inline text-gray-600 large">로그인</span> 
				</a>
			</c:when>
			
			<c:otherwise>
				
				<c:import url="/WEB-INF/views/include/top/message.jsp"/>
				<div class="topbar-divider d-none d-sm-block"></div>
				<c:import url="/WEB-INF/views/include/top/user.jsp"/>
			</c:otherwise>
			
		</c:choose>
		
		

	</ul>

</nav>
<!-- End of Topbar -->