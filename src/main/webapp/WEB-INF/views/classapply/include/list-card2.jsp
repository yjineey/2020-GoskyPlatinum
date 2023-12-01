<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<table class="table table-bordered table-hover" id="dataTable" style="text-align: center; vertical-align: middle">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			<col width="20%" />
		</colgroup>
		
		<thead class="thead-dark">
			<tr>
				<th>신청 달</th>
				<th>신청 날짜</th>
				<th>회원 이름</th>
				<th>학생 이름</th>
				<th>상태</th>
				<th>기타</th>
				<th>기타 날짜</th>
			</tr>
		</thead>
		
		<tbody id="classApplyList"></tbody>
	</table>
	
	<div align="center" id="pageButton"></div>
	
</div>

<script>

function showClassApplyList(pageNo, dateYM) {
	var url = "${ContextPath}/classApply/membergetListSearch";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : "xxx",
			"pno" : $("#selectPeople option:selected").val(),
			"page" : pageNo,
			"perPageNum" : 20
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			
			var htmls = '';
			
			if(result.length < 1) {
				htmls += '<tr align="center">';
				htmls += '<td colspan="7">데이터가 존재하지 않습니다</td>';
				htmls += '</tr>';
			} else {
				
				$(result).each(function(){
					htmls += '<tr style="height : 150;" >';
					htmls += '<td>'+this.month+'</td>';
					htmls += '<td>'+new Date(this.regdate).toLocaleString()+'</td>';
					htmls += '<td>'+this.mname+'</td>';
					htmls += '<td>'+this.pname+'</td>';
					
					htmls += '<td>';
					
					if(this.status == 0) {
						htmls += '수강 신청';
					} else if(this.status == 1) {
						htmls += '결제 완료';
					} else if(this.status == 2) {
						htmls += '수강 중';
					} else {
						htmls += '수강 취소';
					}
					
					
					htmls += '<td>';
					if(this.etc != null)
						htmls += this.etc;
					htmls += '</td><td>';
					if(this.sdate != null)
						htmls += new Date(this.sdate).toLocaleString();
					
					htmls += '</td></tr>';
					
				});
				
			}
			
			showPageBar(pageNo, dateYM);
			
			$('#classApplyList').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}

function showPageBar(pageNo, dateYM) {
	var url = "${ContextPath}/classApply/membergetListPage";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : "xxx",
			"pno" : $("#selectPeople option:selected").val(),
			"page" : pageNo,
			"perPageNum" : 20
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			
			var htmls = '';
			
			htmls += '<nav aria-label="Page navigation">';
			htmls += '<ul class="pagination justify-content-center">';
			
			if(result.front) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showActList(1);return false;">';
				htmls += '<i class="fas fa-angle-double-left"></i></a>';
				htmls += '</li>';
			}
			
			if(result.prev) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showActList(' +(result.startPage - 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-left"></i></a>';
				htmls += '</li>';
			}
			
			for(var i=result.startPage; i<=result.endPage; i++) {
				if(result.paging.page == i) {
					htmls += '<li class="page-item active">';
				} else {
					htmls += '<li class="page-item">';
				}
				htmls += '<a class="page-link" href="#" onClick="showActList(' +i+ ');return false;">';
				htmls += i+'</a></li>';
			}
				
			if(result.next) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showActList(' +(result.endPage + 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-right"></i></a>';
				htmls += '</li>';
			}
			
			if(result.last) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showActList(' +result.lastPage+ ');return false;">';
				htmls += '<i class="fas fa-angle-double-right"></i></a>';
				htmls += '</li>';
			}
			
			htmls += '</ul></nav>';
			
			$('#pageButton').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}
</script>


			
				
				
				
				
