
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>강의실 수정</title>

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
						<h1 class="h3 mb-0 text-gray-800">강의실 수정</h1>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="h3 mb-0 text-gray-800">강의실 수정</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<form role="form" method="post">
										<div class="box-body">

											<div class="form-group">
												<label>강의실 번호</label> <input type="text" name="roomno"
													class="form-control" readonly="readonly"
													value="${list.roomno}" />
											</div>
											<div class="form-group">
												<label>강의실 이름</label>
												<textarea name="rname" style="width: 500px"
													class="form-control">${list.rname}</textarea>
											</div>
											<div class="form-group">
												<label>담당자</label> <input type="text" name="rmanager"
													class="form-control" value="${list.rmanager}" />
											</div>
											<div class="form-group">
												<label>장소</label> <input type="text" name="content2"
													class="form-control" value="${list.content}" />
											</div>
											<div class="input">
												<label>주소</label>

												<p>
													<input type="text" name="post" class="box"
														id="sample4_postcode" placeholder="우편번호" required>
													<button type="button" class="btn-primary box"
														id="findaddress" onclick="sample4_execDaumPostcode()">우편번호
														찾기</button>
													<br>
												</p>

												<p>

													
											<input type="text" name="roadAddress" class="box"
												id="sample4_roadAddress" placeholder="도로명주소" style="width: 500px" required>

												
												</p>


											</div>
										</div>

									</form>
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


</html>