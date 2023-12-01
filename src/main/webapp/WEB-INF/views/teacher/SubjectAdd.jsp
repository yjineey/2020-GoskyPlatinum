<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>과목추가</title>

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
			$("#c"+pos).html("<i class='fa fa-times' style='color:red;' aria-hidden='true'></i>");
		else 
			$("#c"+pos).html("<i class='fa fa-check' style='color:green;' aria-hidden='true'></i>");
	}
	
	function duplicateCheck(pos) {
		var url = "${ContextPath}/signup/duplicateCheck";
		var paramData = {"key" : pos,
						 "id" : $("#mid").val()};
		
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
		if(pos == "id") 
			return cid = duplicateCheck(pos);

	}
	
	function checkIcon(pos) {
		printIcon(checkCorrect(pos), pos);	
	} 
	
	function clearInput(pos, check) {
		if(check) {
			alert('다시 입력하세요');
			document.getElementById(pos).value = "";
			document.getElementById(pos).focus();
			return true;
		}
		
		return false;
	}
	
	function checkVar() {
		if(clearInput('mid',cid))
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
										<h1 class="h4 text-gray-900 mb-4">과목추가     </h1>
									</div>
									
									<form class="user" action="${ContextPath }/SubjectAdd" method="post">
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="sname" name="sname" placeholder="과목명을 입력해주세요" maxlength="20"  required>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="content" name="content" placeholder="수업내용을 입력해주세요" maxlength="10" required>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" onsubmit="return checkVar();"  class="form-control form-control-user"
													id="mid" name="mid" placeholder="강사명을 입력해주세요" maxlength="50" onchange="checkIcon('id')" required>
											</div>
											<div id="cid" class="ox"></div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="stime" name="stime" placeholder="시작시간을 입력해주세요 (ex)오전 = 0 / 오후 = 1" maxlength="30"  required>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="ssort" name="ssort" placeholder="체조:1 산책:2 수영:3 티볼:4 축구:5" maxlength="30"  required>
											</div>
										</div>
										<input type="submit" class="btn btn-primary btn-user btn-block"
											value="Register Account" >
											
									</form>
									
									<hr>
									
									<div class="text-center">
										<a class="small" href="#">Forgot Password?</a>
									</div>
									
									<div class="text-center">
										<a class="small" href="${ContextPath }/login/form">Already have an account?	Login!</a>
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