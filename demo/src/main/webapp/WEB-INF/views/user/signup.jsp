<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>


<body>
	<h1>회원가입 페이지 입니다.</h1>
	<div class="container">
		<div class="signup" align="center">
			<form action="${pageContext.request.contextPath}/user/signup" method="post" onsubmit="return confirmSignup()">
				<div class="form-group" align="left">
					<label for="">아이디</label>
					<input type="text" class="" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." >
				</div>
				<div style="color: red; font-size:12px;">비밀번호는 16자 이내로 입력해 주세요.</div>
				<div class="form-group" align="left">
					<label for="">비밀번호 확인</label>
					<input type="password" class="" id="userPw2" name="userPw2" placeholder="비밀번호 똑같이 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">이름</label>
					<input type="text" class="" id="userName" name="userName" placeholder="이름을 입력해주세요.">
				</div>
				<div class="form-group" align="left">
					<label for="">이메일</label>
					<input type="text" class="" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요.">
				</div>
				
				<div class="form-group">
					<button type="submit" id="signupBtn">회원가입</button>				
				</div>
			</form>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/index">시작화면</a>
	<a href="${pageContext.request.contextPath}/user/signin">로그인 화면</a>
	

<script type="text/javascript">

	console.log("회원가입스크립트")

	
	
	function confirmSignup() {
		const userId = document.getElementById("userId").value;
		const userPw = document.getElementById("userPw").value;
		const userPw2 = document.getElementById("userPw2").value;    
		const userName = document.getElementById("userName").value;
		const userEmail = document.getElementById("userEmail").value;
		
        if (userId.trim() === "") {
            alert("아이디를 입력해주세요.");
            document.getElementById("userId").focus();
            return false;
        }
		
        if (userPw.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            document.getElementById("userPw").focus();
            return false;
        }
        if(userPw !== userPw2.trim()){
        	alert("비밀번호가 일치하지 않습니다. 다시입력해주세요.");
        	document.getElementById("userPw2").focus();
        	return false;
        }
		if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            document.getElementById("userName").focus();
            return false;
        }
        if (userEmail.trim() === "") {
            alert("이메일을 입력해주세요.");
            document.getElementById("userEmail").focus();
            return false;
        }
	
	    return true; // 모든 입력이 올바르면 폼 제출
	}
</script>
	
</body>
</html>