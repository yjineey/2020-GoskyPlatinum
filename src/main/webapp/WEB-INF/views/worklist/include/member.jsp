<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!-- 강사정보 -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">강사정보</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<section class="content">
				<form role="form" method="post"
					action="${ContextPath}/MemberUpdate?mid=${member.mid}">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>번호</th>
								<td>${member.mno}</td>
								<th>이름</th>
								<td><input type="text" name="mname" value="${member.mname}"
									required></td>
								<th>아이디(id)</th>
								<td>${member.mid}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="memail"
									value="${member.memail}" size="25"></td>
								<th>가입날짜</th>
								<td>${member.mjoindate}</td>
								<th>전화번호</th>
								<td><input type="text" name="number"
									value="${member.number}"></td>
							</tr>
						</tbody>
					</table>
					<div class="box-footer" align="center">
						<button type="submit" class="btn btn-primary">강사정보 수정완료</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>