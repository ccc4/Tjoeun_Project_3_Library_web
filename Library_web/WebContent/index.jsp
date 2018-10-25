<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성훈도서관</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/menu.jsp"></jsp:include>

<div>
	AA 
</div>

<c:if test="${!empty sessionScope.member }">
	<div>
		<table border="1">
			<caption>대여정보</caption>
			<thead>
				<tr>
					<th></th>
					<th>책제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rt" items="${rentalList }" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td><a onclick="window.open('${pageContext.request.contextPath }/lView?b_idx=${rt.b_idx }', null, 'height=500,width=500,top=200,left=200')">${rt.title }</a></td>
						<td>${rt.rentalDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table border="1">
			<caption>예약정보</caption>
			<thead>
				<tr>
					<th></th>
					<th>책제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rv" items="${reservationList }" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td><a onclick="window.open('${pageContext.request.contextPath }/lView?b_idx=${rv.b_idx }', null, 'height=500,width=500,top=200,left=200')">${rv.title }</a></td>
						<td>${rv.reserveDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>
<c:if test="${empty sessionScope.member }">
	<div>대여,예약정보를 알고싶으면 로그인해주세요.</div>
</c:if>

</body>
</html>