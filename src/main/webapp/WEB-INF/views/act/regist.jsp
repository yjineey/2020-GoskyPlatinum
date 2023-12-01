<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>

<c:import url="/WEB-INF/views/act/include/title.jsp" />

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
			<div id="main-content">
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4" id="pageHeading">
						<h1 class="h3 mb-0 text-gray-800">종목 ${empty act ? '등록' : '정보 조회 및 수정'}</h1>
					</div>

				</div>

				<c:import url="/WEB-INF/views/act/include/regist-card.jsp" />
				
			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
</body>

</html>