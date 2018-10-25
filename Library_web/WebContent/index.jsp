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
					<td>${rt.title }</td>
					<td>${rt.reserveDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>