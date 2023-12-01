<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Heading -->
<a class="sidebar-heading collapsed" href="#collapseAdmin" data-toggle="collapse" aria-expanded="true" aria-controls="collapseAdmin"> 
	<span class="mr-2 d-none d-lg-inline">관리자 메뉴[admin]</span>
</a>

<div id="collapseAdmin" class="collapse show" >
	<ul class="navbar-nav" >

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagementAttendance" aria-expanded="true" aria-controls="collapseAdmin"> 
				<i class="fas fa-fw fa-school"></i> <span>출결관리</span>
			</a>
			
			<div id="collapseManagementAttendance" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/attendance/list">출결 현황</a> 
				</div>
			</div>
		</li>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagementClass" aria-expanded="true" aria-controls="collapseAdmin"> 
				<i class="fas fa-fw fa-school"></i> <span>수업관리</span>
			</a>
			
			<div id="collapseManagementClass" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/act/list">종목 현황</a> 
					<a class="collapse-item" href="${ContextPath }/subject/list">강의 현황</a>
					<a class="collapse-item" href="${ContextPath }/classApply/list">수강 신청 현황</a>
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagementStudent" aria-expanded="true" aria-controls="collapseAdmin"> 
				<i class="fas fa-fw fa-user-cog"></i> <span>회원관리</span>
			</a>
			
			<div id="collapseManagementStudent" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/signup/mform">회원등록</a> 
					<a class="collapse-item" href="${ContextPath }/mPeopleAdd">USER 등록</a> 
					<a class="collapse-item" href="${ContextPath }/MemberSearch">회원리스트</a> 
					<a class="collapse-item" href="${ContextPath }/UserSearch">USER 리스트</a> 
				
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagementTeacher" aria-expanded="true" aria-controls="collapseAdmin"> 
				<i class="fas fa-fw fa-user-cog"></i> <span>강사관리</span>
			</a>
			
			<div id="collapseManagementTeacher" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/MworkList">업무 지시</a> 
					<a class="collapse-item" href="${ContextPath }/TeacherSearch">강사리스트</a> 
					<a class="collapse-item" href="${ContextPath }/TeacherRequestSearch">강사요청리스트</a> 
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagementRoom" aria-expanded="true" aria-controls="collapseAdmin"> 
				<i class="fas fa-fw fa-store-alt"></i> <span>강의실관리</span>
			</a>
			
			<div id="collapseManagementRoom" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/AddRoom">강의실 등록</a> 
					<a class="collapse-item" href="${ContextPath }/RoomList">강의실 리스트</a> 
				</div>
			</div>
		</li>
		
	</ul>
</div>