<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
</head>
<body>
    <h1>게시물 상세 보기</h1>
    
	    <p><strong>제목:</strong> ${board.title}</p>
	    <p><strong>작성자:</strong> ${board.writer}</p>
	    <p><strong>작성일:</strong> ${board.createdAt}</p>
	    <p><strong>내용:</strong></p>
	    <p>${board.content}</p>

    <br>
 
    <a href="${pageContext.request.contextPath}/board/edit/${board.id}">수정</a>
    <a href="${pageContext.request.contextPath}/board/delete/${board.id}">삭제</a>
    
    <br>
    
    <a href="${pageContext.request.contextPath}/board/list">목록으로 돌아가기</a>
    
</body>
</html>