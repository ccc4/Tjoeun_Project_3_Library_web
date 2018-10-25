<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/init/menu.jsp"></jsp:include>

<div class="container">
	<form action="${pageContext.request.contextPath }/join" method="POST" name="reg_frm">
		<table> 
		<!-- class="table" style="table-layout:fixed; word-break:break-all;"> -->
			<tr>
				<td width="150">아이디</td>
				<td>
					<input type="text" id="id" name="id" maxlength="12" onkeyup="checkIDOnKeyUp()">
					<input type="hidden" id="hiddenId" value="unCheck">
					<input type="button" id="idBtn" value="중복확인" onclick="uJoinCheckID()">
					<span id="userIDSpan"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" maxlength="12"></td>
			</tr>
			<tr>
				<td>비밀번호재입력</td>
				<td><input type="password" name="pw_check" maxlength="12"></td>
			</tr>
			<tr>
				<td>별명</td>
				<td>
					<input type="text" id="nickname" name="nickname" maxlength="8" onkeyup="checkNicknameOnKeyUp()">
					<input type="hidden" id="hiddenNickname" value="unCheck">
					<input type="button" id="nicknameBtn" value="중복확인" onclick="uJoinCheckNickname()">
					<span id="userNicknameSpan"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" maxlength="8"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" maxlength="4"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="1" checked>&nbsp;남자 &nbsp;
					<input type="radio" name="gender" value="0">&nbsp;여자
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="text" name="tel" maxlength="12">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" name="email" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><textarea rows="" cols="" name="address"></textarea></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="회원가입">
		<!--  onclick="joinConfirm()"> -->
	</form>
</div>
</body>
</html>