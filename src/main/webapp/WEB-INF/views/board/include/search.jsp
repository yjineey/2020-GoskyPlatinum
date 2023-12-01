<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<div class="card-body">
	<!-- 검색 -->
	<div class="box-footer row">
		<div class="form-group col-sm-2">
			<select class="form-control" name="searchType" id="searchType">
				<option value="n" <c:out value="${searchPaging.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
				
				<option value="t" <c:out value="${searchPaging.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				
				<option value="c" <c:out value="${searchPaging.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				
				<option value="w" <c:out value="${searchPaging.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				
				<option value="tc" <c:out value="${searchPaging.searchType eq 'tc' ? 'selected' : ''}"/>>제목 + 내용</option>
				
				<option value="cw" <c:out value="${searchPaging.searchType eq 'cw' ? 'selected' : ''}"/>>내용 + 작성자</option>
				
				<option value="tcw" <c:out value="${searchPaging.searchType eq 'tcw' ? 'selected' : ''}"/>>제목 + 내용 + 작성자</option>
			</select>
		</div>
		
		<div class="form-group col-sm-6">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword" id="keywordInput" 
					value="${searchPaging.keyword}" placeholder="Search for..." onkeyup="javascript:if (event.keyCode == 13) enterkey();"> 
				<span class="input-group-btn">
					<button type="button" class="btn btn-primary btn-flat" id="searchBtn" >
						<i class="fa fa-search"></i> 검색
					</button>
				</span>
			</div>
		</div>
		
		
		
		<c:if test="${(bsort eq 'b01' and msort eq 'm03') or (bsort ne 'b01' and not empty userID) }">
			<div class="form-group col-sm-4" align="right" id="writeButton">
				<input class="btn btn-success" type="button" value="게시글 쓰기" id="write"/>
			</div>
		</c:if>
	</div>
</div>

<script>
function enterkey() {
	location.href =
        "${ContextPath}/board/list${pageMaker.makeQuery(bsort,1)}&searchType="+$("select option:selected").val()
        +"&keyword="+$("#keywordInput").val();
}

$("#write").click(function () {
	location.href="${ContextPath}/board/write${pageMaker.makeSearch(bsort, pageMaker.paging.page)}";
});



</script>

