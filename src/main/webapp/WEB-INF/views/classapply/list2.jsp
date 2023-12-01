<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>수강 신청 현황</title>

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
			<div id="main-content">
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				
				<!-- Begin Page Content -->
				<div class="container-fluid">
				
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
				
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">수강 신청 현황</h6>
						</div>
				
						<div class="card-body">
							<div class="table-responsive">

								
								<c:import url="/WEB-INF/views/classapply/include/search2.jsp" />
								
								<c:import url="/WEB-INF/views/classapply/include/list-card2.jsp" />
								
							</div>
						</div>
					</div>
					
					
					
				</div>
				
			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
</body>
<script type="text/javascript">
$(document).ready(function() {
			//상황에 따른 메시지 확인
				var result = '<c:out value="${result}"/>';
						checkModal(result);
						history.replaceState({}, null, null);
						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html("수강신청이 완료되었습니다");
							}
							$("#myModal").modal("show");
						}
});
</script>
</html>