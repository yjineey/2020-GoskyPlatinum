<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>

<title>종목 현황</title>

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
				
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
				
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">종목 현황</h6>
						</div>
				
						<div class="card-body">
							<div class="table-responsive">

								<c:import url="/WEB-INF/views/act/include/list-card.jsp" />
								
							</div>
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
</body>

</html>