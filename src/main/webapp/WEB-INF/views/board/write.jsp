<%@page import="kr.co.gugu.domain.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
<title>글쓰기</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<script src="${ContextPath }/resources/ckeditor/ckeditor.js"></script>

<style>
	.ck.ck-editor {
		max-width: 100%;
	}

	.ck-editor__editable {
		min-height: 500px;
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
			<div id="content">
				
				<c:import url="/WEB-INF/views/include/top.jsp" />
				

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="row">
						<div class="d-sm-flex align-items-center justify-content-between mb-4" id="pageHeading1"></div>
					
						<c:choose>
							<c:when test="${empty board }">
								<div class="d-sm-flex align-items-center justify-content-between mb-4"> 
									<h1 class="h3 mb-0 text-gray-800">&nbsp;[게시글 쓰기]</h1> 
								</div>
							</c:when>
							<c:otherwise>
								<div class="d-sm-flex align-items-center justify-content-between mb-4"> 
									<h1 class="h3 mb-0 text-gray-800">&nbsp;[게시글 수정]</h1> 
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>

					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
						
							<div class="card-header py-3">
								<c:choose>
									<c:when test="${empty board }">
										<h6 class="m-0 font-weight-bold text-primary">글쓰기</h6>
									</c:when>
									<c:otherwise>
										<h6 class="m-0 font-weight-bold text-primary">수정</h6>
									</c:otherwise>
								</c:choose>
							</div>
							
							<div class="card-body">
								<div class="table-responsive">
								
								
								<c:choose>
									<c:when test="${empty board }">
										<form action="${ContextPath }/board/write" class="form-horizontal" method="post" enctype="multipart/form-data">
									</c:when>
										
									<c:otherwise>
										<form action="${ContextPath }/board/update" class="form-horizontal" method="post" enctype="multipart/form-data">
											<input type="hidden" class="form-control" name="bno" value="${board.bno }">
									</c:otherwise>
								</c:choose>
								
										<div class="box-body">
											<div class="form-group" hidden>
												<input type="hidden" class="form-control" name="mid" value="${userID }">
												<input type="hidden" class="form-control" name="bsort" value="${bsort }">
												
												<input type="hidden" class="form-control" name="page" value="${searchPaging.page}"> 
												<input type="hidden" class="form-control" name="perPageNum" value="${searchPaging.perPageNum}">
												<input type="hidden" class="form-control" name="searchType" value="${searchPaging.searchType}"> 
												<input type="hidden" class="form-control" name="keyword" value="${searchPaging.keyword}">
											</div>
											
											<div class="form-group">
												<label>제목</label> 
												
												<c:choose>
													<c:when test="${empty board }">
														<input type="text" name='btitle' id="btitle" class="form-control" required placeholder="제목을 입력하세요">
													</c:when>
														
													<c:otherwise>
														<input type="text" name='btitle' id="btitle" class="form-control" 
														required placeholder="제목을 입력하세요" value="${board.btitle }">
													</c:otherwise>
												</c:choose>
												
											</div>
											
											<div class="form-group">
												<label>내용</label>
												
												<c:choose>
													<c:when test="${empty board }">
														<textarea class="form-control" name="bcontent" id="bcontent" required></textarea>
													</c:when>
													<c:otherwise>
														<textarea class="form-control" name="bcontent" id="bcontent" required>${board.bcontent }</textarea>
													</c:otherwise>
												</c:choose>
												
												<script type="text/javascript">
													var editor = CKEDITOR.replace( 'bcontent', {
														height: 500,
													    extraPlugins: 'notification'
													});
	
													editor.on( 'required', function( evt ) {
													    editor.showNotification( 'This field is required.', 'warning' );
													    evt.cancel();
													} );
												</script>
											</div>
											
											<div class="inputArea">                                 
			                                 <!--  --><label>첨부파일</label><br> 
			                                 
			                                 
			                                 	<c:choose>
													<c:when test="${empty board }">
			                                 		   <input type="file" id="write" name="file" /><div class="select_img"><img src="" /></div>
													</c:when>
												<c:otherwise>
														<input type="file" id="upload" name="file" /><div class="update_img">
                                     					 <img src="${pageContext.request.contextPath}/resources/${board.supload}" width="250ox" height="250px"/>&nbsp;
                                    				  <input type="hidden" id="write" value="${board.supload}" /></div>												</c:otherwise>
												</c:choose>
												
			                                  <script>
			                                   $("#write").change(function(){
			                                    if(this.files && this.files[0]) {
			                                     var reader = new FileReader;
			                                     reader.onload = function(data) {
			                                      $(".select_img img").attr("src", data.target.result).width(500);        
			                                     }
			                                     reader.readAsDataURL(this.files[0]);
			                                    }
			                                   });
			                                  </script>
			                                   <script>
			                                   $("#upload").change(function(){
			                                    if(this.files && this.files[0]) {
			                                     var reader = new FileReader;
			                                     reader.onload = function(data) {
			                                      $(".update_img img").attr("src", data.target.result).width(500);        
			                                     }
			                                     reader.readAsDataURL(this.files[0]);
			                                    }
			                                   });
			                                  </script>
			                                  </div>
											
											<div class="box-footer" align="center">
											
												<c:choose>
													<c:when test="${empty board }">
														<button type="submit" class="btn btn-primary">등록</button>
													</c:when>
													
													<c:otherwise>
														<button type="submit" class="btn btn-primary">수정</button>
													</c:otherwise>
												</c:choose>
											
												<button type="reset" class="btn btn-warning">취소</button>
												<br>
												
												<script type="text/javascript">
													$(function (){
														$(".btn-warning").click(function () {
															location.href="${ContextPath}/board/list${pageMaker.makeSearch(bsort, pageMaker.paging.page)}";
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
				
			</div>
			<!-- End of Main Content -->

			<c:import url="/WEB-INF/views/include/footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<c:import url="/WEB-INF/views/include/page-top-scroll.jsp" />

	<c:import url="/WEB-INF/views/board/include/heading.jsp" />
	
</body>
</html>