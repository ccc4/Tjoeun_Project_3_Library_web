<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath }/pwChange" method="POST">
	<input type="hidden" name="idx" value="${sessionScope.member.idx }">
	<input type="hidden" name="prevPw" value="${sessionScope.member.pw }">
	<div>id: ${sessionScope.member.id }</div>
	<div>이전 비밀번호:<input type="password" name="prevPwCheck"></div>
	<div>바꿀 비밀번호:<input type="password" name="newPw"></div>
	<div>비밀번호 확인:<input type="password" name="newPwCheck"></div>
	<input type="submit" value="수정">
</form>

</body>
</html>