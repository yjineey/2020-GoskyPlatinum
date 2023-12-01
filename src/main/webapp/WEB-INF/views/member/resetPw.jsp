<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<script type="text/javascript"> 
$(function(){ 
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var mpw=$("#mpw").val(); 
		var mpw2=$("#mpw2").val(); 
		if(mpw != "" || mpw2 != ""){ 
			if(mpw == mpw2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#done").removeAttr("disabled"); 
				}
			else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#done").attr("disabled", "disabled"); 
				} 
			} 
		}); 
	}); 
	
	
	</script>

</head>

<body class="bg-gradient-white"  >
	<div class="container"   >

		<!-- Outer Row -->
		<div class="row justify-content-center" align="center"  >

			<div class="col-xl-6 col-lg-6 col-md-6"  >


				<div class="card o-hidden border-0 shadow-lg my-5"   >
					<div class="card-body p-0" >

						<!-- Nested Row within Card Body -->
						<div class="row"  >
							<div class="col-lg-12">
								<div class="p-5">
								
									<div class="text-center" >
										<h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
									</div>
	
									<form class="resetPw"  method="post" action ="${ContextPath }/login/resetPw">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="mpw" name="mpw" placeholder="새 비밀번호를 입력하세요"
												maxlength="20" required>
										</div>
										
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="mpw2" name="mpw2" placeholder="새 비밀번호를 한번 더 입력하세요"
												maxlength="20" required>
										</div>
										<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
										<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

										
										<div style="margin-top: 30px;">
									
											<input type="submit" class="btn btn-primary"  id ="done" value="비밀번호 변경하기">
										</div>
									</form>
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
		$('#done').on("click", function() {
			var url = "${ContextPath}/login/resetPw";
			var Data = {
				"mpw" : $("#mpw").val()
				
			};
					
			$.ajax({
				type : 'POST',
				url : url,
				data : Data,
				

				success : function(result) {
					alert("정보가 일치합니다");
					location.href ="${ContextPath}/login/form";
				},

				error : function(e) {
					alert("정보가 일치하지 않습니다");
					
				}
			});
		});
	</script>

</html>