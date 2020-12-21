<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exceptionHandler.jsp</title>
</head>
<body>
	<h1>현재 수정 중에 있습니다. 잠시만 기다려주세요.</h1>

	<h2>${exception.getMessage() }</h2>
	
	<ul>
		<c:forEach var="stack" items="${exception.getStackTrace() }">
			<li>${stack.toString() }</li>
		</c:forEach>
	</ul>
</body>
</html>