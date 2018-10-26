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

<%-- <input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/library'"> --%>
<!-- <input type="button" value="뒤로" onclick="history.back()"> -->
<input type="button" value="닫기" onclick="window.close()">

<h3>책 정보</h3>

<div>
	<table border="1">
		<tr>
			<td>책제목</td>
			<td>${book.title }</td>
		</tr>
		<tr>
			<td>저자</td>
			<td>${book.author }</td>
		</tr>
		<tr>
			<td>출판사</td>
			<td>${book.publisher }</td>
		</tr>
		<tr>
			<td>상태</td>
			<td>
				<c:if test="${bookCnt > 0 }" var="cntCheck">
					<c:out value="대여 및 예약 가능"></c:out>
				</c:if>
				<c:if test="${!cntCheck}">
					<c:out value="해당 책은 현재 모두 대여(or예약) 상태입니다."></c:out>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<c:if test="${book.imgName == '' }">
					사진없음
				</c:if>
				<c:if test="${book.imgName != '' }">
					<img src="${pageContext.request.contextPath}${book.imgName }" alt="사진">
				</c:if>
			</td>
		</tr>
	</table>
	
	<div>
		<c:if test="${rentalOk }">
			<input type="button" value="대여" onclick="location.href='${pageContext.request.contextPath }/rental?b_idx=${book.idx }'">
		</c:if>
		<c:if test="${!rentalOk }">
			<input type="button" value="대여" disabled>
		</c:if>
		<c:if test="${reserveOk }">
			<input type="button" value="예약" onclick="location.href='${pageContext.request.contextPath }/reserve?b_idx=${book.idx }'">
		</c:if>
		<c:if test="${!reserveOk }">
			<input type="button" value="예약" disabled>
		</c:if>
	</div>
	
	<c:if test="${!empty sessionScope.member }">
		<div>
			<c:if test="${returnOk }">
				<input type="button" value="반납" onclick="location.href='${pageContext.request.contextPath }/return?b_idx=${book.idx }'">
			</c:if>
			<c:if test="${!returnOk }">
				<input type="button" value="반납" disabled>
			</c:if>
			<c:if test="${cancelOk }">
				<input type="button" value="예약취소" onclick="location.href='${pageContext.request.contextPath }/cancel?b_idx=${book.idx }'">
			</c:if>
			<c:if test="${!cancelOk }">
				<input type="button" value="예약취소" disabled>
			</c:if>
		</div>
	</c:if>
</div>


</body>
</html>