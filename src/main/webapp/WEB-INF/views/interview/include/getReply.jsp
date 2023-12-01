<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<%@ page import="kr.co.gugu.domain.*"%>
<!DOCTYPE html>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">댓글</h6>
	</div>
	
	<div id="replyList"></div>
	
	<hr>
	<c:choose>
	<c:when test="${msort eq 'm03' }">
	
		<div class="card-body">
			<div class="table-responsive">
				<div class="box-body">
					<label >댓글 쓰기</label> 
					
							<form onsubmit="insertReply(); return false;" action="#">
								<div class="form-group">
									<textarea class="form-control" id="replyContent" name="rcontent" required 
									placeholder="댓글 내용을 입력해주세요" col="5"></textarea>
								</div>
									
								<div class="box-footer" align="right">
									<input type="submit" id="ReplySave" name="ReplySave" class="btn btn-info" value="댓글 등록">
								</div>
							</form>
				</div>
			</div>
		</div>
	
	
	
	</c:when>
	</c:choose>
	
	
</div>

<script>
$(document).ready(function () {
	getReplyList(0);
});

function getReplyList(rno) {
	var url = "${ContextPath}/reply/getList";
	var paramData = {
		"bno" : "${detail.msno}"
	};

	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',

		success : function(result) {
			var htmls = "<section style='width:95%;' align='center'><table>";
			
			$('#replyList').html();

			if (result.length < 1) {
				htmls += "<tr>등록된 댓글이 없습니다.</tr>";
			} else {
				$(result).each(function() {
					htmls += '<tr>';
					htmls += '<div class="form-group row" style="margin-top: 20px; margin-bottom: 20px;">';
					htmls += '<label class="col-sm-2 control-label">'+ this.mname+ '</label>';
					htmls += '<div class="col-sm-8" style="word-break: break-all;">';
					htmls += '<div class="form-group row">';
					htmls += '<div class="col-sm-9">';

					if (this.rno != rno) {
						htmls += '<div style="text-align:left; white-space:pre-line;">'+ this.content+ '</div></div>';

						if (this.mid == "${userID}") {
							htmls += '<div class="col-sm-1" >';
							htmls += '<a href="#" class="small" onclick="getReplyList('+ this.rno+ '); return false;" > 수정 </a>';
							htmls += '<a href="#" class="small" onclick="deleteReply('+ this.rno+ '); return false;" > 삭제 </a></div>';
						}

					} else {

						htmls += '<textarea class="form-control" name="rcontent" id="rcontent" style="resize:none;" rows="4" maxlength="100" required> '
								+ this.content
								+ '</textarea></div>';

						htmls += '<div class="col-sm-1" >';
						htmls += '<a href="#" class="small" onclick="updateReply('+ this.rno+ '); return false;" > 완료 </a>';
						htmls += '<a href="#" class="small" onclick="getReplyList(0); return false;" > 취소 </a></div>';

					}

					htmls += '</div></div>'	+ new Date(this.regdate).toLocaleString() + '</div></tr>';

					}); //each end

				htmls += "</table></section>";

				}

			$('#replyList').html(htmls);

		}, // Ajax success end

		error : function() {
			alert('ajax error1');
		}
	}); // Ajax end
}
	
function deleteReply(rno) {
	var url = "${ContextPath}/reply/delete";
	var paramData = {
		"rno" : rno
	};

	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',

		success : function(result) {
			alert('댓글이 삭제되었습니다.');
			getReplyList(0);
		},

		error : function() {
			alert("error");
		}
	});

}

function updateReply(rno) {
	
	if($("#rcontent").val() == "") {
		alert("댓글을 입력하세요");
		$("#rcontent").focus(); return;
	}
	
	var url = "${ContextPath}/reply/update";
	var paramData = {
		"rno" : rno,
		"content" : $("#rcontent").val()
	};

	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',

		async : false,

		success : function(result) {
			alert('댓글이 수정되었습니다.');
			getReplyList(0);
		},

		error : function() {
			alert("error");
		}
	});

}

function insertReply() {
	if($("#replyContent").val() == "") {
		alert("댓글을 입력하세요");
		$("#replyContent").focus(); return;
	}
	
	var url = "${ContextPath}/reply/insert";
	var paramData = {
					"bno" : "${detail.msno}",
					"content" : $("#replyContent").val(),
					"mid" : "${userID}"
				};

	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',

		async : false,

		success : function(result) {
			$("#replyContent").val("");
			getReplyList(0);
		},

		error : function() {
			alert("idCheck error");
		}
	});	
}
</script>



