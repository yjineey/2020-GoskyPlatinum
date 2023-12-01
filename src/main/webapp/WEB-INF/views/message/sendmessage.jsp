
			
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
	<title>메세지 보내기</title>

	<c:import url="/include/setting/meta.jsp" />
	<c:import url="/include/setting/css-main.jsp" />
<style>
	.ox{
		text-align:left;
		padding-top: 13px
	}
</style>

<script type="text/javascript">
	
	

	function printIcon(check, pos) {
		if(check)
			$("#c"+pos).html("<i class='fa fa-times' style='color:red;' aria-hidden='true'></i>");
		else 
			$("#c"+pos).html("<i class='fa fa-check' style='color:green;' aria-hidden='true'></i>");
	}
	
	
	function duplicateCheck(pos) {
		var url = "${ContextPath}/signup/duplicateCheck";
		var paramData = {"key" : pos,
						 "id" : $("#id").val(),
						 "email" : $("#email").val()};
		
		var check;
		
		$.ajax({
			type: 'GET',
			url: url,
			data: paramData,
			dataType: 'json',
			
			async : false,
			
			success : function (result) {
				check = result;
			},
		
			error : function () {
				alert('error');
			}
		});
		
		return check;
	}

	
	
	function checkCorrect(pos) {
		if(pos == "id") 
			return cid =  duplicateCheck(pos);
	}
	
	
	
	function checkIcon(pos) {
		var check = checkCorrect(pos);
		printIcon(check, pos);
		
		var button_joinus = document.getElementById('btn');
		button_joinus.disabled = check;
		
		return check;
	} 
	
	
	
	
</script>
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
						<h1 class="h3 mb-0 text-gray-800">메세지쓰기</h1>
					</div>
					
<!-- 내용 시작 -->	

					
			<div class="row">
				<div class="col-md-2">
					<c:import url="/WEB-INF/views/message/menumessage.jsp" />
				 </div>
						 
						
			
					 		 
  <!--작성폼 -->
  				<div class="col-md-10">
					<section class="content">
							<div class="box-header">
								<h3 class="box-title">작성해주세요</h3>
							</div>
		
		
		
		<form  action="${ContextPath }/sendmessage" role="form" method="post">
						
						
						
						
						
			<div class="box-body">
						
				<c:choose >
					<c:when test="${empty fromid }">
						
						<div class="form-group">
							<label>받는사람</label>
								<input type="text" 
									class="form-control form-control-user"
									id="id" name="fromid" placeholder="ID" maxlength="20" onchange="checkIcon('id')" required>
							
							<div id="cid" class="ox"></div>
							
						</div>
					</c:when> 
					
					<c:otherwise>
						<div class="form-group">
							<label>받는사람</label>
								<input type="text" 
									class="form-control form-control-user"
									name="fromid" placeholder="ID" maxlength="20" value="${fromid }" readonly>
						</div>
					</c:otherwise>
						</c:choose>
				
						
						
						
							<div class="box-body">
								<div class="form-group">
									<label>제목</label> <input type="text"
										name='title' class="form-control" placeholder="제목을 입력하세요" required>
								</div>
								
								<div class="form-group">
									<label>내용</label>
								<textarea class="form-control" name="content" rows="3"
									placeholder="내용을 입력하세요" required></textarea>
								</div>
								
		
		
				
							<div class="form-group">
									<label>작성자</label> <input type="text" name="toid" class="form-control"  
											value="${userID}" readonly>
								</div>
					
						
						
						
								<c:choose >
									<c:when test="${empty fromid }">
											<div class="box-footer">
												<button id="btn" disabled type="submit" class="btn btn-danger" >작성완료</button>
											</div>						
									</c:when> 
									
									<c:otherwise>
											<div class="box-footer">
												<button id="btn2"  type="submit" class="btn btn-danger" >작성완료</button>
											</div>
									</c:otherwise>
								</c:choose>							
							
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