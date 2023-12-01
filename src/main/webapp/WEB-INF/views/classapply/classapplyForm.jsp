<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>
<head>
<title>과목보기</title>

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
						<h1 class="h3 mb-0 text-gray-800">수강신청하기</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							현재 회원님의 계정에 연결된 회원을 확인하세요
						</p>
					</div>
		
		
		
		
		<section class="content">
		
						<form role="form" method="post">
							<div class="box-body">
								<div class="form-group">
									<label>원생선택</label>
									
									<select  class="form-control" name ="pno" >
  
									<c:forEach var="people" items="${people}">
  									<option value="${people.pno}">
									${people.pname}(${people.pinfo }) 
									 
									</option>
									</c:forEach>
									</select>
								</div>
								
							<div class="form-group">
								<label>기타사항</label>
								<textarea class="form-control" name="etc" rows="3"
									placeholder="주의사항을 입력해주세요"></textarea>
								</div>
								
								
							<div class="form-group">
								<label>신청 월</label>
								<select  class="form-control" name ="month" >
 
  									<option value="${month}">${month}</option>
  									<option value="${nextmonth }">${nextmonth }</option>
  									
									</select>
								
								
								</div>	
							
							
							</div>
							
							
				
		
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">수강신청</button>
							</div>
						</form>
					</section>	
		
		
		
	
		 
							
		
		
	
	
	
	
	
	
	
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