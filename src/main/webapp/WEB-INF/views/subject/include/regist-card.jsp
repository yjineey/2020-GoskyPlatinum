<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Begin Page Content -->
<div class="container-fluid">
				
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
				
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">강의 ${empty subject ? '등록' : '조회 및 수정'}</h6>
		</div>
						
		<div class="card-body">
			<div class="table-responsive">
			
				<form action="${ContextPath }/subject/${empty subject ? 'regist' : 'update'}" class="form-horizontal" method="post">
					<c:if test="${not empty subject }">
						<input type="hidden" class="form-control" name="sno" value="${subject.sno }">
					</c:if>			
				
					<div class="box-body">
						<div class="row" style="margin: 20px;">
							<div class="col-xl-10" style="margin: auto;">
										
								<c:import url="/WEB-INF/views/subject/include/classA.jsp" />
										
								<c:import url="/WEB-INF/views/subject/include/classB.jsp" />
										
							</div>
						</div>
									
						<div class="box-footer" align="center">
							<button type="submit" class="btn btn-primary">${empty subject ? '등록' : '수정' }</button>
							<button type="reset" class="btn btn-warning">취소</button>
							<br>
				
							<script type="text/javascript">
								$(function (){
									$(".btn-warning").click(function () {
										window.history.back();
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
