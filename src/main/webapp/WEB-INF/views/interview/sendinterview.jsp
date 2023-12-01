
			
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>상담쓰기</title>

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
						<h1 class="h3 mb-0 text-gray-800">상담하기</h1>
					</div>
					
<!-- 내용 시작 -->	

					
			<div class="row">
				<div class="col-md-2">
					<c:import url="/WEB-INF/views/interview/menuinterview.jsp" />
				 </div>
						 
						
			
					 		 
  <!--작성폼 -->
  				<div class="col-md-10">
					<section class="content">
							<div class="box-header">
								<h3 class="box-title">작성해주세요</h3>
							</div>
		
						<form role="form" method="post">
							<div class="box-body">
								<div class="form-group">
									<label>제목</label> <input type="text"
										name='title' class="form-control" placeholder="제목을 입력하세요">
								</div>
								
								<div class="form-group">
									<label>내용</label>
								<textarea class="form-control" name="content" rows="3"
									placeholder="내용을 입력하세요"></textarea>
								</div>
		
								<div class="form-group">
									<label>작성자</label> <input type="text" name="toid" class="form-control"  
										value="${userID}" readonly>
								</div>
							</div>
				
		
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">작성완료</button>
							</div>
						</form>
					</section>				
				</div>		
			</div> <!-- r -->
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