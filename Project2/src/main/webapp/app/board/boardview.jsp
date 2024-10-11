<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: 0 auto;
	width: 900px;
	border: 1px solid #eee;
	border-radius: 10px;
}

tr a {
 color: white;
}

.top > td {
	font-weight: bold;
	font-size: 1.5rem;
}

h3 {
	background-color: black;
	color: white;
	height: 40px;
	border-radius: 10px;
}

a {
	text-decoration: none;
	background-color: black;
	border-radius: 7px;
	font-weight: bold;
	padding: 0 5px;
	transition: all .3s;
}

a:hover {
	background-color: #eee;
	color: black;
}

.replyFormTable input {
	border: 1px solid #e5e7eb;
	border-radius: 5px;
}

.bottom-btn {
	margin-top: 5px;
	text-align: right;
}


.comment-btn {
	background-color: black;
	color: white;
	font-weight: bold;
	border-radius: 7px;
	padding: 0 7px;
}

.comment-section {
	display: none; /* 처음에는 댓글 섹션을 숨김 */
}

.comment-section.active {
	display: block; /* active 클래스가 있을 때 보임 */
}
</style>
</head>

<!-- 제이쿼리 불러오기  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<body>
	<c:set var="board" value="${requestScope.board }"/>
	<c:set var="replylist" value="${requestScope.replylist }"/>
   <div>
      <table style="width: 900px; border: 0px;">
         <tr class="top" align="center" valign="middle">
            <td><h3>REVIEW</h3></td>
         </tr>
      </table>
      <table style="border-collapse: separate;">
         <tr height="30px">
            <th align="center" width="150px">제 목</th>
            <td>
            	${board.boardtitle }
               <span style="font-weight:bold; color: black; float:right;">
                  조회수 : ${board.boardreadcount }
               </span>
            </td>
         </tr>
         <tr height="30px">
            <th align="center" width="150px">작성자</th>
            <td>${board.username }</td>
         </tr>
         <tr height="300px">
            <th align="center" width="150px">내 용</th>
            <td valign="top" style="padding:10px;">
            	${board.boardcontents }
            </td>
         </tr>
      </table>
      <table class="bottom-btn" style="border:0px;">
         <tr align="right" valign="middle">
         	<td style="text-align: right;">
         		<button class="comment-btn toggleCommentSection">댓글</button>
         		<a href="/board/BoardList.bo">목록</a>
         	</td>
         </tr>
      </table>
      
      <!-- 댓글 -->
     <div class="comment-section">
     	 <form name="replyForm" action="/board/AddReply.bo" method="post">
         <input type="hidden" name="boardnum" value="${board.boardnum}">
         <table class="replyFormTable">
            <tr>
               <td align="center" width="200px">
                  댓 글<br><hr>
                  이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="username" maxlength="10" size="10"><br>
                  비밀번호 <input name="password" type="password" size="10">
               </td>
               <td style="padding-left:10px">
                  <textarea name="replycontents" style="width:680px;height:85px;resize:none;"></textarea><br>
                  <a href="javascript:document.replyForm.submit()">등록</a>
               </td>
            </tr>
         </table>
           <!-- 댓글 리스트 -->
         <table>
	         <c:choose>
	         	<c:when test="${replylist != null and fn:length(replylist) > 0 }">
	         		<c:forEach var="reply" items="${replylist }">
			            <tr>
			               <td align="center" width="200px">${reply.username }</td>         
			               <td valign="top" style="padding-left:10px;">
			                  <textarea style="text-align:left;border:0px;width:680px;
			                     height:85px;resize:none;" name="reply${reply.replynum }" id="reply${reply.replynum }" readonly>${reply.replycontents } 
			                  </textarea><br>
			                  <a id="" href="javascript:updateReply(${reply.replynum }, '${reply.password }')">수정</a>
			                  &nbsp;&nbsp;&nbsp;
			                  <a id="" href="javascript:updateReadonlyReply(${reply.replynum })">수정 하기</a>
			                  &nbsp;&nbsp;&nbsp;
			                  <a id="" href="javascript:deleteReply(${reply.replynum }, '${reply.password }')">삭제</a>
			               </td>
			            </tr>
		            </c:forEach>
	        	</c:when>
         		<c:otherwise>
		       		<tr>
		                <td align="center">댓글이 없습니다.</td>
		            </tr>
	            </c:otherwise>
	         </c:choose>   
         </table>
     </div>
      
      <hr>   
      </form>
   </div>
   <script>
   		function updateReply(replynum, password) {
			let pw = prompt("댓글 비밀번호를 입력하세요");
			if(pw == password){
				/* replyForm라는 태그 안쪽에 있는 액션 태그를 변경 */
				document.replyForm.action = "/board/UpdateReply.bo?replynum=" + replynum;
				document.replyForm.submit();
			} else {	
				alert('비밀번호가 틀렸습니다.');
			}
			
		}
   
   		function updateReadonlyReply(replynum) {
			document.getElementById('reply' + replynum).readOnly = false;
			
		}
   		
   		function deleteReply(replynum, password) {
			// /board/DeleteReply.bo
			let pw = prompt("댓글 비밀번호를 입력하세요");
			if(pw == password){
				document.replyForm.action = "/board/DeleteReply.bo?replynum=" + replynum;
				document.replyForm.submit();
			} else {	
				alert('비밀번호가 틀렸습니다.');
			}
			
   		}
   		
   		function comment__init() {
   		    $('.toggleCommentSection').on('click', function() {
   		        $('.comment-section').toggleClass('active'); // 댓글 섹션의 active 클래스 토글
   		    });
   		}

   		comment__init() 
   		
   </script>
</body>
</html>









