<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/init/prelude.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/init/mainMenu.jsp"></jsp:include>

<form action="${pageContext.request.contextPath }/pwChange" method="POST">
	<div>id: ${sessionScope.member.id }</div>
	<div>이전 비밀번호:<input type="password" name="prevPwCheck"></div>
	<div>바꿀 비밀번호:<input type="password" name="newPw"></div>
	<div>비밀번호 확인:<input type="password" name="newPwCheck"></div>
	<input class="btn btn-default pull-right" type="submit" value="수정">
</form>

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>