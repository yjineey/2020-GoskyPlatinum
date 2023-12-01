<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<title>
<%
String bsort = (String) request.getAttribute("bsort");
if(bsort.equals("b01")) {
%>
공지 사항
<%
} else if(bsort.equals("b02")) {
%>
건의 사항
<%
} else if(bsort.equals("b03")) {
%>
질문 게시판
<%
} else if(bsort.equals("b04")) {
%>
자유 게시판
<%
} else {
%>
수강 후기 게시판
<%		
}
%>
</title>