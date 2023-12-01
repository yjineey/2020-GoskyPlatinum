<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="ContextPath" value="${pageContext.request.contextPath}" />
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
<title>Insert title here</title>
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
						<h1 class="h3 mb-0 text-gray-800">${att.number} 님 활동내역</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							${att.number} 님의 활동정보 입니다. 자세한 사항은 ###-#### 연락바랍니다 <a target="_blank" href="#"></a>.
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">${att.number} 님 세부사항</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div class="form-group row">
										<div class="col-sm-2">
										</div>
									</div>
									<div class="card-body">
										<table class="table table-bordered table-hover" id="dataTable"
											style="text-align: center; vertical-align: middle">
											<colgroup>
														<col width="8%" />
														<col width="8%" />
														<col width="7%" />
														<col width="15%" />
														<col width="10%" />
														<col width="7%" />
														<col width="7%" />
														<col width="10%" />
														<col width="7%" />
														<col width="10%" />
													</colgroup>

											<thead class="thead-dark">
												<tr>
													<th>날짜</th>
														<th>이름</th>
														<th>출결</th>
														<th>출결내용</th>
														<th>출결시간</th>
														<th>오전과목</th>
														<th>오전상태</th>
														<th>오후과목</th>
														<th>오후상태</th>
												</tr>
											</thead>
											<tbody>
														<tr>
															<td>${att.date}</td>
															<td>${att.number}</td>
															<td>${att.att }</td>
															<td>${att.acontent }</td>
															<td>${att.adate }</td>
															<td>${att.befor }</td>
															<td>${att.beforcon }</td>
															<td>${att.after }</td>
															<td>${att.aftercon }</td>
														</tr>
													</tbody>
											<tbody id="actList"></tbody>
												</table>
												<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>
</html>