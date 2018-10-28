<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-inverse">
	<div class="container">
	
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		    <span class="sr-only">Toggle navigation</span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		    <span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="${pageContext.request.contextPath }/">성훈도서관</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/">메인</a></li>
				<li><a href="${pageContext.request.contextPath }/library">책목록</a></li>
				<li><a onclick="alert('준비중입니다.')">게시판</a></li>
				<li><a onclick="alert('준비중입니다.')">방명록</a></li>
				<li>
					<c:if test="${!empty sessionScope.admin }" var="adminCheck">
						<input class="btn btn-default navbar-btn btn-xs" type="button" value="관리자로그아웃" onclick="location.href='${pageContext.request.contextPath }/adminOut'">
					</c:if>
					<c:if test="${!adminCheck }">
						<input class="btn btn-default navbar-btn btn-xs" type="button" value="관리자로그인" onclick="location.href='${pageContext.request.contextPath }/member/admin.jsp'">
					</c:if>
				</li>
			</ul>
    
      
			<c:choose>
				<c:when test="${!empty sessionScope.member }">
					<ul class="nav navbar-nav navbar-right">
						<li class="h5"><span class="label label-primary">${sessionScope.member.nickname } 님 환영합니다.</span></li>
						<%-- <li><input class="btn btn-primary navbar-btn" type="button" value="쪽지" onclick="window.open('${pageContext.request.contextPath }/msg', null, 'height=500,width=500,top=200,left=600')"></li> --%>
 						<li>
 							<c:if test="${sessionScope.newMsg > 0 }" var="newMsgCheck">
	 							<button class="btn btn-primary navbar-btn" type="button" onclick="window.open('${pageContext.request.contextPath }/msg', null, 'height=500,width=500,top=200,left=600')">쪽지<span class="badge">${sessionScope.newMsg }</span></button>
 							</c:if>
 							<c:if test="${!newMsgCheck }">
	 							<button class="btn btn-default navbar-btn" type="button" onclick="window.open('${pageContext.request.contextPath }/msg', null, 'height=500,width=500,top=200,left=600')">쪽지<span class="badge">${sessionScope.newMsg }</span></button>
 							</c:if>
						</li>
						<li><input class="btn btn-default navbar-btn" type="button" value="정보수정" onclick="location.href='${pageContext.request.contextPath }/myInfo'"></li>
						<li><input class="btn btn-default navbar-btn" type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/logout'"></li>
					</ul>
				</c:when>
				<c:otherwise>
					<form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/login" method="POST" name="log_frm">
						<c:if test="${!empty cookie.saveId }" var="check">
							<div class="form-group"><input class="form-control" type="text" id="log_id" name="id" value="${cookie.saveId.value }"></div>
							<div class="form-group"><input class="form-control" type="password" id="log_pw" name="pw" placeholder="비밀번호"></div>
							<input class="btn btn-default" type="button" value="로그인" onclick="login()">
							<input class="btn btn-default" type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/member/join.jsp'">
							<div><label><input type="checkbox" name="saveId" checked><span class="label label-default">아이디 저장</span></label></div>
						</c:if>
						<c:if test="${!check }">
							<div class="form-group"><input class="form-control" type="text" id="log_id" name="id" placeholder="아이디"></div>
							<div class="form-group"><input class="form-control" type="password" id="log_pw" name="pw" placeholder="비밀번호"></div>
							<input class="btn btn-default" type="button" value="로그인" onclick="login()">
							<input class="btn btn-default" type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/joinF'">
							<div><label><input type="checkbox" name="saveId"><span class="label label-default">아이디 저장</span></label></div>
						</c:if>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
</nav>





<%-- <c:if test="${!empty sessionScope.admin }" var="adminCheck">
	<input type="button" value="관리자로그아웃" onclick="location.href='${pageContext.request.contextPath }/adminOut'">
</c:if>
<c:if test="${!adminCheck }">
	<input type="button" value="관리자로그인" onclick="location.href='${pageContext.request.contextPath }/member/admin.jsp'">
</c:if>

<h3>성훈도서관</h3>
<ul>
	<li><a href="${pageContext.request.contextPath }/">메인</a></li>
	<li><a href="${pageContext.request.contextPath }/library">책목록</a></li>
	<li><a onclick="alert('준비중입니다.')">게시판</a></li>
	<li><a onclick="alert('준비중입니다.')">방명록</a></li>
	<li><a href="${pageContext.request.contextPath }/cc.jsp">게시판</a></li>
	<li><a href="${pageContext.request.contextPath }/guestBook">방명록</a></li>
</ul>

<c:choose>
	<c:when test="${!empty sessionScope.member }">
		<div>
			<p>${sessionScope.member.nickname } 님 환영합니다.</p>
			<input type="button" value="쪽지" onclick="window.open('${pageContext.request.contextPath }/msg', null, 'height=500,width=500,top=200,left=600')">
			<input type="button" value="정보수정" onclick="location.href='${pageContext.request.contextPath }/member/myInfo.jsp'">
			<input type="button" value="로그아웃" onclick="location.href='${pageContext.request.contextPath }/logout'">
		</div>
	</c:when>
	<c:otherwise>
		<div>
			<form action="${pageContext.request.contextPath }/login" method="POST">
				<c:if test="${!empty cookie.saveId }" var="check">
					<div><input type="text" name="id" value="${cookie.saveId.value }"></div>
					<div><input type="password" name="pw" placeholder="비밀번호"></div>
					<div><label><input type="checkbox" name="saveId" checked>아이디 저장</label></div>
				</c:if>
				<c:if test="${!check }">
					<div><input type="text" name="id" placeholder="아이디"></div>
					<div><input type="password" name="pw" placeholder="비밀번호"></div>
					<div><label><input type="checkbox" name="saveId">아이디 저장</label></div>
				</c:if>
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/member/join.jsp'">
			</form>
		</div>
	</c:otherwise>
</c:choose> --%>