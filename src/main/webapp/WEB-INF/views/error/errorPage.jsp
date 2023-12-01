<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang=en>
<meta charset=utf-8>
<meta name=viewport
	content="initial-scale=1, minimum-scale=1, width=device-width">
<title>Error</title>
<style>
* {
	margin: 0;
	padding: 0
}

html, code {
	font: 15px/22px arial, sans-serif
}

html {
	background: #fff;
	color: #222;
	padding: 15px
}

body {
	margin: 7% auto 0;
	max-width: 390px;
	min-height: 180px;
	padding: 30px 0 15px
}

*>body {
	background: url(//www.google.com/images/errors/robot.png) 100% 5px
		no-repeat;
	padding-right: 205px
}

p {
	margin: 11px 0 22px;
	overflow: hidden
}

ins {
	color: #777;
	text-decoration: none
}

a img {
	border: 0
}

@media screen and (max-width:772px) {
	body {
		background: none;
		margin-top: 0;
		max-width: none;
		padding-right: 0
	}
}

#logo {
	background:
		url(//www.google.com/images/branding/googlelogo/1x/googlelogo_color_150x54dp.png)
		no-repeat;
	margin-left: -5px
}

@media only screen and (min-resolution:192dpi) {
	#logo {
		background:
			url(//www.google.com/images/branding/googlelogo/2x/googlelogo_color_150x54dp.png)
			no-repeat 0% 0%/100% 100%;
		-moz-border-image:
			url(//www.google.com/images/branding/googlelogo/2x/googlelogo_color_150x54dp.png)
			0
	}
}

@media only screen and (-webkit-min-device-pixel-ratio:2) {
	#logo {
		background:
			url(//www.google.com/images/branding/googlelogo/2x/googlelogo_color_150x54dp.png)
			no-repeat;
		-webkit-background-size: 100% 100%
	}
}

#logo {
	display: inline-block;
	height: 54px;
	width: 150px
}
</style>

</a>

<p>
	<b>죄송합니다. 현재 찾을 수 없는 페이지를 요청하셨습니다</b>
<p>
	존재하지 않는 주소를 입력하셨거나, <br> 요청하신 페이지의 주소를 찾을 수 없습니다<br> 궁굼하신 점은
	고객센터를 통해 문의해 주시기 바랍니다<br> 감사합니다<br>
	<br> <b><a href="http://localhost:8080/gugu/">메인화면으로 이동</a></b>