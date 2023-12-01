<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
</script>
</head>

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
										<h3 class="h4 text-gray-900 mb-4">아이디/비밀번호 찾기</h3>
									</div>
									<div class="full">
										<div class="container">
											<div class="area_inputs wow fadeIn">
												<div class="sub_title font-weight-bold text-black"></div>
												<div style="margin-bottom: 10px;"
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" class="custom-control-input"
														id="search_1" name="search_total"
														onclick="search_check(1)" checked="checked"> <label
														class="custom-control-label font-weight-bold text-black"
														for="search_1">아이디 찾기</label>
												</div>
												<div
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" class="custom-control-input"
														id="search_2" name="search_total"
														onclick="search_check(2)"> <label
														class="custom-control-label font-weight-bold text-black"
														for="search_2">비밀번호 찾기</label>
												</div>
												<form class="searchI" id="searchI" method="post"
													action="${ContextPath }/login/findId">
													<div class="form-group">

														<div>
															<input type="text" class="form-control" id="mname"
																name="mname" placeholder="이름을 입력해주세요">
														</div>
													</div>
													<div class="form-group">

														<div>
															<input type="text" class="form-control" id="memail"
																name="memail" placeholder="이메일을 입력해주세요">
														</div>
													</div>
													<div class="form-group">
														<button id="searchBtn" type="button"
															class="btn btn-primary btn-block">확인</button>
														<a class="btn btn-danger btn-block"
															href="${pageContext.request.contextPath}">취소</a>
													</div>
												</form>

												<form class="searchP" id="searchP" method="post"
													style="display: none;">

													<div class="form-group">

														<div>
															<input type="text" class="form-control" id="mid"
																name="mid" placeholder="아이디를 입력해주세요">
														</div>
														</div>
														<div class="form-group">

															<div>
																<input type="text" class="form-control" id="memail2"
																	name="memail2" placeholder="이메일을 입력해주세요">
															</div>
														</div>
														<div class="form-group">
															<button id="searchBtn2" type="button"
																class="btn btn-primary btn-block">확인</button>
															<a class="btn btn-danger btn-block" id="cancle"
																href="${pageContext.request.contextPath}">취소</a>
														</div>
												
												</form>


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

<script type="text/javascript">
	$('#searchBtn').on("click", function() {
		var url = "${ContextPath}/login/findId";
		var Data = {
			"mname" : $("#mname").val(),
			"memail" : $("#memail").val(),

		};
		
		$.ajax({
			type : 'POST',
			url : url,
			data : Data,

			success : function(result) {
				alert("정보가 일치합니다");
				location.href = "${ContextPath}/login/findId2";

			},

			error : function(e) {
				alert("정보가 일치하지 않습니다");
			}
		});
	});
</script>

<script type="text/javascript">
	$('#searchBtn2').on("click", function() {
		var url = "${ContextPath}/login/findpw";
		var Data = {

			"mid" : $("#mid").val(),
			"memail" : $("#memail2").val(),
		};

		$.ajax({
			type : 'POST',
			url : url,
			data : Data,

			success : function(result) {
				alert("정보가 일치합니다");
				location.href = "${ContextPath}/login/resetPw";

			},

			error : function(e) {
				alert("정보가 일치하지 않습니다");

			}
		});
	});
</script>
</html>