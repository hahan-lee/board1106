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
  	<!-- 부트스트랩 CSS 추가 -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


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
            		<input type="checkbox" name="">
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
    <input type="button" value="선택삭제" class="btn-chk-delete" onclick="deleteValue();">
    <a href="${pageContext.request.contextPath}/index">목록으로 돌아가기</a>
</body>

<!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>Tokyo</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                            <td>$170,750</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>San Francisco</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                            <td>$86,000</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
<script>
 	console.log("체크이벤트 시작");
	const ckdId = document.querySelector('.signup-btn');

	console.log(ckdId);
</script>



    <!-- 자바스크립트 추가 부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>

</html>