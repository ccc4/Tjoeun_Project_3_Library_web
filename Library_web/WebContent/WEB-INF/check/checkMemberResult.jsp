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
<c:if test="${joinResult == 1 }">
	<script type="text/javascript">
		alert("회원가입완료!\n회원가입한 아이디로 로그인해주세요.");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${joinResult == 0 }">
	<script type="text/javascript">
		alert("회원가입실패");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

<c:if test="${loginResult == 1 }">
	<script type="text/javascript">
		alert("로그인 성공");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${loginResult == 0 }">
	<script type="text/javascript">
		alert("로그인 실패");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

<c:if test="${logoutResult == 1 }">
	<script type="text/javascript">
		alert("로그아웃");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

<c:if test="${modifyResult == 1 }">
	<script type="text/javascript">
		alert("정보수정 성공");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${modifyResult == 0 }">
	<script type="text/javascript">
		alert("정보수정 실패");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

<c:if test="${pwChangeResult == 1 }">
	<script type="text/javascript">
		alert("비번변경 성공 다시 로그인해주세요.");
		location.href= "${pageContext.request.contextPath}/logout";
	</script>
</c:if>
<c:if test="${pwChangeResult == 0 }">
	<script type="text/javascript">
		alert("비번변경 실패");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${pwChangeResult == -1 }">
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${pwChangeResult == -2 }">
	<script type="text/javascript">
		alert("예전 비밀번호와 다른 비밀번호를 이용해주세요.");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

</body>
</html>