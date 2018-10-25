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
<jsp:include page="/WEB-INF/init/menu.jsp"></jsp:include>

<h2 style="text-align: center;">방명록</h2>

<article>
	<div class="container form">
		<form action="${pageContext.request.contextPath }/GuestBookAdd" method="POST">
			<input type="text" class="form-control" name="title" placeholder="제목">
			<textarea rows="5" class="form-control" name="contents" placeholder="내용"></textarea>
			<input class="btn btn-success" type="submit" value="등록">
		</form>
	</div>

	<hr>
	
	<nav style="text-align: center;">
		<ul class="pagination pagination-sm">
			<c:if test="${page != 1 }">
				<li><a href="${pageContext.request.contextPath }/guestBook">처음</a></li>
			</c:if>
			<c:if test="${page == 1 }">
				<li class="disabled"><a href="#">처음</a></li>
			</c:if>
			
			<c:if test="${startPage != 1 }">
				<li><a href="${pageContext.request.contextPath }/guestBook?page=${startPage - 1}">이전</a></li>
			</c:if>
			<c:if test="${startPage == 1 }">
				<li class="disabled"><a href="#">이전</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == page }">
					<li class="active"><a href="#"><b>${i }</b></a></li>
				</c:if>
				<c:if test="${i != page }">
					<li><a href="${pageContext.request.contextPath }/guestBook?page=${i}">${i }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage != totalPage }">
				<li><a href="${pageContext.request.contextPath }/guestBook?page=${endPage + 1}">다음</a></li>
			</c:if>
			<c:if test="${endPage == totalPage }">
				<li class="disabled"><a href="#">다음</a></li>
			</c:if>
			
			<c:if test="${page != totalPage }">
				<li><a href="${pageContext.request.contextPath }/guestBook?page=${totalPage}">끝</a></li>
			</c:if>
			<c:if test="${page == totalPage }">
				<li class="disabled"><a href="#">끝</a></li>
			</c:if>
		</ul>
	</nav>
	
	<div>
		<c:forEach var="g" items="${list }">
			<div class="container form" style="width: 500">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>글번호 : ${g.idx } / 제목 : ${g.title }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<strong>글쓴이</strong> : ${g.nickname } / <strong>작성일</strong>	: ${g.writeDate }
							</td>
						</tr>
						<tr>
							<td>${g.contents }</td>
						</tr>

					</tbody>
				</table>
				<div class="btns">
					<input class="btn btn-primary" type="button" value="수정" onclick="location.href='checkModify.jsp?idx=${g.idx}'"> 
					<input class="btn btn-danger" type="button" value="삭제" onclick="window.open('checkDelete.jsp?idx=${g.idx}', null, 'width=300,height=100,toolbar=no,scrollbars=no,menubar=no,resizagle=yes,top=300,left=300')">
				</div>
<!-- "window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');" -->
			</div>
		</c:forEach>
	</div>
</article>


</body>
</html>