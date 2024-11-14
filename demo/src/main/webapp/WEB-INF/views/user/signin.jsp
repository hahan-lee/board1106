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
<style>
	.container{
		display:flex;
		justify-content:center;
	}
	.card{
		width: 500px;
	}
	.formBox{
		padding:20px;
	}
	.btnBox{
		display: flex;
 		justify-content: space-between;
 		padding:20px 0 10px 0;
	}
	p{
		padding: 20px 0 0 0;
		font-size:12px;
	}
	
</style>

</head>
<body>

<div class="container">
	<div class="row">
	    <div class="">
	    	<div class="card shadow-lg border-0 rounded-lg mt-5">
				<div class="card-header">
					<h3 class="text-center font-weight-light my-4">Login</h3>
				</div>
				<div class="formBox">
					<form action="${pageContext.request.contextPath}/user/signin" method="post" onsubmit="return loginForm()">
						<div class="">
							<label for="userId" class="form-label mt-4">아이디</label>
							<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="">
							<label for="userPw" class="form-label mt-4">비밀번호</label>
							<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요." maxlength=16>
							<!-- 컨트롤러 model 입력 메세지 -->
						    <c:if test="${not empty errorMessage}">
						        <p style="color: red;">${errorMessage}</p>
						    </c:if>
												
						
						</div>
					
						<div class="btnBox">
							<a class="btn btn-outline-warning" href='${pageContext.request.contextPath}/user/signup'>회원가입</a>
							<button type="submit" class="btn btn-outline-primary" id="loginBtn">로그인</button>
                        </div>
					</form>
				 </div>
			 </div>
	     </div>
	 </div>
</div>

	
	

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js">

	(($)=>{
		
		//값 test
		function getItem(item){
			const obj = $(item);
			if(obj !== null){
				return obj;
			}else{
				console.log(obj + "값 확인");
			}
		}
		
		/* input 값 공백 제거 이벤트*/
		 $("#userId, #userPw, #userPw2, #userName, #userEmail").on("input", function() {
		        $(this).val($(this).val().replace(/\s+/g, ""));
		 });
		
		function loginForm() {
			const userId = getItem("#userId").val();
			const userPw = getItem("#userPw").val();
						    
		    // 아이디가 입력되지 않은 경우
		    if (userId === "") {
		    	console.log("아이디");
		        alert("아이디를 입력해주세요.");
		        $("#userId").focus();
		        return false; // 폼 제출 중단
		    }
		
		    // 비밀번호가 입력되지 않은 경우
		    if (userPw === "") {
		    	console.log("비밀번호");
		        alert("비밀번호를 입력해주세요.");
		        $("#userPw").focus();
		        return false; // 폼 제출 중단
		    }
		
		    return true;
		}		
		
	})(jquery);

</script>

</body>
</html>