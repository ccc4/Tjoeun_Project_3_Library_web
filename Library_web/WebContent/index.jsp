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
<jsp:include page="/WEB-INF/init/mainMenu.jsp"></jsp:include>

<c:if test="${!empty sessionScope.member }">
	<div class="container">
		<table class="table table-striped" style="table-layout:fixed; word-break:break-all; width: 500; float: left;">
			<caption class="h4">대여정보</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>책제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rt" items="${rentalList }" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td><a onclick="window.open('${pageContext.request.contextPath }/lView?b_idx=${rt.b_idx }', null, 'height=500,width=500,top=200,left=600')">${rt.title }</a></td>
						<td>${rt.rentalDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table class="table table-striped" style="table-layout:fixed; word-break:break-all; width: 500; float: left;">
			<caption class="h4">예약정보</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>책제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rv" items="${reservationList }" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td><a onclick="window.open('${pageContext.request.contextPath }/lView?b_idx=${rv.b_idx }', null, 'height=500,width=500,top=200,left=600')">${rv.title }</a></td>
						<td>${rv.reserveDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<c:if test="${empty sessionScope.member }">
	<div class="container">
		<div class="jumbotron" style="background-image: url('images/lion.jpg');">
			<h2 class="text-center" style="color: white">성훈도서관 홈페이지입니다.</h2>
			<p class="text-center" style="color: white">대여,예약정보를 알고싶으면 로그인해주세요.</p>
			<p class="text-center">
				<a class="btn btn-default btn-lg" href="${pageContext.request.contextPath }/joinF" role="button">회원가입&raquo;</a>
			</p>
		</div>
	</div>
</c:if>


<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>