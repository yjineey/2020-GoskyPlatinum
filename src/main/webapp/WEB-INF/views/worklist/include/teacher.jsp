<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!-- 강사소개 -->
<div class="card shadow mb-4">

	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">강사소개</h6>
	</div>
	
	<div class="card-body">
		<div class="table-responsive">
			<section class="content">
				<table class="table table-bordered" id="dataTable" style="margin: auto;">
					<colgroup>
						<col width="15%" />
						<col width="10%" />
						<col width="25%" />
						<col width="30%" />
						<col width="10%" />
					</colgroup>
					
					<thead>
						<tr>
							<th>이미지</th>
							<th>선택</th>
							<th>기간 또는 정보</th>
							<th>내용</th>
							<th>수정</th>
						</tr>
					</thead>
					
					<tbody>
					
					<c:if test="${fn:length(teacher) > 0 }">
						<c:forEach var="teacher" items="${teacher }" varStatus="i">	
							<tr>
								<td>
									<form id="form${i.index }" onsubmit="return check(${i.index});" action="${ContextPath}/TeacherUpdate" method="post" enctype="multipart/form-data">
										<input type="hidden" class="form-control" name="tno" id="htno${i.index }" value="${teacher.tno }" >
										<input type="hidden" class="form-control" name="status" id="hstatus${i.index }" value="" >
										<input type="hidden" class="form-control" name="content" id="hcontent${i.index }" value="" >
										<input type="hidden" class="form-control" name="tdate" id="htdate${i.index }" value="" >
										<input type="hidden" class="form-control" name="img" value="${teacher.img }" >
										
										
										<input type="file" id="file${i.index }" name="file" />
										<div class="select_img">
				                            <img id="img${i.index }" alt="" src="<c:if test="${not empty teacher.img}">${ContextPath}/resources/${teacher.img}</c:if>" width="100%">
										</div>
										
									</form>
									
								</td>
									
								<td>
									<select name="status" id="status${i.index }" onchange="printBox(${i.index }, '${teacher.tdate }') ">
										<option value="0" ${teacher.status eq 0 ? 'selected' : '' }>종목</option>
										<option value="1" ${teacher.status eq 1 ? 'selected' : '' }>소개</option>
										<option value="2" ${teacher.status eq 2 ? 'selected' : '' }>이력</option>
									</select>
								</td>
									
								<td id="teacherBox${i.index }"></td>
										
								<td>
									<textarea type="text" id="content${i.index }" name="content" maxlength="100" cols="50" 
									 style="resize: none;">${teacher.content}</textarea>
								</td>
										
								<td>
									<button type="submit" class="btn btn-primary" form="form${i.index }">수정완료</button>
								</td>
							</tr>
							
							<script>
								$(document).ready(function () {
									printBox("${i.index}", "${teacher.tdate }");
								});
								
								$("#file${i.index}").change(function(){
									
									if(this.files && this.files[0]) {
								  		var reader = new FileReader;
								  		
								  		reader.onload = function(data) {
								   			$("#img${i.index}").attr("src", data.target.result).width("100%");        
								  		}
								  		
								  		reader.readAsDataURL(this.files[0]);
								 	}
									
								});
							</script>
							
						</c:forEach>
					</c:if>
					
						<tr>
							<td>
								<form id="form9999" onsubmit="return check(9999);" action="${ContextPath}/TeacherInfoAdd" method="post" enctype="multipart/form-data">
									<input type="hidden" class="form-control" name="mid" value="${member.mid}" >
									<input type="hidden" class="form-control" name="status" id="hstatus9999" >
									<input type="hidden" class="form-control" name="content" id="hcontent9999" >
									<input type="hidden" class="form-control" name="tdate" id="htdate9999" >
									
									<input type="file" name="file" id="file9999" > 
									<div class="select_img"><img id="img9999" src="" /></div>
								</form>
							</td>
									
							<td>
								<select name="status" id="status9999" onchange="printBox(9999, 0)">
									<option value="0" selected>종목</option>
									<option value="1" >소개</option>
									<option value="2" >이력</option>
								</select>
							</td>
									
							<td id="teacherBox9999"></td>
										
							<td>
								<textarea type="text" id="content9999" name="content" maxlength="100" cols="50" 
								 style="resize: none;"></textarea>
							</td>
										
							<td>
								<button type="submit" class="btn btn-success" form="form9999" >정보등록</button>
							</td>
						</tr>
							
						<script>
							$(document).ready(function () {
								printBox("9999", "0");
							});
							
							$("#file9999").change(function(){
								
								if(this.files && this.files[0]) {
							  		var reader = new FileReader;
							  		
							  		reader.onload = function(data) {
							   			$("#img9999").attr("src", data.target.result).width("100%");        
							  		}
							  		
							  		reader.readAsDataURL(this.files[0]);
							 	}
								
							});
						</script>
						
					</tbody>
					
					
					
				</table>
			</section>
		</div>
	</div>
</div>

<script>
function printBox(idx, value) {
	const val = $("#status"+idx+" option:selected").val();
	
	var htmls = '';
	
	if(val == 0) {
		htmls += '<select name="tdate" id="tdate'+idx+'" >';
		
		htmls += '<c:if test="${fn:length(act) > 0 }">';
		htmls += '<c:forEach var="act" items="${act }" >';
		
		htmls += '<option value="${act.ssno}" >[${act.ssno} : ${act.name} ]</option>';
		
		htmls += '</c:forEach>';
		htmls += '</c:if>';
		
		htmls += '</select>'
		
		htmls += '<script>';
		htmls += '$(document).ready(function () { $("#tdate'+idx+'").val("'+value+'"); } );';
		htmls += '<\/script>';
	} else {
		htmls += '<input type="text" id="tdate'+idx+'" name="tdate" value="'+value+'" size="30">';
	}
	
	$("#teacherBox"+idx).html(htmls);
}

function check(idx) {
	const status = $("#status"+idx+" option:selected").val();
	const content = $("#content"+idx).val();
	var tdate;
	
	if(status == 0) {
		tdate = $("#tdate"+idx+" option:selected").val();
	} else {
		tdate = $("#tdate"+idx).val();
	}
	
	$("#hstatus"+idx).val(status);
	$("#hcontent"+idx).val(content);
	$("#htdate"+idx).val(tdate);
	
	return true;
}

</script>


























