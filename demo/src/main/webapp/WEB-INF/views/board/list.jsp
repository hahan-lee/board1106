<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style>
	.btnBox {
	  display: flex;
	  flex-direction: row;
	  justify-content: space-between;
	  flex-wrap: nowrap;
	}
	
	.creatBtnBox{
	}
</style>

</head>


<body>

    <!-- Begin Page Content -->
    <div class="container-fluid">
        <p class="mb-4">
			<!-- 로그인 유저 확인 세션데이터 받기 -->
			<div>
			<c:choose>
			    <c:when test="${not empty loggedInUser}">
			        <!-- 로그인된 사용자 -->
			        <p class="logged-in">안녕하세요, <strong>아이디:<%= loggedInUser.getUserId() %> 이름:<%= loggedInUser.getUserName() %></strong>님!</p>
			        <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
			    </c:when>
			    <c:otherwise>
			        <!-- 비로그인 상태 -->
			        <p class="lead not-logged-in">비회원 입니다.  <a href="${pageContext.request.contextPath}/user/signin">로그인</a></p>
			    </c:otherwise>
			</c:choose>     
			</div>       
        </p>
        <!-- 테이블 -->
        <form id="deleteForm" method="POST" action="${pageContext.request.contextPath}/board/deleteSelected">
			<table class="table table-hover">
			  <thead>
		          <tr>
		              <th><input class="form-check-input" type="checkbox" id="allCheck" name="allCheck"></th>
		              <th>No.</th>
		              <th>Title</th>
		              <th>Content</th>
		              <th>Writer</th>
		              <th>Date</th>
		          </tr>
			  </thead>
			  <tbody>
		           <c:forEach var="board" items="${response.list}" varStatus="status">
			            <tr class="table-primary" >
			            	<td><input class="form-check-input" type="checkbox" id="RowCheck" name="RowCheck" value="${board.id}"/></td>
			                <td>${response.pagination.limitStart + status.index+1}</td>
			                <td><a href="${pageContext.request.contextPath}/board/view/${board.id}">${board.title}</a></td>
			                <td>${board.content}</td>
			                <td>${board.writer}</td>
			                <td>
			                	<fmt:formatDate value="${board.createdAt}" pattern="yyyy년 MM월 dd일 a HH:mm"/>
			                </td>
			            </tr>
			        </c:forEach>		
			  </tbody>
			</table>
			<div class="btnBox">
				<div class="deleteBtnBox">
					<button class="deleteBtn btn btn-outline-secondary">선택삭제</button>
				</div>
				<!-- 페이지네이션 그룹 -->
				
				<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			    	<div class="btn-group">
			    		<!-- 첫페이지 버튼 -->
			    		<a class="btn btn-secondary" href="?page=${1}&recordSize=${params.recordSize}" class="prev">&laquo;</a>
				        <!-- 이전 페이지 버튼 -->
				        <c:if test="${response.pagination.existPrevPage}">
			            	<a class="btn btn-secondary" href="?page=${response.pagination.startPage - 1}&recordSize=${params.recordSize}" class="prev">&lt;</a>
				        </c:if>
					
					
				        <!-- 페이지 번호 버튼 -->
				        <c:forEach var="i" begin="${response.pagination.startPage}" end="${response.pagination.endPage}">
			                <a class="btn btn-secondary" href="?page=${i}&recordSize=${params.recordSize}">${i}</a>
				        </c:forEach>
				    
				        <c:if test="${response.pagination.existNextPage}">
			            	<!-- 다음 페이지 버튼 -->
			            	<a class="btn btn-secondary" href="?page=${response.pagination.endPage + 1}&recordSize=${params.recordSize}" class="next">&gt;</a>
				        </c:if>
			        	<!-- 끝페이지 버튼 -->
			    		<a class="btn btn-secondary" href="?page=${response.pagination.totalPageCount}&recordSize=${params.recordSize}" class="prev">&raquo;</a>
			    	</div>
				</div>
				<!-- 글작성 -->
				<div class="creatBtnBox">
					<button type="button" class="createBtn btn btn-outline-primary" onclick="goToCreatePage();">글작성</button>
				</div>
			</div>
		</form>
	</div>
		
		

	
<script>

	/* 글작성 이동 스크립트 */
	function goToCreatePage() {
        window.location.href = '/board/create';
    }
	
	
	/* chk 박스 이벤트 */
	$(function(){
		
		const rowCheck = $("input[name='RowCheck']");
		const rowCnt = rowCheck.length;
		const allCheck = $("input[name='allCheck']");
		

		if (rowCnt > 0) {
		    /* 전체체크 선택 시 모든 체크박스 체크설정하기 */
		    allCheck.click(function(){
		        const chk_listArr = rowCheck;
		        
		        for (let i=0; i<chk_listArr.length; i++){
		            chk_listArr[i].checked = this.checked;
		        }
		    });

		    /* 선택체크 모두 선택 시 전체체크박스 선택 */
		    rowCheck.click(function(){
		        if($("input[name='RowCheck']:checked").length == rowCnt){
		        	allCheck[0].checked = true;
		        }
		        else{
		        	allCheck[0].checked = false;
		        }
		    });
		}
		

        // 선택 삭제 버튼 클릭 시 aixos 요청 전송
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