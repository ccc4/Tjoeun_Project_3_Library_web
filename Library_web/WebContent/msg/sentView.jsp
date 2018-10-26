<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸쪽지함</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/msgMenu.jsp"/>

<input type="button" value="뒤로" onclick="location.href='${pageContext.request.contextPath }/msgS'">
<table border="1">
	<tr>
		<td>받은이</td>
		<td>${msg.to_nickname }</td>
	</tr>
	<tr>
		<td>보낸날짜</td>
		<td>${msg.sendDate }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${msg.title }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${msg.contents }</td>
	</tr>
</table>
<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath }/msgD?idx=${msg.idx }'">

</body>
</html>