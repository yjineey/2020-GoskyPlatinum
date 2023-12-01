<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>내 정보 수정</title>

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
						<h1 class="h3 mb-0 text-gray-800">USER 상세보기</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							USER정보 상세보기 페이지 입니다. 회원정보 및 USER정보를 확인 할 수 있습니다. 
						</p>
						
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">USER 정보  &nbsp;&nbsp;&nbsp;
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
									
											<c:choose>
												<c:when test="${fn:length(people) > 0}">
										<c:forEach var="people" items="${people }">
												<table class="table table-bordered" id="dataTable">
													<tbody>
														<tr>
															<td rowspan="2"></td>
															<th colspan="2">회원아이디</th>
															<td colspan="2">${member.mid}</td>
														</tr>
														<tr>
															<th>이름</th>
															<td>${people.pname}</td>
													
															<th>성별</th>
															<td>
													<label for="male">남자&nbsp;</label><input type="radio" id="male" name="psex" value="male" checked>&nbsp;&nbsp;
															<label for="female">여자&nbsp;</label><input type="radio" id= female name="psex" value="female"/>

														    <script type="text/javascript">
														      $(document).ready(function () {
														        $('#male').click(function () {
														          var radioVal = $('input[name="psex"]:checked').val(['male']);
														          alert(radioVal);
														        });
														
														        $('#female').click(function () {
														          $('input[name="psex"]').val(['female']);
														        });
														      });
														      $(document).ready(function () {
																	$("input:radio[name='psex']:radio[value='${people.psex }']").prop('checked', true);
																})
														    </script>
															</td>
														</tr>
														<tr>
															<th>회원사진</th>
															<th>연락처</th>
															<td>${people.pnumber}</td>
														
															<th>생년월일</th>
															<td>${people.pinfo}</td>
														</tr>
													</tbody>
												</table>
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

				<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">회원 (보호자) 정보 </h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
											<table class="table table-bordered" id="dataTable">
												<thead>
													<tr>
														<th>번호</th>
														<td>${member.mno}</td>
														<th>이름</th>
														<td>${member.mname}</td>
														<th>아이디(id)</th>
														<td>${member.mid}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>이메일</th>
														<td>${member.memail}</td>
														<th>가입날짜</th>
														<td>${member.mjoindate}</td>
														<th>비고</th>
														<td>${member.etc}</td>
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
									</section>
								</div>
							</div>
						</div>
					<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">출결정보 </h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<table class="table table-bordered" id="dataTable">
										<thead>
											<tr>
												<th>날짜</th>
												<th>출결</th>
												<th>오전과목</th>
												<th>상태</th>
												<th>오후과목</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
										   <c:choose>
							<c:when test="${fn:length(attend) > 0}">
                                       <c:forEach var="att" items="${attend }">
                                          <tr>
                                          <td>${att.date}</td>
                                          <td>${att.asort}</td>
                                          <td>${att.befor}</td>
                                             <td>${att.beforcon}</td>
                                             <td>${att.after}</td>
                                             <td>${att.aftercon}</td>
                                          </tr>
                                       </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                       <tr align="center">
                                          <td colspan="6">데이터가 존재하지 않습니다</td>
                                       </tr>
                                    </c:otherwise>
                                 </c:choose>
										</tbody>
											</table>
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
		location.href = "${ContextPath}/PeopleAdd"
	})
</script>
</html>

