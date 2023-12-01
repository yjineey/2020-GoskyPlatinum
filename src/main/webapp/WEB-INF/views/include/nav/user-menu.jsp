<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Heading -->
<a class="sidebar-heading collapsed" href="#collapseUser" data-toggle="collapse" aria-expanded="true" aria-controls="collapseUser"> 
	<span class="mr-2 d-none d-lg-inline">회원 메뉴</span>
</a>

<div id="collapseUser" class="collapse show" >
	<ul class="navbar-nav" >

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRegisterClass" aria-expanded="true" aria-controls="collapseUser"> 
				<i class="fas fa-fw fa-futbol"></i> <span>수강 신청</span>
			</a>
			
			<div id="collapseRegisterClass" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/classlist">수업 일정</a> 
					<a class="collapse-item" href="${ContextPath }/classapply">수강 신청</a>
					<a class="collapse-item" href="${ContextPath }/classApply/list2">수강신청현황</a>
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTimeTable" aria-expanded="true" aria-controls="collapseUser"> 
				<i class="fas fa-fw fa-calendar"></i> <span>수업 확인</span>
			</a>
			
			<div id="collapseTimeTable" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/viewAttend">수업 내용 확인</a> 
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoard" aria-expanded="true" aria-controls="collapseUser"> 
				<i class="fas fa-fw fa-edit"></i> <span>게시판</span>
			</a>
			
			<div id="collapseBoard" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/board/list?bsort=b01">공지 사항</a>
					<a class="collapse-item" href="${ContextPath }/board/list?bsort=b02">건의 사항</a>
					<a class="collapse-item" href="${ContextPath }/board/list?bsort=b03">질문 게시판</a>
					<a class="collapse-item" href="${ContextPath }/board/list?bsort=b04">자유 게시판</a>
					<a class="collapse-item" href="${ContextPath }/board/list?bsort=b05">수강 후기</a>
					
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCommunity" aria-expanded="true" aria-controls="collapseUser"> 
				<i class="fas fa-fw fa-envelope"></i> <span>커뮤니티</span>
			</a>
			
			<div id="collapseCommunity" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/receivedinterview">나의 상담</a> 
					<a class="collapse-item" href="${ContextPath }/receivedmessagelist">나의 메세지함</a> 
				</div>
			</div>
		</li>
	
	</ul>
</div>