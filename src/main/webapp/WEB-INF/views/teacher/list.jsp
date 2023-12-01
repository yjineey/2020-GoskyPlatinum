<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>출석 현황</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
</head>

<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="/WEB-INF/views/include/nav.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="main-content">
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				
				<!-- Begin Page Content -->
				<div class="container-fluid">
				
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
				
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">출석 현황</h6>
						</div>
				
						<div class="card-body">
							<div class="table-responsive">

								<c:import url="/WEB-INF/views/teacher/include/date.jsp" />
								
								
								
								<table class="table table-bordered table-hover" id="dataTable" style="text-align: center; vertical-align: middle">
								<colgroup><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="40%" /></colgroup>
								
								<thead class="thead-dark">
								<tr>
									<th>출석 번호</th>
									<th>날짜</th>
									<th>회원이름</th>
									<th>출결 상태</th>
									
									<c:choose>
										<c:when test="${status eq 0 }">
											<th>오전과목</th>
											<th>오전상태</th>
										</c:when>
										<c:otherwise>
											<th>오후과목</th>
											<th>오후상태</th>
										</c:otherwise>									
									</c:choose>
									
								</tr>
								</thead>
									
							<c:forEach var="list" items="${alist}">
								<tr align="center">
									<td>
								<a href="attUpdate?ano=${list.ano}&status=${status}">
									${list.ano }</a></td>									
									<td>${list.date }</td>									
									<td>${list.pname }</td>									
								
									<c:choose>
										<c:when test="${status eq 0 }">
											<c:if test="${list.att eq 3 }">
												<th>출석</th>
											</c:if>
											<c:if test="${list.att eq 1 }">
												<th>지각</th>
											</c:if>
											<c:if test="${list.att eq 2 }">
												<th>조퇴</th>
											</c:if>
												<c:if test="${list.att eq 4 }">
												<th>공결</th>
											</c:if>
											<c:if test="${list.att eq 0 }">
												<th>결석</th>
											</c:if>
											<td>${list.befor }</td>
											<th>${list.beforcon }</th>
										</c:when>
										<c:otherwise>
											<c:if test="${list.att eq 3 }">
												<th>출석</th>
											</c:if>
											<c:if test="${list.att eq 1 }">
												<th>지각</th>
											</c:if>
											<c:if test="${list.att eq 2 }">
												<th>조퇴</th>
											</c:if>
												<c:if test="${list.att eq 4 }">
												<th>공결</th>
											</c:if>
											<c:if test="${list.att eq 0 }">
												<th>결석</th>
											</c:if>
												<th>${list.after }</th>
												<th>${list.aftercon }</th>
										</c:otherwise>									
									</c:choose>
								</tr>
								
							</c:forEach>
								
								
								
								
								
								
								</table>
								
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
</body>
</html>