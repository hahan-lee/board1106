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
  
	
</head>
<body>

<header>

<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/index">Project</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <!-- <li class="nav-item">
          <a class="nav-link active" href="/">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/create">글 작성</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/signup">회원가입</a>
        </li>
        <li class="nav-item">
          <c:choose>
		    <c:when test="${not empty loggedInUser}">
		        <!-- 로그인된 사용자 -->
		        <a class="nav-link" href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
		    </c:when>
		    <c:otherwise>
		        <!-- 비로그인 상태 -->
		        <a class="nav-link" href="${pageContext.request.contextPath}/user/signin">로그인</a>
		    </c:otherwise>
		</c:choose>
        </li>
      </ul>
    </div>
  </div>
</nav>

</header>