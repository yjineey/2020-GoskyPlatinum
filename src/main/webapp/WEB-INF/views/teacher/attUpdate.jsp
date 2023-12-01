<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>출결정보수정</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

table tr td {
	border: 1px solid #ccc;
	padding: 3px;
}
</style>
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
						<h1 class="h3 mb-0 text-gray-800">회원출결수정</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">


						
						<c:import url="/WEB-INF/views/teacher/include/att.jsp" />
						

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
				</div>
			</div>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>
<script>
	$('#teacheradd').on('click', function() {
		location.href = "${ContextPath}/SubjectAdd"
	});
</script>
</html>