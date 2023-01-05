<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%
String loginID = (String)session.getAttribute("loginID");
if(loginID==null) {%>
<!-- 세션값(로그인) 확인 -->
<script>
// 세션값 여부
	alert("세션값이 만료되어 로그인 페이지로 이동합니다.");
	location.href="/main/login";
	
	$(document).ready(function() {
		let message = "msg";
		if (message != ""){
			alert(massage);
		}
	})
</script>
<%} %>
<!-- 비밀번호 회원정보 수정 시 alert -->
<script>
$(document).ready(function() {
	let message = "msg";
	if (message != "") {
		alert(message);
	}
});
</script>