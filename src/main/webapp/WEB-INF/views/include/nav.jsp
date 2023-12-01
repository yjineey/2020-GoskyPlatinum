<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!-- Sidebar -->
<ul	class="navbar-nav sidebar sidebar-dark accordion ${empty bg ? 'bg-warning' : bg } " 
		 id="accordionSidebar">

	<c:import url="/WEB-INF/views/include/nav/logo.jsp" />

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link">
			<i class="fas fa-fw fa-tachometer-alt"></i> 
			<span>
				<c:out value="${msort eq 'm03' ? '관리자' : msort eq 'm02' ? '강사' : msort eq 'm01' ? '회원' :'비회원' }" />
			</span>
		</a>
	</li>

			

			<hr class="sidebar-divider">
			<c:import url="/WEB-INF/views/include/nav/basic-menu.jsp" />	
			
		
 	<c:choose>
		<c:when test="${msort eq 'm03' }">
				<hr class="sidebar-divider">
				<c:import url="/WEB-INF/views/include/nav/admin-menu.jsp" />			
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>

 
	 <c:choose>
		 <c:when test="${msort eq 'm02' || msort eq 'm03'}">
		 		<hr class="sidebar-divider">
				<c:import url="/WEB-INF/views/include/nav/teacher-menu.jsp" />
		 </c:when>
		 <c:otherwise>
		 </c:otherwise>
	 </c:choose>
	<!-- Divider -->
	
	<c:choose>
		<c:when test="${msort eq 'm01'|| msort eq 'm02' || msort eq 'm03'}">
				<hr class="sidebar-divider">
				<c:import url="/WEB-INF/views/include/nav/user-menu.jsp" />	
			
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<!-- Divider -->
	
	<!-- Divider -->
	<!-- Divider -->
	<hr class="sidebar-divider">

</ul>
<!-- End of Sidebar -->