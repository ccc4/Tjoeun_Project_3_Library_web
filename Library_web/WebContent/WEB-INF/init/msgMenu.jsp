<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<div><input class="btn btn-default pull-right" type="button" value="닫기" onclick="opener.parent.location.reload(); window.close();"></div>

<nav id="msgMenu" style="margin-top: 10px">
	<ul>
		<li class="h3" style="display: inline; padding: 0 10px;"><a href="${pageContext.request.contextPath }/msg">받은쪽지</a></li>
		<li class="h3" style="display: inline; padding: 0 10px;"><a href="${pageContext.request.contextPath }/msgS">보낸쪽지</a></li>
		<li class="h3" style="display: inline; padding: 0 10px;"><a href="${pageContext.request.contextPath }/msgF">쪽지쓰기</a></li>
	</ul>
</nav>
    
    
    
<%-- <input type="button" value="닫기" onclick="opener.parent.location.reload(); window.close();">
    
<h3>쪽지함</h3>
<ul>
	<li><a href="${pageContext.request.contextPath }/msg">받은쪽지</a></li>
	<li><a href="${pageContext.request.contextPath }/msgS">보낸쪽지</a></li>
	<li><a href="${pageContext.request.contextPath }/msg/write.jsp">쪽지쓰기</a></li>
</ul> --%>