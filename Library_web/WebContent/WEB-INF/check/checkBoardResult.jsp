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

<c:if test="${writeResult == 1 }">
	<script type="text/javascript">
		alert("작성 성공");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>
<c:if test="${writeResult == 0 }">
	<script type="text/javascript">
		alert("작성 실패");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>

<c:if test="${modifyResult == 1 }">
	<script type="text/javascript">
		alert("수정 성공");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>
<c:if test="${modifyResult == 0 }">
	<script type="text/javascript">
		alert("수정 실패");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>

<c:if test="${deleteResult == 1 }">
	<script type="text/javascript">
		alert("삭제 성공");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>
<c:if test="${deleteResult == 0 }">
	<script type="text/javascript">
		alert("삭제 실패");
		location.href= "${pageContext.request.contextPath}/board";
	</script>
</c:if>

</body>
</html>