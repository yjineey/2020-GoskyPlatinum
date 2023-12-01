<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>댓글</title>

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
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				
				
 
<!-- 제목 -->
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">댓글</h1>
							
					</div>
					
<!-- 내용 시작 -->			
					
					
							<a href="#">
								<div class="col-lg-2 mb-4" >
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											
											상담하기
											
											<div class="text-white-50 small">원장에게</div>
										</div>
									</div>
								</div>
								</a>
								
								<div class="col-lg-2 mb-4">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											
											받은상담
											<div class="text-white-50 small">관리자만</div>
										</div>
									</div>
								</div>
								
								<div class="col-lg-2 mb-4">
									<div class="card bg-primary text-white shadow">
										<div class="card-body">
											
											상담내역
											<div class="text-white-50 small">내가쓴 상담</div>
										</div>
									</div>
								</div>
		
								
								
								<div class="col-lg-2 mb-4">
									<div class="card bg-dark text-white shadow">
										<div class="card-body">
											
											휴지통
										</div>
									</div>
								</div>
								
								<div class="col-lg-2 mb-4">
									<div class="card bg-dark text-white shadow">
										<div class="card-body">
											
											휴지통 비우기
										</div>
									</div>
								</div>
								
									
		 <div class="table-responsive">
			  <table class="table">
			  <tr>
			  	<td>상담번호</td>
			  	<td>작성자</td>
			  	<td>제목</td> 
			  	<td>작성날짜</td>
			  	<td>조회수</td>
			  </tr>
			  
			<c:forEach var="message" items="${list}">
			 	<tr>
			 	<td>${message.msno}</td>
			 	<td>$${message.to}</td>
			 	<td><a href="detail?bno=${message.msno}"> ${message.title} </a></td>
			 	<td>${message.to}</td>
			 	<td>${message.regdate}</td>
			 	<td><span class="badge">${message.readcnt}</span></td>
			 	</tr>
			</c:forEach>
			
			<tr>
			<td colspan="5" align="center">
			<input class="btn btn-success" type="button" value="메인으로" id="main" />
			
			</td>
			</tr>
			  </table>
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
</html>