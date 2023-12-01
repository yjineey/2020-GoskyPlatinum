<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>구구 홈</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${ContextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${ContextPath }/resources/assets/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="${ContextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${ContextPath }/resources/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="${ContextPath }/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${ContextPath }/resources/assets/vendor/venobox/venobox.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ContextPath }/resources/assets/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: Eterna - v2.1.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	
	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-none d-lg-block" >
		<div class="container d-flex">
			<div class="contact-info mr-auto"
				style="font-size: 16px; text-align: left;">
				<i style="padding-right: 10px;"></i> <a
					href="${ContextPath }/attendForm">출석하기</a> 
					&nbsp;&nbsp;&nbsp; 
					<c:choose>
				<c:when test="${empty userID }">

					<i style="padding-right: 10px;" hidden=""></i> <a
					href="${ContextPath }/login/form">로그인</a>
				</c:when>

				<c:otherwise>
					<i> ${userID } 님 환영합니다. </i>
					
				</c:otherwise>
			</c:choose>
					
					
			</div>
			<c:choose>
				<c:when test="${empty userID }">

					<div class="contact-info mr-auto" id="system"
						style="font-size: 16px; " hidden="true">
						<i style="padding-right: 100px;"></i> <a href="${ContextPath }/">정보
							시스템</a>
					</div>
				</c:when>

				<c:otherwise>
					<div class="contact-info mr-auto" id="system"
						style="font-size: 16px; ">
						<i style="padding-right: 100px;"></i> <a href="${ContextPath }/">정보
							시스템</a>
							</div>
				</c:otherwise>
			</c:choose>
			</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="container d-flex">

			<div class="logo mr-auto">
				<h1 class="text-light">
					<a href="${ContextPath }/">
					<img src="${ContextPath }/resources/assets/img/clients/logo3.jpg"
						 alt="GoSky"class="img-fluid"></a>
				</h1>
				<!-- Uncomment below if you prefer to use an image logo -->

			</div>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><a href="userGreeting">학원 소개</a></li>
					<li><a href="SIntroForm2">과목 소개</a></li>
					<li><a href="TIntroForm3">강사 소개</a></li>
					<li><a href="userMap">오시는 길</a></li>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<!-- Content Wrapper -->
	<div id="wrapper">
	<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				

				<!-- Begin Page Content -->
				<div class="container-fluid">
				
					<!-- Page Heading -->

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

		<!-- End Services Section -->

		
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer class="short pt-lg" id="footer">

		<div class="container">
			<div class="row">
				<div class="col-md-11 font-size-md m-none">
					<div class="col-md-3 p-none font-size-md mb-sm logo_wrp">
						
					</div>
					<div class="col-md-9 p-none">
						<p class="mb-sm text-light"><br>
							상호: GoSky 플래티넘스쿨 홈 ㅣ 주소: 경기도 안산시 단원구 원포공원1로 30, 서해프라자 201호  ㅣ 대표: 이권희 ㅣ 
							사업자등록번호: 828-80-01485
							<br />
							TEL: 031.8022.0100 ㅣ FAX: 031.8022.0200 ㅣ HP: 010.3651.6042 ㅣ 개인정보관리책임자: 박진우
						</p>
					</div>
				</div>
				
			</div>
		</div>
	
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>GoSky Platinum School</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/ -->
				
			</div>
		</div>
	</footer>
	<!-- End Footer -->
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="${ContextPath }/resources/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/counterup/counterup.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${ContextPath }/resources/assets/vendor/venobox/venobox.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${ContextPath }/resources/assets/js/main.js"></script>

</body>

</html>