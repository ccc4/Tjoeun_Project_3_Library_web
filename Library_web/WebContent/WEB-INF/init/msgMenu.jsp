<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<input type="button" value="닫기" onclick="window.close()">
    
<h3>쪽지함</h3>
<ul>
	<li><a href="${pageContext.request.contextPath }/msg">받은쪽지</a></li>
	<li><a href="${pageContext.request.contextPath }/msgS">보낸쪽지</a></li>
	<li><a href="${pageContext.request.contextPath }/msg/write.jsp">쪽지쓰기</a></li>
</ul>