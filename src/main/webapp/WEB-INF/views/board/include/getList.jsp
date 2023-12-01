<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="table-responsive" >
	<div class="card-body">
		<table class="table table-bordered table-hover" id="dataTable" style="text-align: center">
			<colgroup>
				<col width="10%" />
				<col width="40%" />
				<col width="10%" />
				<col width="30%" />
				<col width="10%" />
			</colgroup>
			<thead class="thead-dark">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="list" items="${list }">
							<tr>
								<td>${list.bno}</td>
								<td>
									<a href="${ContextPath}/board/view${pageMaker.makeSearch(bsort, pageMaker.paging.page)}&bno=${list.bno}">${list.btitle}</a>
									<c:if test="${list.rcnt ne 0 }">[${list.rcnt }]</c:if>
								</td>
								<td>${list.mname}</td>
								<td>${list.regdate}</td>
								<td><span class="badge">${list.readcnt}</span></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan="5">데이터가 존재하지 않습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.front}">
					<li class="page-item">
						<a class="page-link"href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, 1)}">
						<i class="fas fa-angle-double-left"></i></a>
					</li>
				</c:if>
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, pageMaker.startPage - 1)}"><i class="fas fa-angle-left"></i></a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<c:choose>
						<c:when test="${pageMaker.paging.page == idx}">
							<li class="page-item active" ><a class="page-link" 
								href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, idx)}">${idx}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item" ><a class="page-link" 
								href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, idx)}">${idx}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, pageMaker.endPage + 1)}"><i class="fas fa-angle-right"></i></a></li>
				</c:if>
				<c:if test="${pageMaker.last && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, pageMaker.lastPage)}"><i class="fas fa-angle-double-right"></i></a></li>
				</c:if>
			</ul>
		</nav>
		
	</div>
</div>