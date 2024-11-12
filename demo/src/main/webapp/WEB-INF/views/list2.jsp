<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>


<body>
    <h1>게시판 목록</h1>
    <c:choose>
        <c:when test="${not empty loggedInUser}">
            <!-- 로그인된 사용자 -->
            <p>안녕하세요, <strong>아이디:<%= loggedInUser.getUserId() %> 이름:<%= loggedInUser.getUserName() %></strong>님!</p>
            <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
            <!-- 비로그인 상태 -->
            <p>비회원 입니다.</p>
            <a href="${pageContext.request.contextPath}/user/signin">로그인</a>
        </c:otherwise>
    </c:choose>    
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