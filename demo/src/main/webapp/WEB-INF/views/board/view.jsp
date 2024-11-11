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
    background-color: #f8f9fa;
}

.viewPost {
    width: 80%; /* 또는 원하는 너비 */
    max-width: 800px; /* 최대 너비를 설정하여 화면 크기에 맞게 조정 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    padding: 20px;
    background-color: #ffffff; /* 배경색 */
    border-radius: 8px; /* 둥근 모서리 */
    text-align: left; /* 텍스트 왼쪽 정렬 (원하는 경우 수정) */
}

h1 {
    color: #00796b; /* 딥한 하늘색 */
    font-size: 24px;
    margin-bottom: 20px;
    text-align:center;
}

.content {
    display: flex;            /* 플렉스 박스 레이아웃 */
    flex-direction: column;   /* 세로 방향으로 배치 */
    align-items: center;      /* 수평 가운데 정렬 */
    justify-content: center;  /* 수직 가운데 정렬 */
    width: 80%;               /* 내용의 너비 */
    max-width: 800px;         /* 최대 너비 */
    margin: 0 auto;           /* 화면 가운데 정렬 */
    padding: 20px;
    border-radius: 8px;       /* 둥근 모서리 */
}

.content div {
    width: 100%; /* 내부 div가 content 전체 너비를 차지하도록 설정 */
    margin-bottom: 20px; /* 각 내용 사이에 여백 */
}
p {
    font-size: 16px;  /* 글자 크기 */
    color: #333;      /* 글자 색 */
    line-height: 1.6;  /* 줄 간격 */
    width: 560px;     /* 너비 설정 */
    height: 50px;     /* 높이 설정 */
    padding: 10px;    /* 여백 설정 */
    border: 1px solid #80deea;  /* 연한 하늘색 테두리 */
    border-radius: 5px;  /* 둥근 모서리 */
    background-color: #f1f8f7;  /* 연한 하늘색 배경 */
    box-sizing: border-box;  /* padding과 border를 포함한 크기 계산 */
    display: inline-block;  /* input처럼 한 줄에 표시 */
    font-size: 18px;    /* 텍스트 크기 */
}


strong {
    color: #00796b; /* 딥한 하늘색 */
}

a.btnStyle {
    display: inline-block;
    background-color: #00bcd4; /* 시원한 하늘색 */
    color: white;
    padding: 8px 15px;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 10px;
    margin-right: 10px;
}

.btnStyle:hover {
    background-color: #0097a7; /* 진한 하늘색 */
    text-decoration: none;
}

a.btnStyle:active {
    background-color: #00796b; /* 클릭 시 더 진한 색 */
}

a.btnStyle:last-child {
    background-color: #ff4081; /* 목록으로 돌아가기 버튼 색상 */
}

a.btnStyle:last-child:hover {
    background-color: #f50057; /* 목록 버튼 hover 색상 */
}


</style>
</head>
<body>

	<div class="viewPost">
		<h1>게시물 상세 보기</h1>
	    
	    <div class="content">
		    <div>
		    	<p><strong>제목:</strong> ${board.title}</p>
			    <p><strong>작성자:</strong> ${board.writer}</p>
			    <p><strong>작성일:</strong> 
                	<fmt:formatDate value="${board.createdAt}" pattern="yyyy년 MM월 dd일 a HH:mm"/>
				</p>
				<p><strong>수정일:</strong>
				</p>
			    <p><strong>내용:</strong>
			    ${board.content}</p>
	    	</div>
		
			<div class="btnBox">
			    <a class="btnStyle" href="${pageContext.request.contextPath}/board/edit/${board.id}">수정</a>
			    <a class="btnStyle" href="${pageContext.request.contextPath}/board/delete/${board.id}">삭제</a>
			    <a class="btnStyle" href="${pageContext.request.contextPath}/board/list">목록</a>
			</div>
	    
	    </div>
    	
	 	
	</div>
    
    
</body>
</html>