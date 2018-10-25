<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/msgMenu.jsp"></jsp:include>

<form action="${pageContext.request.contextPath }/msgW" method="POST">
	<div><input type="text" name="nickname" placeholder="받는이(닉네임)"></div>
	<div><input type="text" name="title" placeholder="제목"></div>
	<div><textarea name="contents" placeholder="내용"></textarea></div>
	<input type="submit" value="보내기">
</form>
</body>
</html>