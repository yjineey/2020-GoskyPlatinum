<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>강사 소개</title>
<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
</head>
<body>
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
					<div class="d-sm-flexalign-items-centerjustify-content-betweenmb-4">
						<h1 class="h3 mb-0 text-gray-800">강사 소개</h1>
					</div>

					<!-- Begin Page Content -->
					<div class="container-fluid">
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사 소개</h6>
							</div>
							<div class="card-body">

								<table class="table table-bordered" style="text-align: center; vertical-align: middle">
									
									<colgroup>
										<col width="20%" />
										<col width="26%" />
										<col width="26%" />
										<col width="26%" />
									</colgroup>
									
									<tbody>
										
										<c:forEach var="list" items="${mlist }" >
											
											<tr>
												<td rowspan="${list.listSize + 2}"><img src="${ContextPath }${list.member.img }" width="100%"></td>
												<td colspan="3">${list.member.mname}<p>${list.member.memail}</p></td>
											<tr>
											
											<c:forEach var="tlist" items="${list.tlist }">
											
												<c:choose>
													<c:when test="${tlist.status == 0 }">
														<tr>
															<td colspan="3">종목 : ${tlist.content}</td>
														</tr>
													</c:when>
															
													<c:when test="${tlist.status == 1}">
														<tr>
															<td colspan="3">한마디 : ${tlist.content }</td>
														</tr>
													</c:when>
															
													<c:when test="${tlist.status == 2}">
														<tr>
															<td colspan="3">
																${tlist.tdate } : ${tlist.content }
															</td>
														</tr>
													</c:when>
												</c:choose>
											
											</c:forEach>
											
											<tr height="50px"></tr>
											
										</c:forEach>

									</tbody>
								</table>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>


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