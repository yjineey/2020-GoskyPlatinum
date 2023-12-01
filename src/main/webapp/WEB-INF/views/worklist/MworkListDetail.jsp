<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>업무지시현황</title>

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
						<h1 class="h3 mb-0 text-gray-800">업무지시현황</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							관리자에게 보여지는 업무지시현황 입니다 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">업무지시현황</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<div class="box">
											<table align="right" board="1">
												<td>게시글번호 :</td>
												<td>${message.msno}</td>
												<td style="padding-left: 50px">작성자 :</td>
												<td>${message.fromid}</td>
												<td style="padding-left: 50px">작성일 :</td>
												<td>${message.regdate}</td>
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
													<textarea name="content" readonly="readonly" rows="10"
														cols="100" class="form-control">${message.content}</textarea>
												</div>

												<div class="form-group">
													<label>작성자</label> <input type="text" name="fromid"
														class="form-control" value="${message.fromid}"
														readonly="readonly" />
												</div>

											</div>
										</div>
										<table class="table table-bordered" id="dataTable">
											<thead>
												<tr>
													<th>글번호</th>
													<th>이름</th>
													<th>작성시간</th>
													<th>확인여부</th>
													<th>읽은시간</th>
													<th>업무상태</th>
												</tr>
											</thead>
											<tbody>
												<td>${worklist.wno}</td>
												<td>${worklist.fromid}</td>
												<td>${message.regdate}</td>
												<td><c:choose>
														<c:when test="${message.readchk == 0}">
																		미확인
																	</c:when>
														<c:otherwise>
																		확인
																	</c:otherwise>
													</c:choose></td>
												<td>${worklist.finishdate}</td>
												<td>
													<form method="post" action="${ContextPath}/MworkListDetail">
														<input type="text" id="msno" name="msno"
															value="${worklist.msno }" hidden> <label
															for="finish0">미확인&nbsp;</label><input type="radio"
															id="finish0" name="finish" value="0" checked> <br>
														<label for="finish1">처리완료&nbsp;</label><input type="radio"
															id=finish1 name="finish" value="1" /> <br>
														<label for="finish2">처리불가&nbsp;</label><input type="radio"
															id=finish2 name="finish" value="2" />
														<div align="right"></div>

														<script type="text/javascript">
													$(document).ready(function () {
														$("input:radio[name='finish']:radio[value='${worklist.finish }']").prop('checked', true);
													})
													</script>

														<input type="submit" class="btn btn-primary" value="저장">
													</form>
												<tr>
											</tbody>
										</table>
										<div class="box-footer" align="right">
											<button type="button" class="btn btn-success">목록</button>
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
		location.href = "MworkList";
	});
</script>

</html>