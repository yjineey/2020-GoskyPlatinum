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
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">현재 세션을 종료할 준비가 되면 아래에서 "로그아웃"을 선택하십시오.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="${ContextPath }/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>

	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-none d-lg-block" >
		<div class="container d-flex">
		
			<div class="contact-info mr-auto"
				style="font-size: 16px; text-align: left;">
				
					<c:choose>
				<c:when test="${empty userID }">
				<i style="padding-right: 10px;"></i> <a
					href="${ContextPath }/attendForm">출석하기</a> 
					&nbsp;&nbsp;&nbsp; 

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
						<i style="padding-right: 100px; style:float:right; "></i> <a href="${ContextPath }/">정보
							시스템</a>
					</div>
					
				</c:when>

				<c:otherwise>
				<div align="right">
					<div class="contact-info mr-auto" id="system"
						style="font-size: 16px; float:right;" >
						<i style="padding-right: 100px;"></i> <a href="${ContextPath }/home">&nbsp;정보
							시스템</a>
							<a   data-toggle="modal" data-target="#logoutModal"> 
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
					</a>
							</div>
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
					<img src="${ContextPath }/resources/assets/img/clients/logo3.jpg" width="100" height="100"
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
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" class="carousel slide carousel-fade"
				data-ride="carousel">

				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background: url(${ContextPath}/resources/assets/img/slide/pic-slide.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated animate__fadeInDown">
									GoSky 플래티넘스쿨 <span>에 오신걸 환영합니다</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">어르신이 활기찬
									인생2막을 열어가실 수 있도록, 어르신의 꿈이 되살아나 이루어지고, 배움의 기쁨이 충만해 질 수 있도록
									노력하겠습니다.</p>

							</div>
						</div>
					</div>

					<!-- Slide 2 -->
					<div class="carousel-item"
						style="background: url(${ContextPath}/resources/assets/img/slide/pic-slide2.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated fanimate__adeInDown">
									삶이 풍요로운 <span>어르신들의 세상을 만들어갑니다</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">삶의 가치를 소중히
									여기는 어르신의 행복 울타리,노년의 행복한 삶을 위해 다양한 프로그램을 통해 제 2의 청춘을 만들겠습니다.</p>

							</div>
						</div>
					</div>

					<!-- Slide 3 -->
					<div class="carousel-item"
						style="background: url(${ContextPath}/resources/assets/img/slide/pic-slide4.jpg)">
						<div class="carousel-container">
							<div class="carousel-content">
								<h2 class="animate__animated animate__fadeInDown">
									우리 모두의  <span>희망</span>
								</h2>
								<p class="animate__animated animate__fadeInUp">
									행복한 노년의 꿈을 이뤄갑시다</p>
								
							</div>
						</div>
					</div>

				</div>

				<a class="carousel-control-prev" href="#heroCarousel" role="button"
					data-slide="prev"> <span
					class="carousel-control-prev-icon icofont-rounded-left"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
					data-slide="next"> <span
					class="carousel-control-next-icon icofont-rounded-right"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<div id="content">
			<!-- Topbar -->
			

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800"></h1>
					<i class="fas fa-download fa-sm text-white-50"></i>
				</div>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
				</div>

			</div>
		</div>
		<div id="content">
			<!-- Topbar -->


			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800"></h1>
					<i class="fas fa-download fa-sm text-white-50"></i>
				</div>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
				</div>

			</div>
		</div>
		<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800"></h1>
					<i class="fas fa-download fa-sm text-white-50"></i>
				</div>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
				</div>

			</div>
		</div>
		<!-- End About Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">
			<br><br>
			<br><br>
			

				<div class="section-title" data-aos="fade-up">
					<h2>About Us</h2>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 d-flex align-items-stretch">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bxl-dribbble"></i>
							</div>
							<h4>
								<a href="userGreeting">GoSky 소개</a>
							</h4>
							<p>어르신들을 위한 다양한 프로그램으로 최고의 서비스 제공</p>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-file"></i>
							</div>
							<h4>
								<a href="SIntroForm2">프로그램</a>
							</h4>
							<p>쉽고 재미있게 배울 수 있는 프로그램을 제공함으로써 원하는 수업을 선택 가능</p>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div>
							<h4>
								<a href="userMap">찾아오시는 길</a>
							</h4>
							<p>어르신들을 위한 낙원, GoSky로 오시는 길을 알려드립니다.</p>
						</div>
					</div>


				</div>
		</section>
		<!-- End Services Section -->

		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients">
		
			<div class="container">

				<div class="section-title">
					<h2>Clients</h2>
					
				</div>

				<div class="owl-carousel clients-carousel">
					<img
						src="http://www.theheritage.kr/theme/s007/img/logo-1.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-2.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-3.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-4.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-5.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-1.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-2.png"
						alt=""> <img
						src="http://www.theheritage.kr/theme/s007/img/logo-3.png"
						alt="">
						<img
						src="http://www.theheritage.kr/theme/s007/img/logo-4.png"
						alt="">
				</div>

			</div>
		</section>
		<!-- End Clients Section -->

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