<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>



<!-- Nav Item - User Information -->
<li class="nav-item dropdown no-arrow">
	
	<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" 
		data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
		
		<span class="mr-2 d-none d-lg-inline text-gray-600 small">${userName }</span> 
		<img class="img-profile rounded-circle" src="${userImg }" width="60" height="60">
	</a> 
	
	<!-- Dropdown - User Information -->
	<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"	aria-labelledby="userDropdown">
		
		<a class="dropdown-item" href="${ContextPath}/MypageInfoUpdate?mid=${userID}"> 
			<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
		</a> 
		
		<a class="dropdown-item" href="${ContextPath }/receivedinterview"> 
			<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 나의 상담
		</a>
		
		<div class="dropdown-divider"></div>
		
		<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
			<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
		</a>
	</div>
	
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">현재 세션을 종료할 준비가 되면 아래에서 "로그아웃"을 선택하십시오.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="${ContextPath }/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
</li>