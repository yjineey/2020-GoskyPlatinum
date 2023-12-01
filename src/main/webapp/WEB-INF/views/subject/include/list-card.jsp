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
			<col width="10%" />
			<col width="10%" />
			<col width="20%" />
			<col width="30%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		
		<thead class="thead-dark">
			<tr>
				<th>강의 번호</th>
				<th>종목 이름</th>
				<th>강의 시간</th>
				<th>강의 제목</th>
				<th>강의 내용</th>
				<th>강사 이름</th>
				<th>상태</th>
			</tr>
		</thead>
		
		<tbody id="subjectList"></tbody>
		
	</table>
	
	<div align="center" id="pageButton"></div>
	
</div>

<script>
$(document).ready(function () {
	showSubjectList(1);
})

function showSubjectList(pageNo) {
	var url = "${ContextPath}/subject/getListSearch";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"stime" : $("#selectTime option:selected").val(),
			"searchType" : $("#selectSearchType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
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
					htmls += '<tr style="height : 100;" onclick="window.location=\'${ContextPath}/subject/regist?sno='+this.sno+'\'">';
					htmls += '<td>'+this.sno+'</td>';
					htmls += '<td>'+this.aname+'</td>';
					
					htmls += '<td>';
					if(this.stime == 0)
						htmls += '오전';
					else
						htmls += '오후';
					htmls += '</td>';
					
					htmls += '<td>'+this.sname+'</td>';
					htmls += '<td>'+this.content+'</td>';
					htmls += '<td>'+this.mname+'</td>';
					
					htmls += '<td>';
					
					if(this.status == 0) {
						htmls += '준비중';
					} else if(this.status == 1) {
						htmls += '진행중';
					} else {
						htmls += '진행중지';
					}
					
					htmls += '</td></tr>';
					
				});
				
			}
			
			showPageBar(pageNo);
			
			$('#subjectList').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end	
}

function showPageBar(pageNo) {
	var url = "${ContextPath}/subject/getListPage";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"stime" : $("#selectTime option:selected").val(),
			"searchType" : $("#selectSearchType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
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
				htmls += '<a class="page-link" href="#" onClick=showSubjectList(1);return false;">';
				htmls += '<i class="fas fa-angle-double-left"></i></a>';
				htmls += '</li>';
			}
			
			if(result.prev) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showSubjectList(' +(result.startPage - 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-left"></i></a>';
				htmls += '</li>';
			}
			
			for(var i=result.startPage; i<=result.endPage; i++) {
				if(result.paging.page == i) {
					htmls += '<li class="page-item active">';
				} else {
					htmls += '<li class="page-item">';
				}
				htmls += '<a class="page-link" href="#" onClick="showSubjectList(' +i+ ');return false;">';
				htmls += i+'</a></li>';
			}
				
			if(result.next) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showSubjectList(' +(result.endPage + 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-right"></i></a>';
				htmls += '</li>';
			}
			
			if(result.last) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showSubjectList(' +result.lastPage+ ');return false;">';
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
