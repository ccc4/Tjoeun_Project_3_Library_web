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

<script type="text/javascript">
	function message(str) {
		alert(str);
		location.href= "${pageContext.request.contextPath}/msgS";
		/* opener.parent.location.reload();
		window.close(); */
	}
</script>

<c:if test="${writeResult == 1 }">
	<script type="text/javascript">
		message("작성 성공");
	</script>
</c:if>
<c:if test="${writeResult == 0 }">
	<script type="text/javascript">
		message("작성 실패");
	</script>
</c:if>

</body>
</html>