<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${!empty sessionScope.admin }" var="adminCheck">
	<input type="button" value="�����ڷα׾ƿ�" onclick="location.href='${pageContext.request.contextPath }/adminOut'">
</c:if>
<c:if test="${!adminCheck }">
	<input type="button" value="�����ڷα���" onclick="location.href='${pageContext.request.contextPath }/admin.jsp'">
</c:if>

<h3>���Ƶ�����</h3>
<ul>
	<li><a href="${pageContext.request.contextPath }/">����</a></li>
	<li><a href="${pageContext.request.contextPath }/library">å���</a></li>
	<li><a href="${pageContext.request.contextPath }/cc.jsp">�Խ���</a></li>
	<li><a href="${pageContext.request.contextPath }/guestBook">����</a></li>
</ul>

<c:choose>
	<c:when test="${!empty sessionScope.member }">
		<div>
			<p>${sessionScope.member.nickname } �� ȯ���մϴ�.</p>
			<input type="button" value="��������" onclick="location.href='${pageContext.request.contextPath }/member/myInfo.jsp'">
			<input type="button" value="�α׾ƿ�" onclick="location.href='${pageContext.request.contextPath }/logout'">
		</div>
	</c:when>
	<c:otherwise>
		<div>
			<form action="${pageContext.request.contextPath }/login" method="POST">
				<c:if test="${!empty cookie.saveId }" var="check">
					<div><input type="text" name="id" value="${cookie.saveId.value }"></div>
					<div><input type="password" name="pw" placeholder="��й�ȣ"></div>
					<div><label><input type="checkbox" name="saveId" checked>���̵� ����</label></div>
				</c:if>
				<c:if test="${!check }">
					<div><input type="text" name="id" placeholder="���̵�"></div>
					<div><input type="password" name="pw" placeholder="��й�ȣ"></div>
					<div><label><input type="checkbox" name="saveId">���̵� ����</label></div>
				</c:if>
				<input type="submit" value="�α���">
				<input type="button" value="ȸ������" onclick="location.href='${pageContext.request.contextPath }/member/join.jsp'">
			</form>
		</div>
	</c:otherwise>
</c:choose>