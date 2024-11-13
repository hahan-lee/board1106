<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");

	// 사용자 이름을 가져오기 (null 체크)
	String userName = (loggedInUser != null) ? loggedInUser.getUserName() : "";

%>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
<style>
	.content{
		padding: 50px 100px;
	}
	.button-container{
		display:flex;
		justify-content: center;
	}
	.creatSubmitBtn{
		margin-right:50px;
	}
	.btn{
		width:80px;
	}
</style>

</head>
<body>
    <div class="content">
    	<h1>Create</h1>
		<form action="${pageContext.request.contextPath}/board/create" method="post">
	        <label for="title" class="form-label mt-4">제목:</label><br>
	        <input type="text" class="form-control" id="title" name="title" required><br><br>
	        
	        <label for="writer" class="form-label mt-4">작성자:</label><br>
	        <input type="text" class="form-control" id="writer" name="writer" value="<%= userName %>" required ><br><br>
	        
	        <label for="content" class="form-label mt-4">내용:</label><br>
	        <textarea id="content" class="form-control" name="content" rows="10" cols="30" required></textarea><br><br>
	        
	        <div class="button-container" class="form-label mt-4">
	            <input type="submit" class="creatSubmitBtn btn btn-outline-primary" value="작성">
	            <input type="button" class="listBtn btn btn-outline-primary" value="목록" onclick="goListBtn()">
	        </div>
	    </form>    
    </div>
    

</body>

<script type="text/javascript">

	function goListBtn() {
		window.location.href = '/board/list';
	}

</script>
</html>