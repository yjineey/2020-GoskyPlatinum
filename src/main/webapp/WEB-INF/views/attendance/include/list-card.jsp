<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	
	<div id="attendanceList"></div>
	
	<div align="center" id="pageButton"></div>
	
</div>

<script>

function showList(pageNo) {
	var s = getDate();
	showAttendanceList(pageNo, ((s[0]*10000)+(s[1].trim()*100)+(s[2].trim()/1))+"");
}

function showAttendanceList(pageNo, date) {
	var url = "${ContextPath}/attendance/getListSearch";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : $("#selectType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
			"page" : pageNo,
			"perPageNum" : 20,
			"stime" : date
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
		
			var htmls = '<table class="table table-bordered table-hover" id="dataTable" style="text-align: center; vertical-align: middle">';
			
			htmls += '<colgroup><col width="10%" /><col width="10%" /><col width="15%" /><col width="15%" /><col width="20%" /><col width="30%" /></colgroup>';
			
			htmls += '<thead class="thead-dark"><tr><th>출석 번호</th><th>번호</th><th>이름</th><th>출결 상태</th><th>출석 시간</th><th>내용</th></tr></thead>';
			
			if(result.length < 1) {
				htmls += '<tr align="center">';
				htmls += '<td colspan="7">데이터가 존재하지 않습니다</td>';
				htmls += '</tr>';
				htmls += '</table>';
			} else {
				
				$(result).each(function(){
					htmls += '<tr style="height : 150;" >';
					htmls += '<td>'+this.ano+'</td>';
					htmls += '<td>'+this.number+'</td>';
					htmls += '<td>'+this.name+'</td>';
					
					htmls += '<td>';
					
					if(this.att == 0) {
						htmls += '결석';
					} else if(this.att == 1) {
						htmls += '지각';
					} else if(this.att == 2) {
						htmls += '조퇴';
					} else if(this.att == 3) {
						htmls += '출석';
					}else {
						htmls += '공결';
					}
					
					htmls += '<td>';
					if(this.adate != null)
						htmls += new Date(this.adate).toLocaleString();
					htmls += '</td>';
					
					htmls += '<td>';
					if(this.acontent != null)
						htmls += this.acontent;
					htmls += '</td>';
					
					htmls += '</tr>';
				});
				
				htmls += '</table>';
				
			}
			
			showPageBar(pageNo, date);
			
			$('#attendanceList').html(htmls);
			
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}

function showPageBar(pageNo, date) {
	var url = "${ContextPath}/attendance/getListPage";
	var dataParam = {
			"status" : $("#selectStatus option:selected").val(),
			"searchType" : $("#selectType option:selected").val(),
			"keyword" : $("#keywordInput").val(),
			"page" : pageNo,
			"perPageNum" : 20,
			"stime" : date
	};
	
	const f = $("#selectType option:selected").val();
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			
			var htmls = '';
			
			if(result.check) {
				htmls += '<button class="btn btn-success" onclick="';
				if( f == 't' ) { htmls += 'insertAtt(\'t\','+date+')"> 강사'; } 
				else { htmls += 'insertAtt(\'p\','+date+')"> 학생';	}
				htmls += ' 출결 등록</button>';
			}
			
			htmls += '<nav aria-label="Page navigation">';
			htmls += '<ul class="pagination justify-content-center">';
			
			if(result.front) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showList(1);return false;">';
				htmls += '<i class="fas fa-angle-double-left"></i></a>';
				htmls += '</li>';
			}
			
			if(result.prev) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showList(' +(result.startPage - 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-left"></i></a>';
				htmls += '</li>';
			}
			
			for(var i=result.startPage; i<=result.endPage; i++) {
				if(result.paging.page == i) {
					htmls += '<li class="page-item active">';
				} else {
					htmls += '<li class="page-item">';
				}
				htmls += '<a class="page-link" href="#" onClick="showList(' +i+ ');return false;">';
				htmls += i+'</a></li>';
			}
				
			if(result.next) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showList(' +(result.endPage + 1)+ ');return false;">';
				htmls += '<i class="fas fa-angle-right"></i></a>';
				htmls += '</li>';
			}
			
			if(result.last) {
				htmls += '<li class="page-item">';
				htmls += '<a class="page-link" href="#" onClick="showList(' +result.lastPage+ ');return false;">';
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

function insertAtt(key, date) {
	var url = "${ContextPath}/attendance/insertAtt";
	var dataParam = { 
			"value" : key, 
			"year"	: Math.floor(date / 10000) + "",
			"month" : Math.floor((date - (Math.floor(date / 10000) * 10000)) / 100) + "",
			"date"  : (date - (Math.floor(date / 100) * 100)) + ""
	};
	
	$.ajax({
		
		type : 'GET',
		url: url,
		data: dataParam,
		dataType: 'json',
		
		success : function(result) {
			if(result)
				showList(1);
			else
				alert("당일에만 출결 생성 가능");
		},
		
		error : function(){
			alert('ajax error');
		}
		
	}); // ajax end
}

</script>

			
				
				
				
				
