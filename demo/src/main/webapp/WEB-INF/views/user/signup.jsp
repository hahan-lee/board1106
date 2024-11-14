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
	.searchAddr{
		display: flex;
		justify-content: space-between;
	}
	.post{
		width:80px;
		margin-top:5px;
	}
	.userPost{
		width:200px;
	}
	.searchBtn{
		width:200px;
	}
	.postBox{
		display: flex;
		
	}
	.addrBox{
		margin-top:-10px;
	}
	.addrBox input{
		margin: 0 0 10px 0;
	}
	.errMsgBox{
		padding: 0 20px;
		font-size: 13px;
		color: red;
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
												<label for="userId">*아이디</label>
												<input class="form-control" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
											</div>
											<div class="errMsgBox">
												<c:if test="${not empty errMessage}">
													<p class="errMsg">${errMessage}</p>
												</c:if>
											</div>
											<div class="inputBox">
												<label for="userName">*이름</label>
												<input class="form-control" type="text" id="userName" name="userName" placeholder="이름을 입력해주세요.">
											</div>
											<div class="inputBox">
												<label for="userEmail">*이메일</label>
												<input class="form-control" type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요.">
											</div>
											<div class="inputBox">
												<label for="userPw">*비밀번호</label>
												<input class="form-control" type="password" id="userPw" name="userPw" placeholder="비밀번호 16자 이내 " >
											</div>
											<div class="inputBox">
												<label for="userPw2">*비밀번호 확인</label>
												<input class="form-control" type="password" id="userPw2" name="userPw2" placeholder="비밀번호를 확인해주세요.">
											</div>
											<div class="inputBox searchAddr">
												<div class="postBox">
													<label for="userAddress" class="post">우편번호</label>
													<input class="form-control userPost" type="text" id="userPost" name="userPost" placeholder="우편번호">
												</div>
												<div>
													<input class="btn btn-outline-primary searchBtn" type="button" onclick="sample3_execDaumPostcode()" value="주소검색"><br>
													<input type="text" id="sample3_extraAddress" placeholder="참고항목" hidden>
												</div>
												
											</div>
											<div class="inputBox addrBox">
												<label for="userAddress">주소</label>
												<input class="form-control" type="text" id="userAddress" name="userAddress" placeholder="주소를 입력해주세요.">
												<input type="text" class="form-control" id="sample3_detailAddress userDetailAddress" name="userDetailAddress" placeholder="상세주소를 입력해주세요.">
												
											</div>


											
											<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
											</div>
										</div>
											
											<div>
													
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
	
<!-- 주소찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userPost').value = data.zonecode;
                document.getElementById("userAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js">

	

	(($)=>{
		
	
		function log(item){
			console.log(item)
		}
		
		
		//값 test
		function getItem(item){
			const obj = $(item);
			if(obj !== null){
				return obj;
			}else{
				console.log(obj + "값 확인");
			}
		}
		
		log("test");
		
		/* input 값 공백 제거 이벤트*/
		 $("#userId, #userPw, #userPw2, #userName, #userEmail").on("input", function() {
		        $(this).val($(this).val().replace(/\s+/g, ""));
		 });
		 
		function confirmSignup() {
			const userId = getItem("#userId").val();
			const userPw = getItem("#userPw").val();
			const userPw2 = getItem("#userPw2").val();    
			const userName = getItem("#userName").val();
			const userEmail = getItem("#userEmail").val();
			
			
	        if(userId === "") {
	            alert("아이디를 입력해주세요.");
	            getItem("#userId").focus();
	            return false;
	        }
	        if(userName === "") {
	            alert("이름을 입력해주세요.");
	            getItem("#userName").focus();
	            return false;
	        }
	        if(userEmail === "") {
	            alert("이메일을 입력해주세요.");
	            getItem("#userEmail").focus();
	            return false;
	        }
	        if(userPw === "") {
	            alert("비밀번호를 입력해주세요.");
	            getItem("#userPw").focus();
	            return false;
	        }
	        if(userPw == userPw2){
	        	alert("비밀번호가 일치하지 않습니다. 다시입력해주세요.");
	        	getItem("#userPw2").focus();
	        	return false;
	        }
	        
			return;

		}
		
		
	})(jquery);
	
</script>
	
</body>
</html>