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

<c:if test="${addResult == 1 }">
	<script type="text/javascript">
		alert("등록 성공");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>
<c:if test="${addResult == 0 }">
	<script type="text/javascript">
		alert("등록 실패");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>

<c:if test="${rentalResult == 1 }">
	<script type="text/javascript">
		alert("대여 성공");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>
<c:if test="${rentalResult == 0 }">
	<script type="text/javascript">
		alert("대여 실패");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>

<c:if test="${reserveResult == 1 }">
	<script type="text/javascript">
		alert("예약 성공");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>
<c:if test="${reserveResult == 0 }">
	<script type="text/javascript">
		alert("예약 실패");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>

<c:if test="${returnResult == 1 }">
	<script type="text/javascript">
		alert("반납 성공");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>
<c:if test="${returnResult == 0 }">
	<script type="text/javascript">
		alert("반납 실패");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>

<c:if test="${cancelResult == 1 }">
	<script type="text/javascript">
		alert("예약취소 성공");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>
<c:if test="${cancelResult == 0 }">
	<script type="text/javascript">
		alert("예약취소 실패");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>

<c:if test="${wrongTitle == 1 }">
	<script type="text/javascript">
		alert("정확한 제목을 입력해주세요.");
		location.href= "${pageContext.request.contextPath}/library";
	</script>
</c:if>



</body>
</html>