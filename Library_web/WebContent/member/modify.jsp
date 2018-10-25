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
<jsp:include page="/WEB-INF/init/mainMenu.jsp"></jsp:include>

<div class="container">
	<form action="${pageContext.request.contextPath }/modify" method="POST">
		<table> 
		<!-- class="table" style="table-layout:fixed; word-break:break-all;"> -->
			<tr>
				<td width="150">아이디</td>
				<td>
					<span>${sessionScope.member.id }</span>
				</td>
			</tr>
			<tr>
				<td>별명</td>
				<td>
					<input type="text" id="nickname" name="nickname" maxlength="8" onkeyup="checkNicknameOnKeyUp()" value="${sessionScope.member.nickname }">
					<input type="hidden" id="hiddenNickname" value="unCheck">
					<input type="button" id="nicknameBtn" value="중복확인" onclick="uJoinCheckNickname()">
					<span id="userNicknameSpan"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" maxlength="8" value="${sessionScope.member.name }"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" maxlength="4" value="${sessionScope.member.age }"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:if test="${sessionScope.member.gender == 1 }" var="genderCheck">
						<input type="radio" name="gender" value="1" checked>&nbsp;남자 &nbsp;
						<input type="radio" name="gender" value="0">&nbsp;여자
					</c:if>
					<c:if test="${!genderCheck }">
						<input type="radio" name="gender" value="1">&nbsp;남자 &nbsp;
						<input type="radio" name="gender" value="0" checked>&nbsp;여자
					</c:if>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="text" name="tel" maxlength="12" value="${sessionScope.member.tel }">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="email" maxlength="50" value="${sessionScope.member.email }">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><textarea rows="" cols="" name="address">${sessionScope.member.address }</textarea></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="수정">
		<!--  onclick="joinConfirm()"> -->
	</form>
</div>
</body>
</html>