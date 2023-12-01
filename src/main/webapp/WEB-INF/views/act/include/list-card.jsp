<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	
	<div class="form-group row" >
		<div class="col-sm-2">
			<select id="selectStatus" class="custom-select" onchange="showActList(1)">
				<option value="n" selected>::: 상태 :::</option>
				<option value="r">준비 중</option>
				<option value="o">진행 중</option>
				<option value="x">진행 중지</option>
			</select>
		</div>
		
		<div class="col-sm-8">
			<div class="input-group">
				<div class="col-sm-3">
					<select id="selectSearchType" class="custom-select" >
						<option value="n" selected>::: 검색 :::</option>
						<option value="r">강의실</option>
						<option value="t">종목 이름</option>
					</select>
				</div>
			
				<div class="col-sm-7">
					<input type="text" class="form-control" id="keywordInput" placeholder="Search for..." 
						onkeyup="javascript:if (event.keyCode == 13) showActList(1);"> 
				</div>
				
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-flat" >
						<i class="fa fa-search"></i> 검색
					</button>
				</div>
			</div>
			
		</div>
		
		<div class="col-sm-2" align="right" id="writeButton">
			<input class="btn btn-success" type="button" value="종목 등록" id="registAct"/>
			
			<script>
			$("#registAct").click(function () {
				location.href="${ContextPath }/act/regist";
			});
			</script>
		</div>
	</div>
</div>
	
<div class="card-body">
	<table class="table table-bordered table-hover" id="dataTable" style="text-align: center; vertical-align: middle">
		<colgroup>
			<col width="10%" />
			<col width="15%" />
			<col width="10%" />
			<col width="45%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		
		<thead class="thead-dark">
			<tr>
				<th>종목 번호</th>
				<th>이미지</th>
				<th>종목 이름</th>
				<th>소개</th>
				<th>강의실</th>
				<th>상태</th>
			</tr>
		</thead>
		
		<tbody id="actList"></tbody>
	</table>
	
	<div align="center" id="pageButton"></div>
	
</div>

<script>
$(document).ready(function () {
	showActList(1);
})

$(".btn-primary").click(function () {
	showActList(1);
})

function showActList(pageNo) {
	var url = "${ContextPath}/act/getListSearch";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : $("#selectSearchType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
			"page" : pageNo,
			"perPageNum" : 5
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
				htmls += '<td colspan="6">데이터가 존재하지 않습니다</td>';
				htmls += '</tr>';
			} else {
				
				$(result).each(function(){
					htmls += '<tr style="height : 150;" onclick="window.location=\'${ContextPath}/act/regist?ssno='+this.ssno+'\'">';
					htmls += '<td>'+this.ssno+'</td>';
					htmls += '<td><img src="'+this.img+'" width="150"></td>';
					htmls += '<td>'+this.name+'</td>';
					htmls += '<td>'+this.intro+'</td>';
					htmls += '<td>'+this.roomname+'</td>';
					
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
			
			$('#actList').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}

function showPageBar(pageNo) {
	var url = "${ContextPath}/act/getListPage";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : $("#selectSearchType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
			"page" : pageNo,
			"perPageNum" : 5
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


			
				
				
				
				
