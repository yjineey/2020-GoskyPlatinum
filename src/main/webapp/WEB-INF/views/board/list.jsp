<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
<c:import url="/WEB-INF/views/board/include/title.jsp" />

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
			<div id="content">
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4" id="pageHeading1"></div>

					<div class="container-fluid" id="pageHeading2"></div>
					
					<div class="container-fluid">
						<div class="card shadow mb-4">
							<div class="card-header py-3" id="pageHeading3"></div>
							
							<div style="color: red">${exist }</div>
							
							<c:import url="/WEB-INF/views/board/include/search.jsp" />

							<c:import url="/WEB-INF/views/board/include/getList.jsp" />
						</div>
					</div>

				</div>

			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
	
	<c:import url="/WEB-INF/views/board/include/heading.jsp" />
	
</body>
</html>