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

<div>
	<input type="text" name="find" placeholder="책제목 검색">
	<input type="button" value="검색">
	<c:if test="${!empty sessionScope.admin }">
		<input type="button" value="책추가">
	</c:if>
</div>

<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작가</th>
			<th>출판사</th>
			<th>수량</th>
		</tr>	
	</thead>
	<tbody>
		<c:forEach var="l" items="${list }">
			<tr>
				<td><p>${l.idx }</p></td>				
				<td><p>${l.title }</p></td>				
				<td><p>${l.author }</p></td>				
				<td><p>${l.publisher }</p></td>				
				<td><p>${l.count }</p></td>				
			</tr>
		</c:forEach>
	</tbody>
</table>

<nav style="text-align: center;">
	<ul class="pagination pagination-sm">
		<c:if test="${page != 1 }">
			<li><a href="${pageContext.request.contextPath }/library">처음</a></li>
		</c:if>
		<c:if test="${page == 1 }">
			<li class="disabled"><a href="#">처음</a></li>
		</c:if>
		
		<c:if test="${startPage != 1 }">
			<li><a href="${pageContext.request.contextPath }/library?page=${startPage - 1}">이전</a></li>
		</c:if>
		<c:if test="${startPage == 1 }">
			<li class="disabled"><a href="#">이전</a></li>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == page }">
				<li class="active"><a href="#"><b>${i }</b></a></li>
			</c:if>
			<c:if test="${i != page }">
				<li><a href="${pageContext.request.contextPath }/library?page=${i}">${i }</a></li>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage != totalPage }">
			<li><a href="${pageContext.request.contextPath }/library?page=${endPage + 1}">다음</a></li>
		</c:if>
		<c:if test="${endPage == totalPage }">
			<li class="disabled"><a href="#">다음</a></li>
		</c:if>
		
		<c:if test="${page != totalPage }">
			<li><a href="${pageContext.request.contextPath }/library?page=${totalPage}">끝</a></li>
		</c:if>
		<c:if test="${page == totalPage }">
			<li class="disabled"><a href="#">끝</a></li>
		</c:if>
	</ul>
</nav>

</body>
</html>