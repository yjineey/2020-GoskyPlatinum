<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>관리자 받은상담 디테일</title>

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
						<h1 class="h3 mb-0 text-gray-800">상담내용 보기</h1>
							
					</div>
					
<!-- 내용 시작 -->			
					
							
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${detail.title}" readonly="readonly" />
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${detail.content}</textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${detail.toid}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>작성일</label> <input type="text" name="id"
						class="form-control" value="${detail.regdate}" readonly="readonly" />
				</div>
				
				
				
				
				<div class="box-footer">
			<button class="btn btn-success">메인</button>
			<button class="btn btn-warning">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
			
		</div>
				<script>
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href="./";
		});
		//목록 버튼을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="receivedinterview";
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-danger").click(function(){
			location.href="interview/delete?msno=" + ${detail.msno};
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-warning").click(function(){
			location.href="interview/update?msno=" + ${detail.msno};
		});
		
		
	})
	</script>
				

	<hr>
	
	<c:import url="/WEB-INF/views/interview/include/getReply.jsp" />
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