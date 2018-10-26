<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/init/prelude.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/init/msgMenu.jsp"></jsp:include>

<table class="table">
	<caption class="h4">보낸쪽지함</caption>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>받은이</th>
			<th>보낸날짜</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="l" items="${list }" varStatus="status">
			<tr>
				<td>${(page - 1) * onePage + (status.index + 1) }</td>
				<td><a href="${pageContext.request.contextPath }/msgSV?idx=${l.idx }">${l.title }</a></td>
				<td>${l.to_nickname }</td>
				<td>${l.sendDate }</td>
				<td>
					<c:if test="${!empty l.readDate }">
						읽음
					</c:if>
					<c:if test="${empty l.readDate }">
						안읽음
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<nav style="text-align: center;">
	<ul class="pagination pagination-sm">
		<c:if test="${page != 1 }">
			<li><a href="${pageContext.request.contextPath }/msgS">처음</a></li>
		</c:if>
		<c:if test="${page == 1 }">
			<li class="disabled"><a href="#">처음</a></li>
		</c:if>
		
		<c:if test="${startPage != 1 }">
			<li><a href="${pageContext.request.contextPath }/msgS?page=${startPage - 1}">이전</a></li>
		</c:if>
		<c:if test="${startPage == 1 }">
			<li class="disabled"><a href="#">이전</a></li>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == page }">
				<li class="active"><a href="#"><b>${i }</b></a></li>
			</c:if>
			<c:if test="${i != page }">
				<li><a href="${pageContext.request.contextPath }/msgS?page=${i}">${i }</a></li>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage != totalPage }">
			<li><a href="${pageContext.request.contextPath }/msgS?page=${endPage + 1}">다음</a></li>
		</c:if>
		<c:if test="${endPage == totalPage }">
			<li class="disabled"><a href="#">다음</a></li>
		</c:if>
		
		<c:if test="${page != totalPage }">
			<li><a href="${pageContext.request.contextPath }/msgS?page=${totalPage}">끝</a></li>
		</c:if>
		<c:if test="${page == totalPage }">
			<li class="disabled"><a href="#">끝</a></li>
		</c:if>
	</ul>
</nav>

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>