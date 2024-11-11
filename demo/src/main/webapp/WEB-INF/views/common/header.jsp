<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>project</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">HOME</a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/board/create">글 작성</a>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/board/list">게시판</a>
	    <a class="navbar-brand" href="${pageContext.request.contextPath}/user/signup">회원가입</a>
	    <c:choose>
		    <c:when test="${not empty loggedInUser}">
		        <!-- 로그인된 사용자 -->
		        <a class="navbar-brand" href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
		    </c:when>
		    <c:otherwise>
		        <!-- 비로그인 상태 -->
		        <a class="navbar-brand" href="${pageContext.request.contextPath}/user/signin">로그인</a>
		    </c:otherwise>
		</c:choose>
    </nav>
</header>