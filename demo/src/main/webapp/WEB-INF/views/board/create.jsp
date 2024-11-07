<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");

	// 사용자 이름을 가져오기 (null 체크)
	String userName = (loggedInUser != null) ? loggedInUser.getUserName() : "";

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
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
        
        <input type="submit" value="작성">
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/board/list">목록으로 돌아가기</a>
</body>
</html>