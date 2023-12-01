<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
</head>
<body>
<body class="bg-gradient-white">
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center" align="center">

			<div class="col-xl-6 col-lg-6 col-md-6">


				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">

						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12">
								<div class="p-5">

									<div class="text-center">
										<div class="container-login100">
											<div class="wrap-login100 p-t-50 p-b-90">

												<h3 class="h4 text-gray-900 mb-4">아이디/비밀번호 찾기</h3>
												<br>
												<h4 class="h4 text-gray-900 mb-4">귀하의 아이디는</h4>

												<div class="wrap-input100 validate-input m-b-16">
													<h3>"${mid }" 입니다.</h3>
												</div>
												<br>
												<br>


												<div class="container-login100-form-btn m-t-17">
													<button id="login" type="button"
														class="btn btn-primary btn-block">로그인 하기</button>
													<button id="findpw" type="button"
														class="btn btn-danger btn-block">비밀번호를 찾으시겠습니까?</button>
												</div>

											</div>
										</div>
									</div>
								</div>


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
	$('#login').on('click', function() {
		location.href = "${ContextPath}/login/form"

	});
	$('#findpw').on('click', function() {
		location.href = "${ContextPath}/login/findpw"

	});
</script>
</html>

