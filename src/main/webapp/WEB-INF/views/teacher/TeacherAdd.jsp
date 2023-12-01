<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<%
	boolean cid = false;
	boolean cname = false;
	boolean cemail = false;
	boolean cpw	= false;
	boolean cpw2 = false;
%>

<html>
<head>
<title>Sign Up</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<style>
	.ox{
		text-align:center;
		padding-top: 13px
	}
</style>

<script type="text/javascript">
	function checkRE(re, str){
		if(re.test(str.value))
			return true;
		return false;
	}

	function printIcon(check, pos) {
		if(check)
			$("#c"+pos).html("<i class='fa fa-check' style='color:green;' aria-hidden='true'></i>");
		else 
			$("#c"+pos).html("<i class='fa fa-times' style='color:red;' aria-hidden='true'></i>");
	}
	
	function duplicateCheck(pos) {
		var url = "${ContextPath}/signup/duplicateCheck";
		var paramData = {"key" : pos,
						 "id" : $("#id").val(),
						 "email" : $("#email").val()};
		
		var check;
		
		$.ajax({
			type: 'GET',
			url: url,
			data: paramData,
			dataType: 'json',
			
			async : false,
			
			success : function (result) {
				check = result;
			},
		
			error : function () {
				alert('error');
			}
		});
		
		return check;
	}

	function checkCorrect(pos) {
		// 아이디 정규식 - 영어 대소문자 또는 숫자 6 ~ 20자
		var reid = /^[a-zA-Z0-9]{6,20}$/;
		// 비밀번호 정규식 - 영어 대소문자 또는 숫자 8 ~ 25자
		var repw = /^[a-zA-Z0-9]{8,25}$/;
		// 이름 정규식 - 영어 대소문자 또는 한글 2 ~ 10자
		var ren = /^[a-zA-Z가-힣]{2,10}$/;
		// 이메일 정규식
		var ree = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		
		if(pos == "id") 
			return cid = checkRE(reid, document.getElementById(pos)) && duplicateCheck(pos);
		else if (pos == "name") 
			return cname = checkRE(ren, document.getElementById(pos));
		else if (pos == "email") 
			return cemail = checkRE(ree, document.getElementById(pos)) && duplicateCheck(pos);
		else if (pos == "pw") 
			return cpw = checkRE(repw, document.getElementById(pos));
		else {
			if(document.getElementById("pw").value == document.getElementById(pos).value)
				cpw2 = true;
			else 
				cpw2 = false;
			return cpw2;
		}
		
	}
	
	function checkIcon(pos) {
		printIcon(checkCorrect(pos), pos);	
	} 
	
	function clearInput(pos, check) {
		if(!check) {
			document.getElementById(pos).value = "";
			document.getElementById(pos).focus();
			return true;
		}
		
		return false;
	}
	
	function checkVar() {
		if(clearInput('id',cid) || clearInput('name',cname) || clearInput('email',cemail) || clearInput('pw',cpw) || clearInput('pw2',cpw2))
			return false;

		return true;
	}
</script>
</head>

<body class="bg-gradient-primary">

	<div class="container">
		
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-6 col-md-6">
	
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
					
						<!-- Nested Row within Card Body -->
						<div class="row ">
							<div class="col-lg-12">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">강사등록</h1>
									</div>
									
									<form class="user" onsubmit="return checkVar();" action="${ContextPath }/TeacherAdd" method="post">
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="id" name="mid" placeholder="아이디를 입력해주세요" maxlength="20" onchange="checkIcon('id')" required>
											</div>
											<div id="cid" class="ox"></div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="name" name="mname" placeholder="이름을 입력해주세요" maxlength="10" onchange="checkIcon('name')" required>
											</div>
											<div id="cname" class="ox"></div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="email" class="form-control form-control-user"
													id="email" name="memail" placeholder="이메일을 입력해주세요" maxlength="50" onchange="checkIcon('email')" required>
											</div>
											<div id="cemail" class="ox"></div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="password" class="form-control form-control-user"
													id="pw" name="mpw" placeholder="비밀번호를 입력해주세요" maxlength="30" onchange="checkIcon('pw'); checkIcon('pw2')" required>
											</div>
											<div id="cpw" class="ox"></div>
										</div>
										
										<div class="form-group row">	
											<div class="col-sm-11">
												<input type="password" class="form-control form-control-user"
													id="pw2" placeholder="비밀번호를 확인해주세요" maxlength="30" onchange="checkIcon('pw2')" required>
											</div>
											<div id="cpw2" class="ox"></div>
										</div>
										
										<input type="submit" class="btn btn-primary btn-user btn-block"
											value="회 원 가 입" >
											
									</form>
									
									<hr>
									
									<div class="text-center">
										<a class="small" href="#">비밀번호 찾기</a>
									</div>
									
									<div class="text-center">
										<a class="small" href="${ContextPath }/login/form">이미 회원이신가요? 로그인해주세요</a>
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