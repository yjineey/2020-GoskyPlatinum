<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<title>자유게시판_상세보기</title>

<c:import url="/include/setting/meta.jsp" />
<c:import url="/include/setting/css-main.jsp" />
</head>


<body id="page-top">
	<script>
    $(document).ready(function() {
    	console.log("===================아작스시작===================")
    	replyList();	//목록조회로
//댓글저장
	$(document).on('click','#ReplySave',function(){
		var content = $('#content1').val();
		var mid = $('#mid').val();
		
		var url = "${ContextPath}/ReplyWrite"; 	
		var paramData = {"content": content, "mid" : mid, "bno" : '${FreeBoard.bno}'};
	
		$.ajax({
			type : 'POST',
			url : url,
		 	data : paramData,
	        dataType: 'json',
		 	success : function(result){
				replyList();
		 		$('#content').val('');
		 		$("#replylist").html();
		 		
		 	},
		 	error : function(error){
		 		console.log("에러 : " + error);
		 	}
		}); //end of ajax
	}); //end of document
}); //end of $(document).ready

//댓글보기
function replyList(){
	var url = "${ContextPath}/ReplyList";
	var paramData = {"bno" : "${FreeBoard.bno}"}; 
			
	    $.ajax({
	          type : 'POST',
	          url : url,
	          data : paramData,
	          dataType: 'json',
	          success: function(result){      //result : controller 다녀왔다는 싸인
	             var htmls="";
	 			if(result.length < 1){
	                   htmls += "등록된 댓글이 없습니다";
             }else{
				$(result).each(function(){
					htmls += '<div class="media text-muted pt-3" id="rno' + this.rno + '">';
					htmls += '<span class="d-block">';
					htmls += '<strong class="text-gray-dark">[댓글번호 : '  + this.rno + '_</strong>';
					htmls += '<strong class="text-gray-dark">작성자 : ' + this.mid + ' ] </strong>';
					htmls += '<span style="padding-left: 7px; font-size: 9pt">';
					htmls += '<a href="javascript:void(0)" onclick="editReply(' + this.rno + ', \'' + this.mid + '\', \''+ this.content + '\' )" style="padding-right:5px">수정</a>';
					htmls += '<a href="javascript:void(0)" onclick="replyDelete(' + this.rno + ')" >삭제  </a>';
					htmls += '</span>';
					htmls += '</span><br>';
					htmls += '<strong class="text-gray-dark"> → 댓글내용 : '+this.content + '</strong>';
					htmls += '</p>';
					htmls += '</div>';
                });   //each end
			}
			$("#replylist").html(htmls);
		},
	    error:function(data){
            alert("조회) 에러가 발생했습니다")   //200~500에러 모든 에러
	    }
	});	//ajax of end
}
//댓글 수정	
	function replyUpdate(rno, mid){
	var editcontent=$("#editcontent").val();
	var url = "${ContextPath}/ReplyUpdate";
	var paramData = {"rno" : rno, "content" : editcontent };
	
	$.ajax({
		type : 'POST',
		url  :  url,
		data  :  paramData,
		dataType : 'json',
		success : function(result){
			console.log(result);
			$("#replylist").html();
			replyList();
		 },
	        error:function(data){
				alert("수정) 에러가 발생했습니다.")
			}
		});
}
 function editReply(rno, mid,content){
	      	var htmls = "";

	      	htmls += '<div class="media text-muted pt-3" id="rno' + rno + '">';
	      	
	      	htmls += '<span class="d-block">';
	      	htmls +=  rno + ' - ';
	      	htmls += '<strong class="text-gray-dark">' + mid + '</strong>';
	      	htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	      	htmls += '<a href="javascript:void(0)" onclick="replyUpdate(' + rno + ', \'' + mid + '\')" style="padding-right:5px">저장</a>';
	      	htmls += '<a href="javascript:void(0)" onClick="replyList()">취소<a>';
	      	htmls += '</span>';
	      	htmls += '</span>';		
	      	htmls += '<textarea name="editcontent" id="editcontent" class="form-control" rows="3">';
	      	htmls += content;
	      	htmls += '</textarea>';
	      	htmls += '</p>';
	      	htmls += '</div>';	

	      	$('#rno' + rno).replaceWith(htmls);  //  선택한 요소를 다른 것으로 바꿉니다.변경(바꾸기)
	      	$('#rno' + rno + ' #editcontent').focus();
	      }
