<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Heading -->
<a class="sidebar-heading collapsed" href="#collapseBasic" data-toggle="collapse" aria-expanded="true" aria-controls="collapseBasic"> 
	<span class="mr-2 d-none d-lg-inline">비회원 메뉴</span>
</a>

<div id="collapseBasic" class="collapse show" >
	<ul class="navbar-nav" >

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAcademyInfo"
				aria-expanded="true" aria-controls="collapseBasic"> 
				<i class="fas fa-fw fa-info"></i> <span>학원 소개</span>
			</a>
			
			<div id="collapseAcademyInfo" class="collapse" >
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="${ContextPath }/Greeting">인사말</a>
					<a class="collapse-item" href="${ContextPath }/SIntroForm">과목 소개</a> 
					<a class="collapse-item" href="${ContextPath }/TIntroForm">강사 소개</a>
					<a class="collapse-item" href="${ContextPath }/Map">오시는 길</a>
					<a class="collapse-item" href="${ContextPath }/Gallery">갤러리</a>
				</div>
			</div>
		</li>

	</ul>

</div>