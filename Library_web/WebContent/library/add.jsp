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
	<form action="${pageContext.request.contextPath }/addBook" method="POST" enctype="multipart/form-data">
		<table> 
		<!-- class="table" style="table-layout:fixed; word-break:break-all;"> -->
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작가</td>
				<td><input type="text" name="author"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="file" value="이미지추가"></td>
			</tr>
			<tr>
				<td>미리보기</td>
				<td></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-primary pull-right" value="등록">
		<!--  onclick="joinConfirm()"> -->
	</form>
</div>

</body>
</html>