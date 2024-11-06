<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 로드페이지</title>
</head>
<body>
스프링부트 연결화면
<h1>데이터 받기 : ${message}</h1>

<a href='board/list'>게시글 보러가기</a>
<a href="${pageContext.request.contextPath}/board/create">새 글 작성</a>

</body>
</html>