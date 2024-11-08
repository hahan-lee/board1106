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
<body class="bg-primary">

<div class="container">
	<div class="row justify-content-center">
	    <div class="col-lg-5">
	    	<div class="card shadow-lg border-0 rounded-lg mt-5">
				<div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/user/signin" method="post" onsubmit="return confirm()">
						<div class="form-floating mb-3" align="left">
							<label for="">아이디</label>
							<input type="text" class="form-control form-control-user" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="form-floating mb-3" align="left">
							<label for="">비밀번호</label>
							<input type="password" class="form-control form-control-user" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." maxlength=16>
						</div>
					
						<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
							<a class="small" href="password.html">회원가입</a>
							<button type="submit" class="btn btn-primary" id="loginBtn">로그인</button>
                        </div>
					</form>
				</div>
			</div>
	    </div>
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