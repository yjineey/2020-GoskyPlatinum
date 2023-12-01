<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!-- 강사정보 -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">출결정보</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<section class="content">
				<form role="form" method="post"
					action="${ContextPath}/attUpdate?ano=${att.ano}&status=${status}">
					<table class="table table-bordered" id="dataTable">
						<tr align="center">
							<td>출석번호:</td>
							<td>${att.ano }</td>
						</tr>
						<tr>
							<td>회원번호</td>
							<td>${att.number }</td>
						</tr>
						<c:choose>
								<c:when test="${status eq 0 }">
								<tr>
									<td>오전과목:</td>
									<td>${att.befor }</td>
								</tr>
								<tr>			
									<td>오전상태:</td>
									<td>
									<input type="text" name="beforcon" value="${att.beforcon}"> </td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>오후과목:</td>
									<td>${att.after }</td>
								</tr>
								<tr>			
									<td>오후상태:</td>
									<td>
									<input type="text" name="aftercon" value="${att.aftercon}"> </td>
								</tr>		
							</c:otherwise>
						</c:choose>
						
					</table>
					<div class="box-footer" align="center">
						<button type="submit" class="btn btn-primary">출결저장하기</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>