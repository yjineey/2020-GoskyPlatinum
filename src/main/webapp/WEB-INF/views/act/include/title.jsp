<%@page import="kr.co.gugu.domain.ActDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<title>
<%
ActDTO act = (ActDTO) request.getAttribute("act");
if(act == null) {
%>
Activity Regist
<%
} else {
%>
Activity Detail
<%
}
%>
</title>