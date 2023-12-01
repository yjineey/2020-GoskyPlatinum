<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>과목정보확인</title>

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
			<div id="content">
				<!-- Topbar -->
				<c:import url="/WEB-INF/views/include/top.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">${subject.sname }</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							강의실은 상황에 따라 바뀔수 있습니다. 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">과목 정보 </h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
														<th>종목번호</th>
														<td>${act.ssno}</td>
														<th>종목이름</th>
														<td>${act.name}</td>
														<th>종목소개</th>
														<td>${act.intro}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>과목이름</th>
														<td>${subject.sname}</td>
														<th>수업시간</th>
														<td> <c:choose>
																<c:when test="${subject.stime eq 0}">
																오전
																</c:when>
																<c:otherwise>
																오후
																</c:otherwise>
														</c:choose> </td>
														<th>과목내용</th>
														<td>${subject.content}</td>
													</tr>
						
												</tbody>
											</table>
										
										
									</section>
								</div>
							</div>
						</div>
						
						
					
						
						
						
					<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">관련 정보 </h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
														<th>강사이름</th>
														<td>${member.mname}</td>
														<th>강사메일</th>
														<td>${member.memail}</td>
														<th>강사번호</th>
														<td>${member.number}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>강의실명</th>
														<td>${room.rname}</td>
														<th>강의실주소</th>
														<td>${room.address}</td>
														<th>강의실내용</th>
														<td>${room.content}</td>
													</tr>
						
												</tbody>
											</table>
										
										
									</section>
								</div>
							</div>
						</div>
						
						

				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>
</body>
<script>
	$('#write').on('click', function() {
		location.href = "${ContextPath}/PeopleAdd"
	})
</script>
</html>