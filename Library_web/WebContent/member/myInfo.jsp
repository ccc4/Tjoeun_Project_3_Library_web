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

<input class="btn btn-default" type="button" value="회원정보수정" onclick="location.href='${pageContext.request.contextPath }/modifyView'">
<input class="btn btn-default" type="button" value="비밀번호변경" onclick="location.href='${pageContext.request.contextPath }/pwChangeView'">

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>