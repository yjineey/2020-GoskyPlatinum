<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>마이페이지_내정보</title>

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
						<h1 class="h3 mb-0 text-gray-800">마이페이지</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							마이페이지 입니다. 개인정보 및 USER 정보를 수정할 수 있습니다. 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">내 정보 </h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<form role="form" method="post"
											action="${ContextPath}/MemberMypageUpdate2?mid=${member.mid}">
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
														<th>학번</th>
														<td>${member.mno}</td>
														<th>이름</th>
														<td><input type="text" name="mname" value="${member.mname}" required></td>
														<th>아이디(id)</th>
														<td>${member.mid}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>이메일</th>
														<td><input type="text" name="memail" value="${member.memail}"></td>
														<th>가입날짜</th>
														<td>${member.mjoindate}</td>
														<th>비고</th>
														<td><input type="text" name="etc" value="${member.etc}"></td>
													</tr>
													<tr>
														<th>탈퇴여부</th>
														<td>${member.mdel}</td>
														<th>탈퇴날짜</th>
														<td>${member.mdeldate}</td>
														<th>이미지</th>
														<td></td>
													</tr>
												</tbody>
											</table>
											<div class="box-footer" align="center">
												<button type="submit" class="btn btn-primary">개인정보 수정완료</button>
											</div>
										</form>
									</section>
								</div>
							</div>
						</div>
						
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">USER 정보  &nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary" id="write">USER추가</button></h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
											<c:choose>
												<c:when test="${fn:length(people) > 0}">
										<c:forEach var="people" items="${people }" varStatus="i">
									 	<form role="form" method="post" action="${ContextPath}/PeopleMypageUpdate2">
												<table class="table table-bordered" id="dataTable">
													<tbody>
														<tr>
															<td rowspan="2">
															<th colspan="2">회원아이디</th>
															<th colspan="2">${member.mid}</th>
														</tr>
														<tr>
															<th>이름</th>
															<td><input type="text" name="pname" value="${people.pname}" required></td>
													
															<th>성별</th>
															<td>
															<label for="male${i.index }">남자&nbsp;</label>
															<input type="radio" id="psex${i.index}" name="psex" value="male" checked>&nbsp;&nbsp;
															<label for="female${i.index }">여자&nbsp;</label>
															<input type="radio" id="psex${i.index}" name="psex" value="female"/>

														    <script type="text/javascript">
														      $(document).ready(function () {
														        $('#male${i.index}').click(function () {
														        	$("input:radio[id='psex${i.index}']:radio[value='male']").prop('checked', true); 
														        });
														
														        $('#female${i.index}').click(function () {
														        	$("input:radio[id='psex${i.index}']:radio[value='female']").prop('checked', true);
														        });
														      });
														      $(document).ready(function () {
																	$("input:radio[id='psex${i.index}']:radio[value='${people.psex }']").prop('checked', true);
																})
														    </script>
															</td>
														</tr>
														
														<tr>
															<th>이미지</th>
															<th>연락처</th>
															<td><input type="text" name="pnumber" value="${people.pnumber}" required></td>
															
															<th>생년월일</th>
															<td><input type="text" name="pinfo" value="${people.pinfo}" required>&nbsp;&nbsp;
															<input type="text" name="pno" value="${people.pno}" hidden>
																<button type="submit" class="btn btn-primary">수정완료</button>
															</td>
														</tr>
													</tbody>
												</table>
											</form>
											</c:forEach>
												</c:when>
												<c:otherwise>
													<tr align="center">
														<td>등록된 원생이 없습니다. 원생을 추가해주세요  </td>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>
</body>
<script>
	$('#write').on('click', function() {
		location.href = "${ContextPath}/StudentAdd"
	})
</script>
</html>