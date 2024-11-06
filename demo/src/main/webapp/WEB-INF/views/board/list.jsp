<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
		$('#chk').click(function(){
			
			alert();
		
	})
</script>

</head>


<body>
    <h1>게시판 목록</h1>
    
    <a href="${pageContext.request.contextPath}/board/delete/${board.id}">삭제</a>
    <table border="1">
        <tr>
            <th></th>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="board" items="${boards}">
            <tr>
            	<td>
            		<input type="checkbox" id="chk" name="${board.id}">
            	</td>
                <td>${board.id}</td>
                <td><a href="${pageContext.request.contextPath}/board/view/${board.id}">${board.title}</a></td>
                <td>${board.writer}</td>
                <td>${board.createdAt}</td>
            </tr>
        </c:forEach>
    </table>

    <br>
    <a href="${pageContext.request.contextPath}/board/create">새 글 작성</a>
</body>



</html>