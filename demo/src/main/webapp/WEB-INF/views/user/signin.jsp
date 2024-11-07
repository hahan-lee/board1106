<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<h1>로그인</h1>
	<div class="container">
		<div class="signin">
			<form action="${pageContext.request.contextPath}/user/signin" method="post" onsubmit="return confirm()">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." maxlength=16>
					<div style="color: red;font-size:12px;">비밀번호는 16자 이내로 입력해 주세요.</div>
				</div>
				<div class="form-group">
					<button type="submit" id="loginBtn">로그인</button>				
				</div>
			</form>
		</div>
	</div>
	
	<!-- 컨트롤러 model 입력 메세지 -->
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>

	<a href="${pageContext.request.contextPath}/user/signup">회원가입</a>



<script type="text/javascript">
	/* 스크립트 위치 오류 아래로 이동 */
	console.log("로그인 js 테스트")

	function confirm() {
		const userId = document.getElementById("userId").value;
		const userPw = document.getElementById("userPw").value;
			    
	    // 아이디가 입력되지 않은 경우
	    if (userId.trim() === "") {
	    	console.log("아이디");
	        alert("아이디를 입력해주세요.");
	        document.getElementById("userId").focus(); // 아이디 입력 필드에 포커스
	        return false; // 폼 제출 중단
	    }
	
	    // 비밀번호가 입력되지 않은 경우
	    if (userPw.trim() === "") {
	    	console.log("비밀번호");
	        alert("비밀번호를 입력해주세요.");
	        document.getElementById("userPw").focus(); // 비밀번호 입력 필드에 포커스
	        return false; // 폼 제출 중단
	    }
	
	    return true; // 모든 입력이 올바르면 폼 제출
	}
</script>
</body>
</html>