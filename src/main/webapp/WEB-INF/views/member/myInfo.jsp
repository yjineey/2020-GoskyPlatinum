<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>My Info</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<meta name="referrer" content="no-referrer" />
</head>

<body class="bg-gradient-primary">
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block">
								<img alt="" src="${userImg }">
							</div>
							
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form class="user">
										<div class="form-group">
											<div class="form-control form-control-user"> ${userID } </div>
										</div>
										<div class="form-group">
											<div class="form-control form-control-user"> ${userName } </div>
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


</body>

</html>