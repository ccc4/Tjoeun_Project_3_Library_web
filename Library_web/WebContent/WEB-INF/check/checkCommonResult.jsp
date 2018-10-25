<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${wrongResult == 1 }">
	<script type="text/javascript">
		alert("잘못된 접근입니다.");
		location.href= "${pageContext.request.contextPath}/index.jsp";
	</script>
</c:if>

</body>
</html>