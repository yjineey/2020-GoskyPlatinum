<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<%
	boolean cid = false;
%>

<html>
<head>
<title>업무지시_작성</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />

<style>
	.ox{
		text-align:center;
		padding-top: 13px
	}
</style>

<script type="text/javascript">
	function checkRE(re, str){
		if(re.test(str.value))
			return true;
		return false;
	}
//체크
	function printIcon(check, pos) {
		if(check)
			$("#c"+pos).html("<i class='fa fa-times' style='color:red;' aria-hidden='true'></i>");
		else 
			$("#c"+pos).html("<i class='fa fa-check' style='color:green;' aria-hidden='true'></i>");
	}
	
	function duplicateCheck(pos) {
		var url = "${ContextPath}/signup/duplicateCheck";
		var paramData = {"key" : pos,
						 "id" : $("#fromid").val()};
		
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
			return cid = duplicateCheck(pos);
	}
	
	function checkIcon(pos) {
		printIcon(checkCorrect(pos), pos);	
	} 
	
	function clearInput(pos, check) {
		if(check) {
			alert('다시 입력하세요');
			document.getElementById(pos).value = "";
			document.getElementById(pos).focus();
			return true;
		}
		
		return false;
	}
	
	function checkVar() {
		if(clearInput('fromid',cid) )
			return false;

		return true;
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
				<!-- Topbar -->
				<c:import url="/WEB-INF/views/include/top.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">업무지시</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							강사에게 보여지는 업무지시 입니다 .
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">강사 업무지시 작성</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									
									<form class="form" onsubmit="return checkVar();" method="post" action="${ContextPath }/WorkListWrite">
											<div class="form-group">
											<label>받는사람 </label> <input type="text" id="fromid" name="fromid"
												class="form-control" required placeholder="받는사람을 입력하세요"
												onchange="checkIcon('id')" required>
											</div>
											<div id="cid" class="ox"></div>
											
											<div class="form-group">
												<label>제목</label> <input type="text" name='title'
													class="form-control" required placeholder="제목을 입력하세요">
											</div>
											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" name="content" rows="10"
													required placeholder="내용을 입력하세요"></textarea>
											</div>
											<div class="form-group" hidden>
												<label>작성자</label> <input class="form-control" name="toid"
													value="${userID }">
											</div>
						<c:if test="${msort eq 'm03'}">
											<div class="box-footer" align="center">
												<button type="submit" class="btn btn-primary">작성완료</button>
												<br>
											</div></c:if>
									</form>
								</div>
							</div>
						</div>
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