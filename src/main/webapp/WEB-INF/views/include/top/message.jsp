<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<!-- Nav Item - Messages -->
<li class="nav-item dropdown no-arrow mx-1 ">
	<a class="nav-link" href ="${ContextPath}/receivedmessagelist"><i class="fas fa-envelope fa-fw" style="color:#4e73df;"></i></a>
</li>