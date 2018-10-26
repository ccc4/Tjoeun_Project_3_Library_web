<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/init/prelude.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/init/msgMenu.jsp"></jsp:include>

<form action="${pageContext.request.contextPath }/msgW" method="POST">
	<c:if test="${!empty replyMsg }">
		<div class="form-group"><input class="form-control" type="text" name="nickname" value="${replyMsg.from_nickname }"></div>
	</c:if>
	<c:if test="${empty replyMsg }">
		<div class="form-group"><input class="form-control" type="text" name="nickname" placeholder="받는이(닉네임)"></div>
	</c:if>
	<c:if test="${!empty relayMsg }">
		<div class="form-group"><input class="form-control" type="text" name="title" value="${relayMsg.title }"></div>
		<div class="form-group"><textarea class="form-control" name="contents">${relayMsg.contents }</textarea></div>
	</c:if>
	<c:if test="${empty relayMsg }">
		<div class="form-group"><input class="form-control" type="text" name="title" placeholder="제목"></div>
		<div class="form-group"><textarea class="form-control" name="contents" placeholder="내용"></textarea></div>
	</c:if>
	<input class="btn btn-default" type="submit" value="보내기">
</form>

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>