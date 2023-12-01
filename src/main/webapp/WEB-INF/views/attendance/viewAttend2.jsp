<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group row" >
	
			<div class="col-sm-2">
	
				<select id="selectPeople" class="custom-select" onchange="showActList(1)">
				<c:forEach var="plist" items="${plist}">
	
					<option value="${plist.pno}" selected  value="${plist.pno">${plist.pname}(${plist.pinfo})</option>
				</c:forEach>
				</select>
			</div>
	</div>
<div class="card-body">

	<table class="table table-bordered table-hover" id="dataTable" style="text-align: center; vertical-align: middle">

		<colgroup>

			<col width="15%" />

			<col width="15%" />
			
			<col width="15%" />

			<col width="15%" />

			
		</colgroup>

		

		<thead class="thead-dark">

			<tr>

				<th>출결날짜</th>

				<th>mid</th>

				<th>오전과목</th>
				
				<th>오후과목</th>

			</tr>

			</thead>

		<tbody id="actList"></tbody>

		</table>
		<div align="center" id="pageButton">
		</div>
	</div>
	
	
	
	<script>

$(document).ready(function () {

	showActList();

})

 

function showActList() {

	var url = "${ContextPath}/searchAttend";

	var dataParam = {
			"number" : $("#selectPeople option:selected").val()

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

					htmls += '<tr style="height : 150;" onclick="window.location=\'${ContextPath}/attendDetail?ano='+this.ano+'\'">';

					htmls += '<td>'+this.date+'</td>';

					htmls += '<td>'+this.number+'</td>';

					htmls += '<td>'+this.befor+'</td>';

					htmls += '<td>'+this.after+'</td>';
					htmls += '<td>';

			
					htmls += '</td></tr>';

				});

			}


			$('#actList').html(htmls);

			

		},

		

		error : function(){

			alert('ajax error');

		}

		

	}); // ajax end

}

 



</script>

</body>
</html>