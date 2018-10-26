<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/msgMenu.jsp"></jsp:include>

<form action="${pageContext.request.contextPath }/msgW" method="POST">
	<c:if test="${!empty replyMsg }">
		<div><input type="text" name="nickname" value="${replyMsg.from_nickname }"></div>
	</c:if>
	<c:if test="${empty replyMsg }">
		<div><input type="text" name="nickname" placeholder="받는이(닉네임)"></div>
	</c:if>
	<c:if test="${!empty relayMsg }">
		<div><input type="text" name="title" value="${relayMsg.title }"></div>
		<div><textarea name="contents">${relayMsg.contents }</textarea></div>
	</c:if>
	<c:if test="${empty relayMsg }">
		<div><input type="text" name="title" placeholder="제목"></div>
		<div><textarea name="contents" placeholder="내용"></textarea></div>
	</c:if>
	<input type="submit" value="보내기">
</form>
</body>
</html>