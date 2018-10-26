<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function join() {
		
		if(!$("#id").val() ) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if(!$("#pw").val() ) {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}
		if($("#pw").val() != $("#pw_check").val() ) {
			alert("비밀번호 재확인 값이 다릅니다.");
			$("#pw_check").focus();
			return;
		}
		if(!$("#nickname").val() ) {
			alert("별명을 입력해주세요.");
			$("#nickname").focus();
			return;
		}
		if(!$("#name").val() ) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}
		if(!$("#age").val() ) {
			alert("나이를 입력해주세요.");
			$("#age").focus();
			return;
		}
		if(!$("#tel").val() ) {
			alert("연락처를 입력해주세요.");
			$("#tel").focus();
			return;
		}
		if(!$("#email").val() ) {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return;
		}
		if(!$("#address").val() ) {
			alert("주소를 입력해주세요.");
			$("#pw").focus();
			return;
		}
		
		document.reg_frm.submit();
	}
	
	function login() {
		if(!$("#id").val() ) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if(!$("#pw").val() ) {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return;
		}
		
		document.log_frm.submit();
	}
	
</script>