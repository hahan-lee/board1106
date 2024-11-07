<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>
<%@ include file="common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 로드페이지</title>
</head>
<body>
스프링부트 연결화면
<h1> 메인화면 테스트 입니다. </h1>
<h1>데이터 받기 test : ${message}</h1>

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
    <br>
	<a href='board/list'>게시글 보러가기</a>
	<br>
	<a href="${pageContext.request.contextPath}/board/create">새 글 작성</a>
	<br>
	<a href='user/signup'>회원가입</a>
	<br>
	<a href='user/signin'>로그인</a>
	<br>
	<a href='user/userlist'>회원리스트 출력</a>
</body>
</html>