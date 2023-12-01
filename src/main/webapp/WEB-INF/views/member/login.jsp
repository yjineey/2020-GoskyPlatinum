<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>Login</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<script type="text/javascript">
	function login() {
		if(check()) {
			return true;
		}
		
		alert("ID 또는 Password가 틀렸습니다.");
		return false;
	}
	
	function check() {
		var url = "${ContextPath}/login/checkIdAndPassword";
		var paramData = {"mid" : $("#id").val(), "mpw" : $("#pw").val() };

		var res;
		
		$.ajax({
			type: 'POST',
			url: url,
			data: paramData,
			dataType: 'json',
			
			async : false,
			
			success : function (result) {
				res = result;
			},
		
			error : function () {
				alert('error');
			}
		});
		
		return res;
	}
</script>
</head>

<body class="bg-gradient-success">
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-6 col-lg-6 col-md-6">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-12">
								<div class="p-5">
								
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">GoSky에 오신 것을 환영합니다 !!</h1>
									</div>
									
									<form class="user" onsubmit="return login();" action="${ContextPath }/login/action" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="id" name="mid" placeholder="아이디를 입력해주세요" maxlength="20" required>
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="pw" name="mpw" placeholder="비밀번호를 입력해주세요" maxlength="30" required>
										</div>
										
										<div style="margin-top:40px;"></div>
										
										<input type="submit"
											class="btn btn-primary btn-user btn-block" value="로그인">
										<div style="margin-top:40px;"></div>
										
									</form>
									
									<hr>
									<form class="user">
										<button class="btn btn-kakao btn-user btn-block">
											<i class="fa fa-comment fa-fw"></i> 카카오 로그인
										</button>
										
										<button class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> 구글 로그인
										</button> 
											
										<button class="btn btn-naver btn-user btn-block">
											<strong>N</strong> 네이버 로그인
										</button>
										
										<script type="text/javascript">
											$(function (){
												$(".btn-kakao").click(function () {
													var url = "${ContextPath}/login/getUrl";	
													var dataParam = {"key" : "kakao"};
													
													$.ajax({
														type: 'GET',
														url: url,
														data: dataParam,
														dataType: 'json',

														success: function(result) {	
															location.href = "https://kauth.kakao.com/oauth/authorize"															
															+ "?client_id=" + result.client_id
															+ "&redirect_uri=" + result.redirect_uri
															+ "&response_type=code";
														},
													
														error : function(){
															alert('ajax error');
														}
													});	// Ajax end
												});
												
												$(".btn-google").click(function () {
													var url = "${ContextPath}/login/getUrl";	
													var dataParam = {"key" : "google"};
													
													$.ajax({
														type: 'GET',
														url: url,
														data: dataParam,
														dataType: 'json',

														success: function(result) {	
															location.href = "https://accounts.google.com/o/oauth2/v2/auth"
																+ "?scope=https://www.googleapis.com/auth/drive.metadata.readonly"
																+ "&access_type=offline&include_granted_scopes=true"
																+ "&response_type=code&state=state_parameter_passthrough_value"
																+ "&redirect_uri=" + result.redirect_uri
																+ "&client_id=" + result.client_id;
														},
														
														error : function(){
															alert('ajax error');
														}
													});	// Ajax end
												});
												
												$(".btn-naver").click(function () {
													var url = "${ContextPath}/login/getUrl";	
													var dataParam = {"key" : "naver"};
													
													$.ajax({
														type: 'GET',
														url: url,
														data: dataParam,
														dataType: 'json',

														success: function(result) {	
															location.href = "https://nid.naver.com/oauth2.0/authorize"
																+ "?response_type=code&state=state_parameter_passthrough_value"
																+ "&redirect_uri=" + result.redirect_uri
																+ "&client_id=" + result.client_id;
														},
														
														error : function(){
															alert('ajax error');
														}
													});	// Ajax end
												});
											})
										</script>
									</form>
									<hr>
	                           <div class="text-center">
	                              <a class="small" id ="findpw" href="${ContextPath }/login/findpw">비밀번호 찾기</a>		&nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
	                              <a class="small" href="${ContextPath }/signup/form">일반 회원가입</a> &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;
	                              <a class="small" href="${ContextPath }/TeacherAdd">강사 회원가입</a>
	                           </div>
	
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>