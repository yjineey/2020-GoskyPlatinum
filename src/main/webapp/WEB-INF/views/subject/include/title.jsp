<%@page import="kr.co.gugu.domain.SubjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<title>
<%
SubjectDTO subject = (SubjectDTO) request.getAttribute("subject");
if(subject == null) {
%>
Class Regist
<%
} else {
%>
Class Detail
<%
}
%>
</title>