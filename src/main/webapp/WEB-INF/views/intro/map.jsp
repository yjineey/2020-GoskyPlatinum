<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>공지사항목록</title>

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
						<h1 class="h3 mb-0 text-gray-800">'GoSky플레티넘스쿨' 찾아오시는 길</h1>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							GoSky플레티넘스쿨을 방문해 주셔서 감사합니다. <a target="_blank" href="#"></a>.
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">찾아오는길</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive" align="center">

									<!-- Page Heading -->
									<div id="map" style="width: 1200px; height: 600px;"></div>
									<script type="text/javascript"
										src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e005321d2821755d827e3a4f710f70bf"></script>
									<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(37.438724, 126.675080), // 지도의 중심좌표
									level : 2	// 지도의 확대 레벨
								};
								var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
								function setCenter() {
									// 이동할 위도 경도 위치를 생성합니다 
									var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
		
									// 지도 중심을 이동 시킵니다
									map.setCenter(moveLatLon);
								}
		
								function panTo() {
									// 이동할 위도 경도 위치를 생성합니다 
									var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
									// 지도 중심을 부드럽게 이동시킵니다
									map.panTo(moveLatLon);
								}
							</script>
									<script>
								// 지도를 클릭한 위치에 표출할 마커입니다
								var marker = new kakao.maps.Marker({
									// 지도 중심좌표에 마커를 생성합니다 
									position : map.getCenter()
								});
								// 지도에 마커를 표시합니다
								marker.setMap(map);
								// 지도에 클릭 이벤트를 등록합니다
								// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
								kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
									// 클릭한 위도, 경도 정보를 가져옵니다 
									var latlng = mouseEvent.latLng;
									// 마커 위치를 클릭한 위치로 옮깁니다
									marker.setPosition(latlng);
									var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, '; message += '경도는 ' + latlng.getLng() + ' 입니다';
									var resultDiv = document .getElementById('clickLatlng');
									resultDiv.innerHTML = message;

										});
									</script>
									<br>
									<table class="table table-bordered col-sm-10">
										<thead class="thead-light">
											<tr>
												<th align="center">CONTACT</th>
												<th>오시는길</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<p>※ 주소: 인천시 미추홀구 대왕판교로 </p>
													<p>※ E-mail: theheritage_kr@naver.com</p>
													<p>※ 상담문의: 032.123.5678</p>
													<p>☎  HP: 010.9876.5432</p>
													<p>☎ FAX: 031.0000.0000</p>
												</td>

												<td>
													<p>※ 서울-강남 20분 거리의 편리한 접근성 23국도, 분당-수서 간 고속화도로, 서울-용인 간
														고속도로, 경부고속도로 서울요금소 인접</p>
													<p>※ 전철 이용 시 주안역  2번출구 7번 마을버스 승차 후 하차 / 1111번 신동아아파트 앞 하차</p>
												</td>

											</tr>
										</tbody>
									</table>
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
		</div>
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</body>
</html>