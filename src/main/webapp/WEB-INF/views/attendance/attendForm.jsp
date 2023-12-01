<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석하기</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

</head>
<body>
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
										<h1 class="h4 text-gray-900 mb-4">이름과 생년원일을 입력해주세요!</h1>
									</div>

									<form class="people" onsubmit="return AttendForm();"
										action="${ContextPath }/attendForm" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												id="pname" name="pname" placeholder="이름을 입력하세요"
												maxlength="20" required>
										</div>
										<div class="form-group">
											<input type="pinfo" class="form-control form-control-user"
												id="pinfo" name="pinfo" placeholder="생년월일을 입력하세요"
												maxlength="30" required>
										</div>

										<div style="margin-top: 40px;"></div>

										<input type="submit"
											class="btn btn-primary btn-user btn-block" value="출석하기">
										<div style="margin-top: 40px;"></div>

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