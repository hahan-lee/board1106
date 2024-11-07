<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
</head>
<body>
    <h1>게시물 수정</h1>
    
    <form action="${pageContext.request.contextPath}/board/edit" method="post">
        <input type="hidden" name="id" value="${board.id}">
        
        <label for="title">제목:</label><br>
        <input type="text" id="title" name="title" value="${board.title}" required><br><br>
        
        <label for="writer">작성자:</label><br>
        <input type="text" id="writer" name="writer" value="${board.writer}" required><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="10" cols="30" required>${board.content}</textarea><br><br>
        
        <input type="submit" value="수정">
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/board/view/${board.id}">뒤로 가기</a>
</body>
</html>