<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.board.demo.model.User" %>
<%
    // 세션에서 로그인 사용자 정보를 가져옴
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>
<%@ include file="../common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>


<body>
    
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Board-list</h1>
        
        <p class="mb-4">
			<!-- 로그인 유저 확인 세션데이터 받기 -->
			<div>
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
			</div>       
        </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                
            </div>
            <div class="card-body">
                <div class="table-responsive">
                	<form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/board/deleteSelected">

	                    <h1></h1>
	                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                        <thead>
	                            <tr>
	                                <th><input type="checkbox" id="allCheck" name="allCheck"></th>
	                                <th>No.</th>
	                                <th>Title</th>
	                                <th>Content</th>
	                                <th>Writer</th>
	                                <th>Date</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach var="board" items="${boards}" varStatus="status">
						            <tr>
						            	<td><input type="checkbox" id="RowCheck" name="RowCheck" value="${board.id}"/></td>
						                <td>${status.index + 1}</td>
						                <td><a href="${pageContext.request.contextPath}/board/view/${board.id}">${board.title}</a></td>
						                <td>${board.content}</td>
						                <td>${board.writer}</td>
						                <td>${board.createdAt}</td>
						            </tr>
						        </c:forEach>
	                    </table>
                    </form>
                </div>
            </div>
        </div>
		<input type="button" value="선택삭제" class="btn btn-outline-info deleteBtn">
		<input type="button" value="글 작성" class="btn btn-outline-info createBtn" onclick="goToCreatePage();">
    </div>
    <!-- /.container-fluid -->

	<div>
		<a href="${pageContext.request.contextPath}/board/create">글 작성</a>
	    <a href="${pageContext.request.contextPath}/index">첫화면 가기</a>    
	</div>
	
	
	
<script>

	/* 글작성 이동 스크립트 */
	function goToCreatePage() {
        window.location.href = '/board/create';
    }
	
	
	/* chk 박스 이벤트 */
	$(function(){
		
		const chkObj = document.getElementsByName("RowCheck");
		const rowCnt = chkObj.length;

		if (rowCnt > 0) {
		    /* 전체체크 선택 시 모든 체크박스 체크설정하기 */
		    $("input[name='allCheck']").click(function(){
		        const chk_listArr = $("input[name='RowCheck']");
		        for (var i=0; i<chk_listArr.length; i++){
		            chk_listArr[i].checked = this.checked;
		        }
		    });

		    /* 선택체크 모두 선택 시 전체체크박스 선택 */
		    $("input[name='RowCheck']").click(function(){
		        if($("input[name='RowCheck']:checked").length == rowCnt){
		            $("input[name='allCheck']")[0].checked = true;
		        }
		        else{
		            $("input[name='allCheck']")[0].checked = false;
		        }
		    });
		}
		

        // 선택 삭제 버튼 클릭 시 AJAX 요청 전송
        $('.deleteBtn').on('click', function() {
            let selectedIds = [];
            
            
            $('input[name="RowCheck"]:checked').each(function() {
                selectedIds.push($(this).val());
            });

            if (selectedIds.length === 0) {
            	/* 선택값 리스트 없을 시 */
                alert("선택된 항목이 없습니다.");
                return;
            }
           
           	/* 선택값 존재 => 삭제여부 confirm */
           	if(!confirm("삭제하시겠습니까?")){
           		alert('취소하였습니다.');
           		return;
           	}
           	
            /* 다중삭제 컨트롤러 전달 */
           	axios({
           		url:'${pageContext.request.contextPath}/board/deleteSelected',
           		method:'POST',
           		data:{
           		 	selectedIds: selectedIds // JSON 데이터
           		}
           	})
           	.then((res)=>{
           	    // 성공적인 응답 처리
           	    if (res.data.message === 'success') {
           	        alert("선택된 게시글이 삭제되었습니다.");
           	        location.reload(); // 페이지 새로고침하여 테이블 갱신
           	    } else {
           	        alert("삭제 실패. 다시 시도해주세요.");
           	    }
           	})
           	.catch((error)=>{
           	    // 에러 처리
           	    console.log("Error:", error);
           	    alert("에러가 발생했습니다.");
           	});    
           
        });
		
	});
	
</script>


</body>



</html>