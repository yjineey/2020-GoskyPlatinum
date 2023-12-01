<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<%@ page import="kr.co.gugu.domain.*"%>
<!DOCTYPE html>

<%
	BoardDTO board = (BoardDTO) request.getAttribute("board");
	int pageNo = 1;
	if(request.getAttribute("pageNo") != null)
		pageNo = Integer.parseInt((String) request.getAttribute("pageNo"));
%>

<html>
<head>
<title>View</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<style>
	div.textarea-content {
		width: 100%;
		height: 500px;
		overflow: auto;
		text-align: left;
	}
	
	.reply {
		resize: none;
		width: 100%;
		height: 100px;
		text-align: left;
	}
</style>

</head>

<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="/WEB-INF/views/include/nav.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div>
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="row">
						<div class="d-sm-flex align-items-center justify-content-between mb-4" id="pageHeading1"></div>
						<div class="d-sm-flex align-items-center justify-content-between mb-4"> 
							<h1 class="h3 mb-0 text-gray-800"></h1> 
						</div>
					</div>

				</div>
				
				<!-- Begin Page Content -->
				<div class="container-fluid">
				
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">글 자세히 보기</h6>
						</div>
						
						<div class="card-body">
							<div class="table-responsive">
								<section class="content">
									<div class="box">
										<c:if test="${userID==board.mid}">
											<div class="box-footer" align="left">
												<button class="btn btn-primary" id="boardUpdate">게시글
													수정</button>
												<a href="#" data-toggle="modal" data-target="#deleteModal">
													<button class="btn btn-danger" id="boardDelete">게시글
														삭제</button>
												</a> <br>
											</div>
										</c:if>

										<table align="right" board="1">
											<td>게시글번호 :</td>
											<td>${board.bno}</td>
											<td style="padding-left: 50px">작성자 :</td>
											<td>${board.mname}</td>
											<td style="padding-left: 50px">작성일 :</td>
											<td>${board.regdate}</td>
										</table>
										<br>

										<div class="box-body">
											<div class="form-group">
												<label>제목</label>
												<div class="form-control " id="btitle" name="btitle">${board.btitle}</div>
											</div>

											<div class="form-group">
												<label>내용</label>
												<div class="form-control textarea-content" id="bcontent"
													name="bcontent">${board.bcontent}</div>
											</div>

									</div>
									 	<c:if test="${not empty board.supload }">
											<div class="inputArea">
												<label for="supload">첨부파일</label><br> 
												<img src="${pageContext.request.contextPath}/resources/${board.supload}" width="550" height="350px" />&nbsp;
											</div>
										</c:if>
									</div>

									<div class="box-footer" align="center">
										<button class="btn btn-primary" id="goList">목록</button>
									</div>

									<script type="text/javascript">
										$(function() {
											$("#boardUpdate")
													.click(
															function() {
																location.href = "${ContextPath}/board/write${pageMaker.makeSearch(bsort, pageMaker.paging.page)}&bno=${board.bno}";
															})

											$("#goList")
													.click(
															function() {
																location.href = "${ContextPath}/board/list${pageMaker.makeSearch(bsort, pageMaker.paging.page)}";
															})
										})
									</script>
									</div>
								</section>
							</div>
						</div>
					</div>
					
					<c:import url="/WEB-INF/views/board/include/getReply.jsp" />
					
			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />
	
	<!-- Logout Modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">현재 게시글을 삭제를 원하시면 "삭제"를 선택하십시오.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					
					<form action="${ContextPath}/board/delete${pageMaker.makeSearch(bsort, pageMaker.paging.page)}&bno=${board.bno}" method="post">
						<input class="btn btn-danger" type="submit" value="삭제">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/board/include/heading.jsp" />
	
</body>
</html>