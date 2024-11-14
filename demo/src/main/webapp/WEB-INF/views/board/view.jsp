<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
<style>
	body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    background-color: #fff;
	}
	.viewPost{
		display:flex;
		justify-content:center;
		padding: 50px 100px;
	}
	.content{
		width: 1000px;
	}
	.btn{
		width:80px;
	}
	
	.btnBox{
		width:260px;
		display:flex;
		justify-content:space-between;
	}
	
	.btnContainer{
		padding:5px 20px 20px 0;
		display:flex;
		justify-content:end;
	}
	
</style>
</head>
<body>

	<div class="viewPost">
	    <div class="content card mb-3">
	    	<h1 class="card-header">View</h1>
		    <div class="card-body">
		    	<p class="card-title"><strong>제목:</strong> ${board.title}</p>
			    <p class="card-title"><strong>작성자:</strong> ${board.writer}</p>
			    
			    <p class="card-title"><strong>수정자:</strong> 
			    <c:choose>
				    <c:when test="${variable != null}">
				        <fmt:formatDate value="${board.updateUser}"/>
				    </c:when>
				    <c:otherwise>
				        해당사항없음
				    </c:otherwise>
				</c:choose>
				</p>
			    <p class="card-title">
			    	<strong>작성일:</strong> 
                	<fmt:formatDate value="${board.createdAt}" pattern="yyyy년 MM월 dd일 a HH:mm"/>
				</p>
				<p class="card-title"><strong>수정일:</strong>
					<fmt:formatDate value="${board.updateAt != null ? board.updateAt : null }" pattern="yyyy년 MM월 dd일 a HH:mm"/>
				</p>
			    <p class="card-text"><strong>내용:</strong>
			    ${board.content}</p>
	    	</div>
			
			<div class="btnContainer">
				<div class="btnBox">
				    <a class="btn btn-outline-info" href="${pageContext.request.contextPath}/board/edit/${board.id}">수정</a>
				    <button class="btn btn-outline-danger" id="deleteBtn">삭제</button>
				    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/board/list">목록</a>
				</div>
			
			</div>
	    
	    </div>
    	
	 	
	</div>




<script type="text/javascript">

	/*
	(($)=>{
		
		alert('test');
		
		
		$("#deleteBtn").on("click", function() {
			alert('test');
	        if(confirm("정말 삭제하시겠습니까?")) {
	            window.location.href = `${pageContext.request.contextPath}/board/delete/${board.id}`;
	        }
	    });    	
		
	})(jquery); */

	const deleteBtn = document.getElementById("deleteBtn");
		
		deleteBtn.addEventListener("click",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				window.location.href = "${pageContext.request.contextPath}/board/delete/${board.id}";
			}
	}) 

	
</script>
    

    
</body>
</html>