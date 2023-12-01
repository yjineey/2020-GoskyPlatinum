<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>인삿말</title>
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
	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">

					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							
							<div class="card-body">
								<div class="table-responsive">

									<!--CSS: 센터소개-->
									<link rel="stylesheet" href="http://www.theheritage.kr/theme/s007/index/company_02.css">

									<!--센터소개-->
									<div id="company_02">
										<div class="clearfix">
											<div class="col-md-12 p-none">
												<p class="top_ment">
													"부모님들이 우리의 어린 시절을 꾸며주셨으니<br> 이제, 우리가 <span
														class="under_pen_effec">부모님의 인생을 더 아름답게</span> 꾸며드리고자
													합니다."
												</p>
												<img src="${ContextPath }/resources/imgUpload/intro.jpg" 	width="1000" height="400">
												<p>
													<b>안녕하십니까?<br> 저희  "GoSky플레티넘스쿨" 홈페이지를 찾아 주신 여러분께 진심으로
														감사드립니다.
													</b>
												</p>
												<p>
													OECD 주요 국가들 중 가장 빠른 고령화 추세를 보이고 있는 우리나라는 2020년 현재 전체 인구의
													약 17% 이상이 만 65세 이상으로 2025년에는 전체 인구의 20% 이상이 노령인구에 속하는 초
													고령사회로 진입할 것으로 예상되고 있습니다. 어르신들에 대한 부양 문제는 비단 가족들만의 문제가 아닌
													국가와 지역사회에서도 함께 고민해야 하는 사회적 과제로 인식되고 있으며 이를 해결하기 위한 실질적
													대안으로는 요양원과 노인복지시설에 대한 대안이 절실할 때입니다.<br><br>													
													
													이러한 시대적 요구에 발맞춰
													GoSky플레티넘스쿨은 대한민국 대표 요양보호센터로 자리매김하겠다는 각오로 어르신 한 분 한 분께 정성과 사랑으로
													참된 효(孝)를 실천하고 있습니다.
												</p>
											
												<p>
													<b>저희 GoSky플레티넘스쿨은
													<br>전문 요양보호사들이 어르신들을 위해 쾌적하고 청결한 상태를 유지하고 있으며,
													<br>사회복지사는 프로그램의 다양화로 즐겁고 활기찬 생활을 드리고,
													<br> 영양사는 기호도 및 선호도에 따른 건강한 식단을 준비하여  
													<br>항상 어르신들께 기쁨과 만족을 드리고자 최선을 다하고 있습니다
														
													</b>
												</p>
												<p>어린 왕자로 유명한 프랑스 작가 생텍쥐페리(1900~1944)는 “부모님들이 우리의 어린 시절을
													꾸며 주셨으니 우리는 그들의 말년을 아름답게 꾸며드려야 한다.”라는 말과 같이 저희 GoSky플레티넘스쿨은
													생텍쥐페리가 남긴 명언처럼 부모님을 모시는 따뜻하고 정성된 마음으로 어르신들의 말년을 진정 아름답게 꾸며
													드릴 것을 약속드립니다. 편안하고 쾌적한 환경에서 즐겁고 건강한 생활을 누리시도록 최선을 다하겠습니다.</p>
												<p>감사합니다.</p>

												<p class="m-none col-md-12 p-none text-right">
													GoSky플레티넘스쿨(주) <span class="sign">대표 이권희</span>
											</div>
										</div>
									</div>
								</div>
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