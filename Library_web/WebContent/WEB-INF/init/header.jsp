<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>성훈도서관</h3>
<ul>
	<li><a href="${pageContext.request.contextPath }/">메인</a></li>
	<li><a href="${pageContext.request.contextPath }/subject/bb.jsp">책목록</a></li>
	<li><a href="${pageContext.request.contextPath }/subject/cc.jsp">게시판</a></li>
	<li><a href="${pageContext.request.contextPath }/subject/dd.jsp">방명록</a></li>
</ul>

<c:choose>
	<c:when test="${!empty sessionScope.member }">
		<div>
			<p>${sessionScope.member.nickname } 님 환영합니다.</p>
			<input type="button" value="정보수정" onclick="location.href='${pageContext.request.contextPath }/member/myInfo.jsp'">
			<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/logout'">
		</div>
	</c:when>
	<c:otherwise>
		<div>
			<form action="${pageContext.request.contextPath }/login" method="POST">
				<c:if test="${!empty cookie.saveId }" var="check">
					<div><input type="text" name="id" value="${cookie.saveId.value }"></div>
					<div><input type="password" name="pw" placeholder="비밀번호"></div>
					<div><label><input type="checkbox" name="saveId" checked>아이디 저장</label></div>
				</c:if>
				<c:if test="${!check }">
					<div><input type="text" name="id" placeholder="아이디"></div>
					<div><input type="password" name="pw" placeholder="비밀번호"></div>
					<div><label><input type="checkbox" name="saveId">아이디 저장</label></div>
				</c:if>
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/member/join.jsp'">
			</form>
		</div>
	</c:otherwise>
</c:choose>