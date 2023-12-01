<%@page import="kr.co.gugu.domain.ActDTO"%>
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
			<h6 class="m-0 font-weight-bold text-primary">종목 ${empty act ? '등록' : '조회 및 수정'}</h6>
		</div>

		<div class="card-body">
			<div class="table-responsive">

				<form action="${ContextPath }/act/${empty act ? 'regist' : 'update'}" class="form-horizontal" method="post">
					<c:if test="${not empty act }">
						<input type="hidden" class="form-control" name="ssno" value="${act.ssno }">
					</c:if>

				<div class="box-body">
					<div class="row" style="margin: 20px;">
					<div class="col-xl-6">
						<div class="form-group">
							<label>종목 이름</label>
							
							<input type="text" name="name" id="name" class="form-control" required placeholder="종목 이름"
							<c:if test="${not empty act }">value="${act.name }"</c:if>>
						</div>
						
						<div class="form-group">
							<label>종목 이미지</label>

							<input type="text" name="img" id="img" class="form-control" required placeholder="종목 이미지"
							<c:if test="${not empty act }">value="${act.img }"</c:if> onchange="readImage();">
						</div>
						
						<div class="form-group">
							<label>종목 소개</label>

							<textarea name="intro" id="intro" class="form-control" required placeholder="종목 소개"  rows="5"
							 onchange="readImage();"><c:if test="${not empty act }">${act.intro }</c:if></textarea>
	
						</div>
						
						<div class="form-group">
							<label>강의실</label>

							<div class="col-xl-12" id="selectRoom"></div>
						</div>
						
						<c:if test="${not empty act }">
							<label>상태</label>

							<div class="input-group col-sm-8">
						  			<style>
						  				label.cb {
						  					margin-top : 8px;
						  					margin-right:10px;
						  					margin-left :10px;
						  				}
						  			</style>
						  		
						      		<label class="cb"><input type="radio" name="status" value="0" checked> 준비 </label>
						      		<label class="cb"><input type="radio" name="status" value="1" > 진행 </label>
						      		<label class="cb"><input type="radio" name="status" value="2" > 중지 </label>
							</div>
							
							<script>
								$(document).ready(function () {
									$('input:radio[name=status]:input[value="${act.status}"]').attr("checked", true);
								})
							</script>
							
						</c:if>
					</div>
					
					<div class="col-xl-6">
						<div class="form-group">
							<label>이미지</label>
	
							<div class="col-sm-4 border" id="imgBox" ></div>
						</div>
					</div>
					
				</div>
					
				<div class="box-footer" align="center">
					<button type="submit" class="btn btn-primary">${empty act ? '등록' : '수정' }</button>
				
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

<script>
$(document).ready(function() {
	readImage();
	getRoomList();
});

function readImage() {
	$("#imgBox").html("<img src='" + $("#img").val() + "' width='600' />");
}

function getRoomList() {
	var url = "${ContextPath}/act/getRoomList";	
	
	$.ajax({
		type : 'GET',
		url: url,
		
		success: function(result) {	
			var htmls = '<select id="room" name="room" class="custom-select" >';
			
			$(result).each(function(){
				
				if(result.length < 1){
					htmls += "강의실이 없습니다.";
				} else {
				
					htmls += '<option value="' + this.roomno + '" ';
					
					if("${act}" != null)
						if(this.roomno == "${act.room}") {
							htmls += 'selected="selected"';
						}
					
					htmls += '>' + this.rname + '</option>';
				
				}
				
			});	//each end
			
			htmls += '</select>';
			
			$('#selectRoom').html(htmls);
			
		}, // success end
	
		error : function(){
			alert('ajax error');
		}
		
	}); // Ajax end
} // function getRoomList end
</script>

