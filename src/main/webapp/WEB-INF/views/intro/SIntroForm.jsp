<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>과목 소개</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
</head>
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
				<div>
					<class="d-sm-flexalign-items-centerjustify-content-betweenmb-4">
					<h1 class="h3 mb-0 text-gray-800">과목 소개</h1>
				</div>

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">과목 소개</h6>
						</div>
						<div class="card-body">

							<table class="table table-bordered table-hover" id="dataTable"
								style="text-align: center; vertical-align: middle">
								<colgroup>
								
									<col width="20%" />
									<col width="10%" />
									<col width="45%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>

								<thead class="thead-dark">
									<tr>
										<th></th>
										<th>종목 이름</th>
										<th>소개</th>
										<th>강의실</th>
									</tr>
								</thead>

								<tbody>
									<c:set var="status" value="status" scope="session" />

									<c:choose>
										<c:when test="${list != null}">
											<c:forEach var="list" items="${list}">
												
													
													<td><img src="${list.img}" width=200 height=200></td>
													<td>${list.name}</td>
													<td>${list.intro}</td>
													<td>${list.room}</td>
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
						</div>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>