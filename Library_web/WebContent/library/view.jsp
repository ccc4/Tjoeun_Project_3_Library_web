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

<input class="btn btn-default pull-right" type="button" value="닫기" onclick="window.close()">

<div class="container">
	<table class="table">
		<caption class="h4">책정보</caption>
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
		<tr>
			<td colspan="2">
				<div class="pull-right">
					<c:if test="${rentalOk }">
						<input class="btn btn-default" type="button" value="대여" onclick="location.href='${pageContext.request.contextPath }/rental?b_idx=${book.idx }'">
					</c:if>
					<c:if test="${!rentalOk }">
						<input class="btn btn-default" type="button" value="대여" disabled>
					</c:if>
					<c:if test="${reserveOk }">
						<input class="btn btn-default" type="button" value="예약" onclick="location.href='${pageContext.request.contextPath }/reserve?b_idx=${book.idx }'">
					</c:if>
					<c:if test="${!reserveOk }">
						<input class="btn btn-default" type="button" value="예약" disabled>
					</c:if>
				</div>
			</td>		
		</tr>
		<c:if test="${!empty sessionScope.member }">
			<tr>
				<td colspan="2">
					<div class="pull-right">
						<c:if test="${returnOk }">
							<input class="btn btn-default" type="button" value="반납" onclick="location.href='${pageContext.request.contextPath }/return?b_idx=${book.idx }'">
						</c:if>
						<c:if test="${!returnOk }">
							<input class="btn btn-default" type="button" value="반납" disabled>
						</c:if>
						<c:if test="${cancelOk }">
							<input class="btn btn-default" type="button" value="예약취소" onclick="location.href='${pageContext.request.contextPath }/cancel?b_idx=${book.idx }'">
						</c:if>
						<c:if test="${!cancelOk }">
							<input class="btn btn-default" type="button" value="예약취소" disabled>
						</c:if>
					</div>
				</td>
			</tr>
		</c:if>
	</table>
	
	
	
	
</div>

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>