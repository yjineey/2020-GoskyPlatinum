<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>수강 신청 현황 자세히 보기</title>

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

					<div class="card shadow mb-4">
					
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">수강 신청 현황 자세히 보기</h4>
						</div>
						
						<div class="card-body" >
							<div class="table-responsive" >
							
								<form action="${ContextPath }/classApply/update" class="form-horizontal" method="post" >
									<input type="hidden" class="form-control" name="cano" value="${ca.cano }">
									<input type="hidden" class="form-control" name="pno" value="${ca.pno }">

									<div class="box-body" style="margin: 20px;">
										<div align="center">
											<div class="col-xl-6">
												<style>
												  	label.ln {
												  		float: left;
													}
												</style>
											
												<div class="form-group">
													<label class="ln">원생 이름</label>
													
													<input type="text" class="form-control" readonly value="${ca.pname }" />
												</div>
						
												<div class="form-group">
													<label class="ln">신청한 시간</label>
						
													<input type="text" class="form-control" readonly value="${ca.regdate }" />
												</div>
												
												<div class="form-group">
													<label class="ln">신청 달</label>
						
													<input type="text" name="month" class="form-control" required value="${ca.month }" />
												</div>
						
												<div class="form-group">
													<label class="ln">기타 사항</label>
						
													<textarea name="etc" class="form-control" rows="5"><c:if test="${not empty ca.etc }">${ca.etc }</c:if></textarea>
												</div>
												
												<div class="form-group">
													<label class="ln">상태</label>

													<div class="input-group col-sm-10">
												  		<style>
												  			label.cb {
												  				margin-top : 8px;
												  				margin-right:10px;
												  				margin-left :10px;
												  			}
												  		</style>
												  		
												      	<label class="cb"><input type="radio" name="status" value="0" checked> 수강 신청 </label>
												      	<label class="cb"><input type="radio" name="status" value="1" > 수강 중 </label>
												      	<label class="cb"><input type="radio" name="status" value="2" > 취소 </label>
													</div>
													
													<script>
														$(document).ready(function () {
															$('input:radio[name=status]:input[value="${ca.status}"]').attr("checked", true);
														})
													</script>
												</div>
												
												<c:if test="${not empty ca.sdate }">
													<div class="form-group">
														<label class="ln">최근 수정 시간</label>
							
														<input type="text" class="form-control" readonly value="${ca.sdate }" />
													</div>
												</c:if>
						
											</div>
										</div>
					
					
										<div class="box-footer" align="center">
											<button type="submit" class="btn btn-primary">수정</button>
										
											<button type="reset" class="btn btn-warning">취소</button>
											<br>
						
											<script type="text/javascript">
												$(function (){
													$(".btn-warning").click(function () {
														window.history.back();
													})
												})
											</script>
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
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	
	<!-- Scroll to Top Button-->
	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
	
</body>
</html>