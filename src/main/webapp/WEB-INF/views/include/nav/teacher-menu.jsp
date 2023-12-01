<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Heading -->
<a class="sidebar-heading collapsed" href="#collapseTeacher" data-toggle="collapse" aria-expanded="true" aria-controls="collapseTeacher"> 
	<span class="mr-2 d-none d-lg-inline">강사 메뉴</span>
</a>

<div id="collapseTeacher" class="collapse show" >
	<ul class="navbar-nav" >

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTeacherWork" aria-expanded="true" aria-controls="collapseTeacher"> 
				<i class="fas fa-fw fa-chalkboard-teacher"></i> <span>강사 업무</span>
			</a>
			
			
			<div id="collapseTeacherWork" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/WorkList">나의 업무 리스트</a>
					<a class="collapse-item" href="${ContextPath }/Clist">나의 수업</a> 
					<a class="collapse-item" href="${ContextPath }/attendTeacher">출석하기</a> 
					<a class="collapse-item" href="${ContextPath }/TeacherInfoUpdate">강사정보수정</a>
				</div>
			</div>
		</li>
		
	</ul>
</div>