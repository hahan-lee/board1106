<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

        <div>
        	<label for="title">제목:</label><br>
        	<input type="text" id="title" name="title" value="${board.title}" required><br><br>
        </div>
        <div>
        	<label for="writer">작성자:</label><br>
        	<input type="text" id="writer" name="writer" value="${board.writer}" required><br><br>
        </div>
        <div>
	       	<p>
		    	<strong>작성일:</strong> 
	            <fmt:formatDate value="${board.createdAt}" pattern="yyyy년 MM월 dd일 a HH:mm"/>
	        </p>
        </div>
        <!-- 수정일자 -->
        <div>
        	<strong>수정일:</strong> 
			<fmt:formatDate value="${board.updateAt}" pattern="yyyy년 MM월 dd일 a HH:mm"/>
        	<br><br>
        </div>
        <div>
	        <label for="content">내용:</label><br>
	        <textarea id="content" name="content" rows="10" cols="30" required>${board.content}</textarea><br><br>
        </div>
        <div>
	        <input type="submit" value="수정">
        </div>
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/board/view/${board.id}">뒤로 가기</a>
</body>
</html>