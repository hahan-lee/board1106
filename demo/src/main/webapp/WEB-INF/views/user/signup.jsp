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
	.inputBox{
		padding:10px 20px;
	}
	.signupBtn{
		width: 400px;
	}
	.submitBtnBox{
		display: flex;
	    justify-content: center;
	}
	label{
		margin-bottom:5px;
	}
</style>
</head>


<body class="">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                <div class="card-body">
									<form action="${pageContext.request.contextPath}/user/signup" method="post" onsubmit="return confirmSignup()">
										<div class="row mb-3">
											<div class="inputBox">
												<label for="userId">아이디</label>
												<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
											</div>
											<div class="inputBox">
												<label for="userName">이름</label>
												<input class="form-control" type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
											</div>
											<div class="inputBox">
												<label for="userEmail">이메일</label>
												<input class="form-control" type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요.">
											</div>
											<div class="inputBox">
												<label for="userPw">비밀번호</label>
												<input class="form-control" type="password" id="userPw" name="userPw" placeholder="비밀번호 16자 이내 " >
											</div>
											<div class="inputBox">
												<label for="userPw2">비밀번호 확인</label>
												<input class="form-control" type="password" id="userPw2" name="userPw2" placeholder="비밀번호를 확인해주세요.">
											</div>
										</div>
											
											<div>
												<div>
													<c:if test="${not empty errMessage}">
														<p>${errMessage}</p>
													</c:if>
												</div>	
												<div class="mt-4 mb-0">
													<div class="submitBtnBox">
														<button type="submit" class="signupBtn btn btn-outline-warning" id="signupBtn">회원가입</button>	
													</div>
												</div>
											</div>
										
									</form>
								</div>
							</div>
						</div>
            		</div>
            	</div>
            </main>
        </div>
	</div>
	

<script type="text/javascript">

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