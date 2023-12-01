<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>강사 정보수정</title>

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
						<h1 class="h3 mb-0 text-gray-800">강사 정보수정</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							강사 정보수정 페이지 입니다. 강사 정보수정를 수정할 수 있습니다. 
						</p>

						<!-- 강사정보 -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사정보</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<form role="form" method="post"
										action="${ContextPath}/MemberUpdate2?mid=${member.mid}">
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
														<th>번호</th>
														<td>${member.mno}</td>
														<th>이름</th>
														<td>${member.mname}</td>
														<th>아이디(id)</th>
														<td>${member.mid}</td>
														<th>회원등급</th>
														<td>
														<select name="msort">
														<option value="m00" selected>강사신청</option>
														<option value="m02">강사</option>
														
														</select>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>이메일</th>
														<td>${member.memail}</td>
														<th>가입날짜</th>
														<td>${member.mjoindate}</td>
														<th>전화번호</th>
														<td colspan="2">${member.number}</td>
														<td><button type="submit" class="btn btn-primary">수정완료</button>
													</tr>
												</tbody>
											</table>
										</form>
									</section>
								</div>
							</div>
						</div>

						<!-- 강사소개 -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사소개</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<form role="form" method="post"
											action="${ContextPath}/TeacherUpdate">
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
							<td rowspan="2"><img src="${member.img}" width="150"></td>
							<td rowspan="${list.listSize + 2}"><img src="${ContextPath }${list.member.img }" width="100%"></td>
														
													</tr>
													<tr>
														<th colspan="2">이름</th>
														<td colspan="3">${member.mname}</td>
													</tr>
													<tr>
														<th></th>
														<th>항목</th>
														<th>기간</th>
														<th colspan="3">내용</th>
													</tr>
												</thead>

												<c:choose>
													<c:when test="${fn:length(teacher) > 0}">
														<c:forEach var="teacher" items="${teacher }">
															<tr>
																<td></td>

																<td colspan="1"><c:if test="${teacher.status == 0}">
																		소개</c:if> <c:if test="${teacher.status == 1}">
																		학력</c:if> <c:if test="${teacher.status == 2}">
																		수상내역</c:if></td>
																<td colspan="1">${teacher.tdate}</td>
																<td colspan="3">${teacher.content}</td>
															</tr>
															</tbody>
														</c:forEach>
														<tr>
														</tr>

													</c:when>
													<c:otherwise>
														<tr align="center">
															<td colspan="6">데이터가 존재하지 않습니다</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</form>
									</section>
								</div>
							</div>
						</div>

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">
									담당과목 &nbsp;&nbsp;&nbsp;
									<!-- <button type="button" class="btn btn-primary" id="subjectadd">과목추가</button> -->
								</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<c:choose>
											<c:when test="${fn:length(subject) > 0}">
												<c:forEach var="subject" items="${subject }">

													<form role="form" method="post"
														action="${ContextPath}/SubjectUpdate?sno=${subject.sno}&mid=${subject.mid}">
														<table class="table table-bordered" id="dataTable">
															<tbody>
																<tr>
																	<th>과목코드</th>
																	<td>${subject.sno}</td>
																	<th>과목명</th>
																	<td><input type="text" name="sname"
																		value="${subject.sname}" required></td>
																	<th>수업내용</th>
																	<td><input type="text" name="content"
																		value="${subject.content}" required></td>
																</tr>
																<tr>
																	<th>시작시간</th>
																	<td><c:choose>
																			<c:when test="${subject.stime == 0}">
																		오전
																	</c:when>
																			<c:otherwise>
																		오후
																	</c:otherwise>
																		</c:choose></td>
																	<th>강사</th>
																	<td>${member.mname}</td>
																	<th>상태</th>
																	<!--  <td><input type="text" name="status"
																		value="${subject.status}" required>-->
																		<td><c:choose>
																			<c:when test="${subject.status == 0}">
																		준비중
																	</c:when>
																	<c:when test="${subject.status == 1}">
																		진행중
																	</c:when>
																			<c:otherwise>
																		진행중지
																	</c:otherwise>
																		</c:choose>
																		 &nbsp;&nbsp;&nbsp;&nbsp;
																		<button type="submit" class="btn btn-primary">수정완료</button>
																</tr>
															</tbody>
														</table>
													</form>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr align="center">
													<td>등록된 과목이 없습니다. 과목을 추가해주세요</td>
												</tr>
											</c:otherwise>
										</c:choose>
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
	$('#subjectadd').on('click', function() {
		location.href = "${ContextPath}/SubjectAdd"
	})
</script>
</html>