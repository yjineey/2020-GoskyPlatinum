<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출결 확인2</title>
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
						<h1 class="h3 mb-0 text-gray-800">출결 확인</h1>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							강사에게 보여지는 출결확인 입니다 <a target="_blank"
								href="https://datatables.net">필요한 경우 링크걸기</a>.
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">출결 확인</h6>

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<body class="bg-gradient-white">
										<div class="container" >
											<form action="${ContextPath }/checkAttend" method="post">
												<div class="form-group">
													<input type="hidden" class="form-control form-control-user"
														id="ano" name="ano" maxlength="30" value="${ano}">
												</div>
												<div class="form-group">
													시간 <input type="text"
														class="form-control form-control-user" id="adate"
														name="adate" maxlength="30" style="width:800px; height:40px; "value="${time}" readonly
														required>
												</div>

												<div class="form-group">
													사유 <input type="text"
														class="form-control form-control-user" id="acontent"
														name="acontent"style="width:800px; height:40px;" placeholder="사유를 입력해주세요" maxlength="30"
														required>
												</div>

												<input type="submit" class="btn btn-primary" style="text-align:center; width:800px; height:40px;"
													value="출석하기">

											</form>
										</div>
									</body>
								</div>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>
<script>
	$('.btn-primary').on('click', function() {
		alert("출석되었습니다")
		location.href = "attendTeacher"
	})
</script>

</html>