<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>강사신청리스트</title>

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
						<h1 class="h3 mb-0 text-gray-800">강사신청리스트</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							관리자에게 보여지는 강사신청리스트화면 입니다 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사신청리스트</h6>
							</div>
							<div style="color: red">${exist }</div>
							<div class="card-body">
								<div class="table-responsive">
									<!-- 검색 -->
									<div class="box-footer">
										<div class="form-group col-sm-2">
											<select class="form-control" name="searchType"
												id="searchType">
												<option value="n"
													<c:out value="${searchPaging.searchType == null ? 'selected' : ''}"/>>::::::
													선택 ::::::</option>
												<option value="t"
													<c:out value="${searchPaging.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
												<option value="c"
													<c:out value="${searchPaging.searchType eq 'c' ? 'selected' : ''}"/>>번호</option>
											</select>
										</div>
										<div class="form-group col-sm-10" align="right">
											<div class="input-group">
												<input type="text" class="form-control" name="keyword"
													id="keywordInput" value="${searchPaging.keyword}"
													placeholder="Search for..."> <span
													class="input-group-btn">
													<button type="button" class="btn btn-primary btn-flat"
														id="searchBtn">
														<i class="fa fa-search"></i> 검색
													</button>
												</span>
											</div>
										</div>
									</div>

									<table class="table table-bordered" id="dataTable">
										<thead>
											<tr>
												<th>번호</th>
												<th>이름</th>
												<th>이메일</th>
												<th>연락처</th>
												<th>가입일</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(TeacherList) > 0}">
													<c:forEach var="TeacherList" items="${TeacherList }"
														varStatus="status">
														<tr>
															<td>${TeacherList.mno}</td>
															<td><a
																href="${ContextPath}/TeacherDetail?mid=${TeacherList.mid}">${TeacherList.mname}</a></td>
															<td>${TeacherList.memail}</td>
															<td>${TeacherList.number}</td>
															<td>${TeacherList.mjoindate}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr align="center">
														<td colspan="5">데이터가 존재하지 않습니다</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
										<tr>
									</table>
									<nav aria-label="Page navigation">
										<ul class="pagination">
											<c:if test="${pageMaker.prev}">
												<li class="page-item"><a class="page-link"
													href="${ContextPath}/MemberSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
											</c:if>
											<c:forEach begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}" var="idx">
												<li class="page-item"><a class="page-link"
													href="${ContextPath}/MemberSearch${pageMaker.makeSearch(idx)}">${idx}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
												<li class="page-item"><a class="page-link"
													href="${ContextPath}/MemberSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
											</c:if>
										</ul>
									</nav>
									<!-- Modal  추가 -->
									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">게시글 등록/수정</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">${result }게시글이처리 되었습니다</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
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
<script>
	$(document).ready(function () {
	    $("#searchBtn").on("click", function (event) {
	        self.location =
	            "${ContextPath}/MemberSearch${pageMaker.makeQuery(1)}"
	            +"&searchType="+$("select option:selected").val()
	            +"&keyword="+$("#keywordInput").val();
	    });
	});

</script>
</html>