//댓글삭제
	function replyDelete(rno){
	var url = "${ContextPath}/ReplyDelete";
	var paramData = {"rno":rno};
	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',
		success : function(result){
			$("#replyList").html();
			replyList();
			},
  		  error:function(data){
        alert("삭제) 에러가 발생했습니다")   
     }
  });   //Ajax End
	
}//function of end 

</script>
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
						<h1 class="h3 mb-0 text-gray-800">자유게시판</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<p class="mb-4">
							회원들에게 보여지는 자유게시판 입니다 <a target="_blank"
								href="https://datatables.net">필요한 경우 링크걸기</a>.
						</p>

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">자유게시판 상세보기</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<section class="content">
										<div class="box">
											<c:if test="${userID==FreeBoard.mid}"> 
											<div class="box-footer" align="left">
												<button class="btn btn-primary">게시글 수정</button>
												<button class="btn btn-danger">게시글 삭제</button>
												<br>
											</div></c:if>
											<table align="right" board="1">
												<td>게시글번호 :</td>
												<td> ${FreeBoard.bno}</td>
												<td style="padding-left:50px">작성자 :</td>
												<td> ${FreeBoard.mid}</td>
												<td style="padding-left:50px">작성일 :</td>
												<td> ${FreeBoard.regdate}</td>
											</table>
											<br>
											<div class="box-body">
												<div class="form-group">
													<label>제목</label> <input type="text" name="btitle"
														class="form-control" value="${FreeBoard.btitle}"
														readonly="readonly" />
												</div>

												<div class="form-group">
													<label>내용</label>
													<textarea name="bcontent" readonly="readonly" rows="10"
														cols="100" class="form-control">${FreeBoard.bcontent}</textarea>
												</div>

												<div class="form-group">
													<label>작성자</label> <input type="text" name="mid"
														class="form-control" value="${FreeBoard.mid}"
														readonly="readonly" />
												</div>
											</div>
										</div>
										<div class="box-footer" align="left">
											<form role="form" method="post">
												<input type="hidden" name="bno" value="${FreeBoard.bno}">
												<input type="hidden" name="page"
													value="${searchPaging.page}"> <input type="hidden"
													name="perPageNum" value="${searchPaging.perPageNum}">
												<input type="hidden" name="searchType"
													value="${searchPaging.searchType}"> <input
													type="hidden" name="keyword"
													value="${searchPaging.keyword}">
											</form>
											<button class="btn btn-success">목록</button>
											<br>
											<br>
										</div>
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">댓글</h6>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<form role="form" method="post">
														<div class="box-body">

															<div class="form-group">
																<label for="newReplyText">댓글 내용</label> <input
																	class="form-control" id="content1" name="content" required
																	placeholder="댓글 내용을 입력해주세요">
															</div>
															<div class="form-group">
																<label for="newReplyWriter">댓글 작성자</label> <input
																	class="form-control" id="mid" name="mid" required
																	value="${userID }">
															</div>
															<div class="box-footer" align="right">
																<button type="button" id="ReplySave" name="ReplySave"
																	class="btn btn-info">댓글등록</button>
															</div>
															
															<hr>
																<div id="replylist"></div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</section>
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
	<script>
	//게시글수정
	$('.btn-primary').on('click', function() {
		location.href = "FreeBoardUpdate?bno=" + ${FreeBoard.bno};
	});
	//게시글삭제
	$('.btn-danger').on('click', function() {
		location.href = "FreeBoardDelete?bno="+${FreeBoard.bno};
	});
	//게시글목록
	$('.btn-success').on('click', function() {
		location.href = "FreeBoardList"
	});
</script>

</body>

</html>