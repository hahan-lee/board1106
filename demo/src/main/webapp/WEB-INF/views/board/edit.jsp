<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
<style>
	.content{
		padding: 50px 100px;
	}
	.button-container{
		display:flex;
		justify-content: end;
		
	}

	.btn{
		width:100px;
		margin-right:20px;
	}
</style>
</head>
<body>
    <div class="content">
	    <h1>edit</h1>
	    <form action="${pageContext.request.contextPath}/board/edit" method="post"  onsubmit="return confirm('정말 수정하시겠습니까?');">
	        <input type="hidden" name="id" value="${board.id}">
	
	        <div>
	        	<label for="title" class="form-label">제목:</label><br>
	        	<input type="text" class="form-control"  id="title" name="title" value="${board.title}" required><br><br>
	        </div>
	        <div>
	        	<label for="writer" class="form-label">작성자:</label><br>
	        	<input type="text" class="form-control"  id="writer" name="writer" value="${board.writer}" required><br><br>
	        </div>
	        <div>
	        	<label for="updateUser" class="form-label">수정자:</label><br>
	        	<input type="text" class="form-control"  id="updateUser" name="updateUser" value="${board.updateUser}" required><br><br>
	        	<p>작성자와 일치하지 않을 시 수정자를 변경해주세요.</p>
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
		        <label for="content" class="form-label mt-4">내용:</label><br>
		        <textarea id="content" class="form-control"  name="content" rows="10" cols="30" required>${board.content}</textarea><br><br>
	        </div>
	        <div class="button-container">
		        <button type="submit"  class="btn btn-outline-info">수정</button>
			    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/board/view/${board.id}">뒤로 가기</a>
	        </div>
	    </form>
	</div>

    
</body>
</html>