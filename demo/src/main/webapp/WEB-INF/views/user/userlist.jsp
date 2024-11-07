<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트 출력 페이지 test</title>
</head>
<body>
회원 리스트 출력 테스트
    <table border="1">
        <tr>
            <th></th>
            <th>번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>비밀번호</th>
            <th>이메일</th>
            <th>가입일</th>
        </tr>
        <c:forEach var="user" items="${Users}">
            <tr>
            	<td>
            		<input type="checkbox" id="chk" name="${user.idx}">
            	</td>
            	<td>${user.idx}</td>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userPw}</td>
                <td>${user.userEmail}</td>
                <td>${user.createdAt}</td>
            </tr>
        </c:forEach>
    </table>
    <a href='${pageContext.request.contextPath}/user/signup'>회원가입</a>
	<br>
	<a href='${pageContext.request.contextPath}/user/signin'>로그인</a>
</body>
</html>