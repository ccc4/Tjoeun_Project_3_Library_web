<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function message(str) {
		alert(str);
		/* location.href= "${pageContext.request.contextPath}/library"; */
		opener.parent.location.reload();
		window.close();
	}
</script>
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

<c:if test="${wrongTitle == 1 }">
	<script type="text/javascript">
		message("정확한 제목을 입력해주세요");
	</script>
</c:if>

<c:if test="${rentalResult == 1 }">
	<script type="text/javascript">
		message("대여 성공");
	</script>
</c:if>
<c:if test="${rentalResult == 0 }">
	<script type="text/javascript">
		message("대여 실패");
	</script>
	</c:if>

<c:if test="${reserveResult == 1 }">
	<script type="text/javascript">
		message("예약 성공");
	</script>
</c:if>
<c:if test="${reserveResult == 0 }">
	<script type="text/javascript">
		message("예약 실패");
	</script>
</c:if>

<c:if test="${returnResult == 1 }">
	<script type="text/javascript">
		message("반납 성공");
	</script>
</c:if>
<c:if test="${returnResult == 0 }">
	<script type="text/javascript">
		message("반납 실패");
	</script>
</c:if>

<c:if test="${cancelResult == 1 }">
	<script type="text/javascript">
		message("취소 성공");
	</script>
</c:if>
<c:if test="${cancelResult == 0 }">
	<script type="text/javascript">
		message("취소 실패");
	</script>
</c:if>
