<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>과목보기</title>

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
				<!-- Topbar -->
				<c:import url="/WEB-INF/views/include/top.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">수업과목보기</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							현재 수업중인 과목입니다
						</p>
					</div>
		
		
		
		
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h4 class="m-0 font-weight-bold text-primary">오전수업 </h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
											<table class="table table-bordered" id="dataTable">
										
												<thead>
													<tr><td>
														<a href="classList?sno=${listbefore.sno}&status=0">${listbefore.sname}</a>
													
													</td></tr>
												</thead>
												
											</table>
										
									</section>
								</div>
							</div>
						</div>
						
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h4 class="m-0 font-weight-bold text-primary">오후수업 </h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
											<table class="table table-bordered" id="dataTable">
										
												<thead>
													<tr><td>
														<a href="classList?sno=${listafter.sno }&status=1">${listafter.sname }</a>
													
													</td></tr>
												</thead>
												
											</table>
										
									</section>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>
</body>



</html>