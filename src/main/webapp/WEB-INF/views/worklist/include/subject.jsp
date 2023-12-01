<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">담당과목</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<section class="content">
				<c:choose>
					<c:when test="${fn:length(subject) > 0}">
						<c:forEach var="subject" items="${subject }">

							<form role="form" method="post"
								action="${ContextPath}/SubjectUpdate?sno=${subject.sno}">
								<table class="table table-bordered" id="dataTable">
									<tbody>
										<tr>
											<th>과목코드</th>
											<td>${subject.sno}</td>
											<th>과목명</th>
											<td>${subject.sname}</td>
											<th>수업내용</th>
											<td>${subject.content}</td>
										</tr>
										<tr>
											<th>시작시간</th>
											<td>
											<c:if test="${subject.stime == 0}">오전</c:if> 
											<c:if test="${subject.stime == 1}">오후</c:if> 
											</td>
											<th>강사</th>
											<td>${member.mname}</td>
											<th>상태</th>
											<td>
											<c:if test="${subject.status == 0}">준비중</c:if> 
											<c:if test="${subject.status == 1}">진행중</c:if> 
											<c:if test="${subject.status == 2}">진행중지</c:if> 
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td>등록된 과목이 없습니다. 과목을 추가해주세요</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</section>
		</div>
	</div>
</div>
