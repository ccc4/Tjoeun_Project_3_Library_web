<%@page import="mvc.util.JdbcConnection"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try(Connection conn = JdbcConnection.getConnection()) {
		out.println("커넥션 연결 성공");
	} catch(SQLException ex) {
		out.println("커넥션 연결 실패: " + ex.getMessage());
		application.log("커넥션 연결 실패", ex);
	}
%>
</body>
</html>