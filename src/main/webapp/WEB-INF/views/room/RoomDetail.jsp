<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!DOCTYPE html>

<html>
<head>
<title>강의실 상세보기</title>

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
					<div>
						<class="d-sm-flexalign-items-centerjustify-content-betweenmb-4">
						<h1 class="h3 mb-0 text-gray-800">강의실 상세보기</h1>
					</div>

					<!-- Begin Page Content -->
					<div class="container-fluid">
<BR>
						<!-- Page Heading -->
						<p class="mb-4">
							관리자에게 보여지는 강의실 상세보기 입니다 
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강의실 상세보기</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<div class="box">

											<div class="box-body">
												<div class="box-body">
													<div class="form-group">
														<label>강의실 번호</label> <input type="text" name="roomno"
															style="width: 500px" class="form-control"
															value="${list.roomno}" />
													</div>

													<div class="form-group">
														<label>강의실 이름</label>
														<textarea name="rname" id="rname" style="width: 500px"
															class="form-control">${list.rname}</textarea>
													</div>

													<div class="form-group">
														<label>담당자</label> <input type="text" name="rmanager"
															id="rmanager" style="width: 500px" class="form-control"
															value="${list.rmanager}" />
													</div>
													<div class="form-group">
														<label>장소</label> <input type="text" name="content"
															id="content2" class="form-control" style="width: 500px"
															value="${list.content}" />
													</div>


													<div class="input">
														<label>주소</label>

														<p>
															<input type="text" name="post" class="box"
																id="sample4_postcode" placeholder="우편번호" required>
															<button type="button" class="btn-primary box" 
																 onclick="sample4_execDaumPostcode()">우편번호
																찾기</button>
															<br>
														</p>

														<p>

															<input type="text" name="roadAddress" class="box"
																id="sample4_roadAddress" placeholder="도로명주소"
																style="width:500px" value="${list.address}" required>

															
														</p>


													</div>
												</div>
											</div>
											<div class="box-footer" align="left">
												<form role="form" method="post">
													<input type="hidden" name="roomno" value="${list.roomno}">
													<input type="hidden" name="page"
														value="${searchPaging.page}"> <input type="hidden"
														name="perPageNum" value="${searchPaging.perPageNum}">
													<input type="hidden" name="searchType"
														value="${searchPaging.searchType}"> <input
														type="hidden" name="keyword"
														value="${searchPaging.keyword}">

												</form>
												<button class="btn btn-success" id="update">수정</button>
												<button class="btn btn-primary" id="cancleUpdate">수정취소</button>
												<button class="btn btn-danger" id="delete">삭제</button>
												<br> <br>
											</div>
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
	<script>
		//수정취소
		$('#cancleUpdate').on('click', function() {
			location.href = "RoomList"
		});
		//삭제
		$('#delete').on('click', function() {
			location.href = "RoomDelete?roomno=" + ${list.roomno};
		});
	</script>


	<script type="text/javascript">
		//수정
		$('#update').on("click", function() {
			var url = "${ContextPath}/RoomUpdate";
			var paramData = {
				"roomno" : "${list.roomno}",
				"rname" : $("#rname").val(),
				"rmanager" : $("#rmanager").val(),
				"content" : $("#content2").val(),
				"post": $("#sample4_postcode").val(),
				"roadAddress" : $("#sample4_roadAddress").val(),
				
			};

			$.ajax({
				type : 'POST',
				url : url,
				data : paramData,
				dataType : 'json',

				async : false,

				success : function(result) {
					alert("수정에 성공하였습니다.");
				},

				error : function() {
					alert("수정에 실패하였습니다");
				}
			});
		});
	</script>
	<script>
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
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


</body>

</html>