<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/init/prelude.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/init/mainMenu.jsp"></jsp:include>

<div class="container">
	<form action="${pageContext.request.contextPath }/join" method="POST" name="reg_frm">
		<table class="table"> 
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
				<td><input type="password" name="pw" id="pw" maxlength="12"></td>
			</tr>
			<tr>
				<td>비밀번호재입력</td>
				<td><input type="password" name="pw_check" id="pw_check" maxlength="12"></td>
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
				<td><input type="text" id="name" name="name" maxlength="8"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" id="age" name="age" maxlength="4"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="1" checked>&nbsp;남자 &nbsp;
					<input type="radio" name="gender" value="0">&nbsp;여자
				</td>
			</tr>
			<tr>
				<td>연락처(-없이 입력)</td>
				<td>
					<input type="number" id="tel" name="tel" maxlength="12">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="email" id="email" name="email" maxlength="50">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><textarea id="address" name="address"></textarea></td>
			</tr>
		</table>
		<input class="btn btn-default pull-right" type="button" value="회원가입" onclick="join()">
		<!--  onclick="joinConfirm()"> -->
	</form>
</div>

<jsp:include page="/WEB-INF/init/coda.jsp"></jsp:include>
</body>
</html>