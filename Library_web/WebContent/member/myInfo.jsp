<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/mainMenu.jsp"></jsp:include>

<input type="button" value="회원정보수정" onclick="location.href='${pageContext.request.contextPath }/modifyView'">
<input type="button" value="비밀번호변경" onclick="location.href='${pageContext.request.contextPath }/pwChangeView'">

</body>
</html>