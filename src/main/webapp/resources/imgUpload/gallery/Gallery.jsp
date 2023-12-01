<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>활동사진 </title>

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
						<h1 class="h3 mb-0 text-gray-800">활동사진</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							활동사진입니다. 설명추가하고. 사진 변경하고. 위치바꾸기<a target="_blank"
								href="https://datatables.net">&nbsp;필요한 경우 링크걸기</a>.
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">활동사진</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!-- Page Content -->
									<div class="container">


										<div class="row text-center text-lg-left" align="center">
											<table>
												<tr>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/1.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/2.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/3.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/4.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td>
												</tr>
												<tr>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/5.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/6.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/7.jpg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/8.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td>
												</tr>
												<tr>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/9.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/10.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/11.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/12.jpeg"
														width="400" height="300">&nbsp;&nbsp;</td>
												</tr>
												<tr>

													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/13.jpg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/14.jpg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/16.jpg"
														width="400" height="300">&nbsp;&nbsp;</td>
													<td><img
														src="${ContextPath }/resources/imgUpload/gallery/17.PNG"
														width="400" height="300">&nbsp;&nbsp;</td>
												</tr>
											</table>


										</div>

									</div>
									<!-- /.container -->
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- End of Main Content -->

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

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>

</html>
