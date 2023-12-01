<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>강의 등록</title>

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
						<h1 class="h3 mb-0 text-gray-800">강의실 등록</h1>

					</div>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">강의실 등록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form role="form" method="post" action="${ContextPath}/AddRoom">
									<div class="box-body">
										<div class="form-group">
											<label>강의실 번호</label> <input type="text" name='rname'
												id="rname" class="form-control" style="width: 500px"
												required placeholder="예약하실 강의실 번호를 입력하세요">
										</div>
										<div class="form-group">
											<label>강사 번호</label> <input type="text" name='rmanager'
												id="rmanager" class="form-control" style="width: 500px"
												required placeholder="강사 번호를 입력하세요">
										</div>
										<div class="form-group">
											<label>장소</label> <input type="text" name='content'
												id="content" class="form-control" style="width: 500px"
												required placeholder="장소를 입력하세요">
										</div>
										<div class="input"> 주소
										<p>
											<input type="text" name="post" class="box"
												id="sample4_postcode" placeholder="우편번호" required>
												<input type="button" class="btn-primary box"
												onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
										</p>
										<p>
										
											<input type="text" name="roadAddress" class="box"
												id="sample4_roadAddress" placeholder="도로명주소" style="width: 500px" required>
										
										</p>
										</div>

										<div class="box-footer" align="center">
											<button type="submit" class="btn btn-primary">작성완료</button>
											<br>
										</div>
									</div>
								</form>
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
	$('.btn-primary"').on('click', function() {
		alert("강의실이 등록되었습니다")
		location.href = "RoomList"
	});

	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						alert(fullRoadAddr);
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						
					}
				}).open();
	}
</script>

</html>