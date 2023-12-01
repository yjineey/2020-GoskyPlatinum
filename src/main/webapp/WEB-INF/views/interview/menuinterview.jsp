<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

	
			<a href="sendinterview">
				<div class="card ${bg } text-white shadow">
					<div class="card-body">
						상담하기						
						<div class="text-white-50 small">원장에게</div>
					</div>
				</div>
			</a>
		
			
								
								
			
		<c:choose>
			<c:when test="${msort eq 'm03' }">
			<a href="receivedinterview">
					<div class="card ${bg } text-white shadow">
						<div class="card-body">						
							받은상담
							<div class="text-white-50 small">관리자만</div>
						</div>
					</div>
				</a>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
		
		
			
	
			
						
			
			
		
			<a href="sendinterviewlist">
				<div class="card ${bg } text-white shadow">
					<div class="card-body">
						상담내역
						<div class="text-white-50 small">내가쓴 상담</div>
					</div>
				</div>
			</a>
	
	
								
			
		
			<a href="delinterviewlist">
				<div class="card bg-dark text-white shadow">
					<div class="card-body">
						휴지통
					</div>
				</div>
			</a>	
	

						
								
		
			<a href="delinterview">
				<div class="card bg-dark text-white shadow">
					<div class="card-body">					
					휴지통 비우기
					</div>
				</div>
			</a>
		
						
