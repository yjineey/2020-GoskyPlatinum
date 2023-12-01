<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>업무 내역보기</title>

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
						<h1 class="h3 mb-0 text-gray-800">업무내역보기</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							관리자/강사에게 보여지는 업무내역 입니다 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">업무내역상세보기</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<div class="box">
											<table align="right" >
												<td>게시글번호 :</td><td> ${message.msno}</td>
												<td style="padding-left:50px">작성자 :</td><td> ${message.fromid}</td>
												<td style="padding-left:50px">작성일 :</td><td> ${message.regdate}</td>
											</table>
											<br>
											<div class="box-body">
												<div class="form-group">
													<label>제목</label> <input type="text" name="title"
														class="form-control" value="${message.title}"
														readonly="readonly" />
												</div>

												<div class="form-group">
													<label>내용</label>
													<textarea name="content" readonly="readonly" rows="7"
														cols="100" class="form-control">${message.content}</textarea>
												</div>

												<div class="form-group">
													<label>작성자</label> <input type="text" name="fromid"
														class="form-control" value="${message.fromid}"
														readonly="readonly" />
												</div>
												<form method="post" action="${ContextPath}/WorkListDetail">
												<input type="text" id="msno" name="msno" value="${worklist.msno }" hidden>
												<br><label for="finish0">미확인&nbsp;</label><input type="radio" id="finish0" name="finish" value="0" checked>
												<br><label for="finish1">처리완료&nbsp;</label><input type="radio" id= finish1 name="finish" value="1"/>
												<br><label for="finish2">처리불가&nbsp;</label><input type="radio" id= finish2 name="finish" value="2"/>
													<div align="right">	
														<input type="submit" class="btn btn-primary" value="저장">
														<input type="button" class="btn btn-success" value="목록">
													</div>
													
													<script type="text/javascript">
													$(document).ready(function () {
														$("input:radio[name='finish']:radio[value='${worklist.finish }']").prop('checked', true);
													})
													</script>
													
												</form>
											</div>
										</div>
										<div class="box-footer" align="right" >
										</div>
									</section>
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
<script>
	//게시글목록
	$('.btn-success').on('click', function() {
		location.href = "WorkList";
	});
</script>

</html>