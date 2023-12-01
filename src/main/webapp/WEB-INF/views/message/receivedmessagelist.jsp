<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>받은메세지</title>

	<c:import url="/include/setting/meta.jsp" />
	<c:import url="/include/setting/css-main.jsp" />
</head>

	
</body>
</html>

<script>

//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;

		var range = range - 1;

		

		var url = "/receivedmessagelist";

		url = url + "?page=" + page;

		url = url + "&range=" + range;

		

		location.href = url;

	}



  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${ContextPath}/receivedmessagelist";

		url = url + "?page=" + page;

		url = url + "&range=" + range;



		location.href = url;	

	}



	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;

		var range = parseInt(range) + 1;

		

		var url = "${ContextPath}/sendmessagelist";

		url = url + "?page=" + page;

		url = url + "&range=" + range;

		

		location.href = url;

	}

</script>

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
						<h1 class="h3 mb-0 text-gray-800">받은메세지</h1>
					</div>
					
<!-- 내용 시작 -->	
<!-- 상담내역의 메뉴모음 -->	
					<div class="row">
					 	 <div class="col-md-9">
					  		
					 	 </div>
					  </div>
					
					  
					 
					
						<div class="row">
							<div class="col-md-2">
								<c:import url="/WEB-INF/views/message/menumessage.jsp" />
							 </div>
							 
							 
					 	 <div class="col-md-10">
					 		 <c:import url="/WEB-INF/views/message/topmessage.jsp" />
					 		 	<br><br><br>
					 		 	
					 		 	
					 		 	
					  	<!-- 리스트 테이블  -->									
						 <div class="table-responsive">
							 <table class="table">
								  <tr>
								  	<td>선택</td>
								  	<td>메세지번호</td>
								  	<td>제목</td> 
								  	<td>작성자</td>
								  	<td>작성날짜</td>
								  	<td>조회수</td>
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
								 	<td><a href="messagedetail?msno=${message.msno}"> ${message.title} </a></td>
								 	<td>${message.toid}</td>
								 	<td>${message.regdate}</td>
								 	<td>조회수</td>
								 </tr>
								</c:forEach>
							 </table>
							</div>	
							
			<!-- 페이징 -->
						<div id="paginationBox">
							<ul class="pagination">
								<c:if test="${pagination.prev}">
									<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', 
										'${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
									</c:if>
								<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
									<li class="page-item 
										<c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
									<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
								</c:forEach>
								
								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
										'${pagination.range}', '${pagination.rangeSize}')" >다음</a></li>
									</c:if>
								</ul>
							</div>

	<!-- 페이징 끝 -->	
						
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
	

	
