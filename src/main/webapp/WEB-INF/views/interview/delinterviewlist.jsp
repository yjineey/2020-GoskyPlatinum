
			
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>관리자 받은 상담리스트</title>

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
						<h1 class="h3 mb-0 text-gray-800">휴지통</h1>
					</div>
					
<!-- 내용 시작 -->	
<!-- 상담내역의 메뉴모음 -->	
					<div class="row">
					 	 <div class="col-md-9">
					  		
					 	 </div>
					  </div>
					
					  
					 
					
						<div class="row">
							<div class="col-md-2">
								<c:import url="/WEB-INF/views/interview/menuinterview.jsp" />
							 </div>
							 
							 
					 	 <div class="col-md-10">
					 		 <c:import url="/WEB-INF/views/interview/topinterview.jsp" />
					 		 	<br><br><br>
					  	<!-- 리스트 테이블  -->									
						 <div class="table-responsive">
							 <table class="table">
								  <tr>
								  	<td>선택</td>
								  	<td>상담번호</td>
								  	<td>제목</td>
								  	<td>작성자</td>
								  	<td>작성날짜</td>
								  	
								  </tr>
								  
								<c:forEach var="message" items="${list}">
								 	<tr>
									<td>
			 							<div class="radio">
  											<label>
   												 <input type="radio" name="blankRadio" id="blankRadio1" value="${message.msno }" aria-label="...">
 				 							</label>
										</div>
									</td>
								 	<td>${message.msno}</td>
								 	<td><a href="delinterviewdetail?msno=${message.msno}"> ${message.title} </a></td>
								 	<td>${message.toid}</td>
								 	<td>${message.regdate}</td>
								 </tr>
								</c:forEach>
							 </table>
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
</html>