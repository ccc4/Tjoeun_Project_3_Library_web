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
<c:if test="${writeResult == -1 }">
	<script type="text/javascript">
		alert("정확한 닉네임을 입력해주세요.");
		history.back();
	</script>
</c:if>

<c:if test="${rDeleteMsg == 1 }">
	<script type="text/javascript">
		alert("삭제 성공");
		location.href= "${pageContext.request.contextPath}/msg";
	</script>
</c:if>
<c:if test="${rDeleteMsg == 0 }">
	<script type="text/javascript">
		alert("삭제 실패");
		location.href= "${pageContext.request.contextPath}/msg";
	</script>
</c:if>

<c:if test="${sDeleteMsg == 1 }">
	<script type="text/javascript">
		message("삭제 성공");
	</script>
</c:if>
<c:if test="${sDeleteMsg == 0 }">
	<script type="text/javascript">
		message("삭제 실패");
	</script>
</c:if>

</body>
</html>