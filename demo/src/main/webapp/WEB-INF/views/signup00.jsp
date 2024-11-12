<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
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
			<form>
				<ul>
					<li>
						<label for="userId">아이디</label>
						<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요." maxlength="16">
					</li>
					<li>
						<label for="userPw">비밀번호</label>
						<input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." maxlength="16">
						<div style="color: red; font-size:12px;">비밀번호는 16자 이내로 입력해 주세요.</div>
					</li>
					<li>
						<label for="userPw2">비밀번호 확인</label>
						<input type="password" id="userPw2" name="userPw2" placeholder="비밀번호 똑같이 입력해주세요." maxlength="16">
					</li>
					<li>
						<label for="userName">이름</label>
						<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요." maxlength="16">
					</li>
					<li>
						<label for="userEmail">이메일</label>
						<input type="text" class="" id="userEmail" name="userEmail" placeholder="예시) example@email.com">
					</li>
					<li>
						<div class="submit">
							<button type="submit" id="signupBtn">회원가입</button>				
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
	

<script type="text/javascript">
	
	const userId = document.querySelector("#userId");
	const userPw = document.querySelector("#userPw");
	const userPw2 = document.querySelector("#userPw2");
	const userName = document.querySelector("#userName");
	const userEmail = document.querySelector("#userEmail");
	
	const state = {
			아이디: "",
			비밀번호: "",
			비밀번호확인:"",
			이름:"",
			이메일:""
	}
	
	function log(v){
		console.log(v);
	}
	
	function docElemId(item){
		val obj = document.getElementById(item);
		if(obj !== null){
			return obj.value;
		}else {
			log(item+"는 존재하지 않습니다.");
		}
	}
	
	
	/* 1. 아이디 입력 */
	const userIdInput = (e)=>{
		let 아이디 = "";
		log("아이디 입력 테스트");
		아이디 = e.target.value;
		/* console.log("input값 테스트 : " + 아이디 ); */
		state.아이디 = 아이디;
		log("state값 테스트 : " + state.아이디 );
	}
	userId.addEventListener("blur",userIdInput);
	userId.addEventListener("keyup",userIdInput);

	/*1-2.아이디 중복확인  */
	
	/* 2. 비밀번호 입력 */
	const userPwInput = (e)=>{
		let 비밀번호 = "";
		log("비밀번호 입력 테스트");
		비밀번호 = e.target.value;
		/* console.log("input값 테스트 : " + 아이디 ); */
		state.비밀번호 = 비밀번호;
		log("state값 테스트 : " + state.비밀번호 );
	}
	userPw.addEventListener("blur",userPwInput);
	userPw.addEventListener("keyup",userPwInput);
	
	/* 3. 비밀번호확인 입력 */
	const userPw2Input = (e)=>{
		if(userPw !== userPw2 ){
			log("비밀번호 불일치");
		}else{
			log("비밀번호 일치");
		}
	}
	userPw2.addEventListener("blur",userPw2Input);
	userPw2.addEventListener("keyup",userPw2Input);
	
	/* 4. 이름 입력 */
	const userNameInput = (e)=>{
		log("이름 입력 테스트:"+e);
		
	}
	userName.addEventListener("blur",userNameInput);
	userName.addEventListener("keyup",userNameInput);
	
	/* 5. 이메일 입력 */
	const userEmailInput = (e)=>{
		log("이메일입력 테스트");
	}
	userEmail.addEventListener("blur",userEmailInput);
	userEmail.addEventListener("keyup",userEmailInput);
	
	
	
	
	function confirmSignup() {
		const userId = docElemId("userId");
		const userPw = docElemId("userPw").value;
		const userPw2 = docElemId("userPw2").value;    
		const userName = docElemId("userName").value;
		const userEmail = docElemId("userEmail").value;
		
        if (userId.trim() === "") {
            alert("아이디를 입력해주세요.");
            docElemId("userId").focus();
            return false;
        }
		
        if (userPw.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            docElemId("userPw").focus();
            return false;
        }
        if(userPw !== userPw2.trim()){
        	alert("비밀번호가 일치하지 않습니다. 다시입력해주세요.");
        	docElemId("userPw2").focus();
        	return false;
        }
		if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            docElemId("userName").focus();
            return false;
        }
        if (userEmail.trim() === "") {
            alert("이메일을 입력해주세요.");
            docElemId("userEmail").focus();
            return false;
        }
	
	    return true; // 모든 입력이 올바르면 폼 제출
	}
</script>
	
</body>
</html>