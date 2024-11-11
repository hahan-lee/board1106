<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");

	// 사용자 이름을 가져오기 (null 체크)
	String userName = (loggedInUser != null) ? loggedInUser.getUserName() : "";

%>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #f8f9fa;
}

h1 {
    color: #00796b; /* 딥한 하늘색 */
    font-size: 24px;
    margin-bottom: 20px;
    text-align:center;
    padding: 20px 0 0 0 ;
}

form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    margin: 0 auto;
}

label {
    font-size: 16px;
    color: #00796b; /* 딥한 하늘색 */
    display: block;
    margin-bottom: 8px;
}

input[type="text"], textarea {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #80deea; /* 연한 하늘색 테두리 */
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;
    background-color: #f1f8f7; /* 연한 하늘색 배경 */
}

button-container {
    display: flex;
    gap: 10px; /* 버튼 사이에 여백 */
}

input[type="submit"], input[type="button"] {
    background-color: #00bcd4; /* 시원한 하늘색 */
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    flex: 1; /* 버튼들이 같은 크기로 확장됨 */
}

input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #0097a7; /* 진한 하늘색 */
}

input[type="button"] {
    background-color: #ff4081; /* 목록 버튼에 색상 차이 */
    width: auto;
    margin-top: 10px;
    display: inline-block;
}

a {
    color: #00796b; /* 하늘색 느낌의 링크 */
    text-decoration: none;
    font-size: 16px;
}

a:hover {
    text-decoration: underline;
}


</style>

</head>
<body>
    <h1>새 글 작성</h1>
    
    <form action="${pageContext.request.contextPath}/board/create" method="post">
        <label for="title">제목:</label><br>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="writer">작성자:</label><br>
        <input type="text" id="writer" name="writer" value="<%= userName %>" required ><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="10" cols="30" required></textarea><br><br>
        
        <div class="button-container">
            <input type="submit" value="작성">
            <input type="button" class="listBtn" value="목록" onclick="goListBtn()">
        </div>
    </form>

</body>

<script type="text/javascript">

	function goListBtn() {
		window.location.href = '/board/list';
	}

</script>
</html>