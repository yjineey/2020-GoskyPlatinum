<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>원생등록</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
<script type="text/javascript">
	function checkRE(re, str){
		if(re.test(str.value))
			return true;
		return false;
	}
//체크
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
		if(clearInput('mid',cid) )
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
										<h1 class="h4 text-gray-900 mb-4">원생 등록</h1>
									</div>
									
									<form class="user"  action="${ContextPath }/PeopleAdd" method="post">
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" onsubmit="return checkVar();" class="form-control form-control-user"
													id="mid" name="mid" placeholder="보호자 아이디를 입력해주세요" maxlength="20" onchange="checkIcon('id')" required>
											</div>
											<div id="cid" class="ox"></div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="pname" name="pname" placeholder="이름을 입력해주세요" maxlength="10" required>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="pnumber" name="pnumber" placeholder="연락처를 입력해주세요" maxlength="10" required>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-11">
												<input type="text" class="form-control form-control-user"
													id="pinfo" name="pinfo" placeholder="생년월일을 입력해주세요 (ex) 2020.02.20" maxlength="50" required>
											</div>
										</div>
										
										<div class="form-group row">
											<div class="col-sm-11" >
									<label for="male">성별 : 남자&nbsp;</label><input type="radio" id="male" name="psex"  value="male" checked>&nbsp;&nbsp;
											<label for="female">여자&nbsp;</label><input type="radio" id= female name="psex" value="female"  />
</div>
</div>
														    <script type="text/javascript">
														      $(document).ready(function () {
														        $('#male').click(function () {
														          var radioVal = $('input[name="psex"]:checked').val(['male']);
														          alert(radioVal);
														        });
														
														        $('#female').click(function () {
														          $('input[name="psex"]').val(['female']);
														        });
														      });
														      $(document).ready(function () {
																	$("input:radio[name='psex']:radio[value='${people.psex }']").prop('checked', true);
																})
														    </script>
										
										<input type="submit" class="btn btn-primary btn-user btn-block"
											value="원생추가" >
									</form>
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