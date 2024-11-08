<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
	li {
	    list-style-type: none;
	}
	input {
		width : 300px
	}
</style>
</head>


<body>
	<h1>회원가입 페이지 입니다.</h1>
	<div class="container">
		<div class="signup" align="center">
			<form action="${pageContext.request.contextPath}/user/signup" method="post" onsubmit="return confirmSignup()">
				<ul>
					<li>
						<label for="">아이디</label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
					</li>
					<li>
						<label for="">비밀번호</label>
						<input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." >
						<p style="font-size:11px">비밀번호는 16자 이내로 입력해 주세요.</p>
					</li>
					<li>
						<label for="">비밀번호 확인</label>
						<input type="password" id="userPw2" name="userPw2" placeholder="비밀번호를 확인해주세요.">
					</li>
					<li>
						<label for="">이름</label>
						<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
					</li>
					<li>
						<label for="">이메일</label>
						<input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요.">
					</li>
					
					<li>
						<button type="submit" id="signupBtn">회원가입</button>	
						
						<div>
							<c:if test="${not empty errMessage}">
								<p>${errMessage}</p>
							</c:if>
						</div>			
					</li>
				</ul>
				
			</form>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/index">시작화면</a>
	<a href="${pageContext.request.contextPath}/user/signin">로그인 화면</a>
	

<script type="text/javascript">

	console.log("회원가입스크립트")
	
	function log(item){
		console.log(item)
	}
	
	function getElemId(id){
		const obj = document.getElementById(id);
		if(id!==null){
			return obj;
		}else{
			log(id + "요소 ID 검증");
		}
	}
	
	log("test");
	
	function confirmSignup() {
		const userId = getElemId("userId").value;
		const userPw = getElemId("userPw").value;
		const userPw2 = getElemId("userPw2").value;    
		const userName = getElemId("userName").value;
		const userEmail = getElemId("userEmail").value;
		
        if (userId.trim() === "") {
            alert("아이디를 입력해주세요.");
            getElemId("userId").focus();
            return false;
        }
		
        if (userPw.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            getElemId("userPw").focus();
            return false;
        }
        if(userPw !== userPw2.trim()){
        	alert("비밀번호가 일치하지 않습니다. 다시입력해주세요.");
        	getElemId("userPw2").focus();
        	return false;
        }
		if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            getElemId("userName").focus();
            return false;
        }
        if (userEmail.trim() === "") {
            alert("이메일을 입력해주세요.");
            getElemId("userEmail").focus();
            return false;
        }
	
	    return; // 모든 입력이 올바르면 폼 제출
	}
</script>
	
</body>
</html>