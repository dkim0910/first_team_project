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
.top > td {
	font-weight: bold;
	font-size: 1.5rem;
}

h3 {
	background-color: black;
	color: white;
	height: 40px;
}

a:visited {
	text-decoration: none;
}

a:hover {
	font-weight: bold;
}

a:link {
	color: black;
}

table {
	margin: 0 auto;
}

.bottom {
	color: white;
}

.bottom a {
	background-color: black;
	padding: 5px;
	border-radius: 7px;
	transition: all .3s;
}

.bottom a:hover {
	background-color: #eee;
	color: black;
}
</style>
</head>

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<body>
	<c:set var="BoardList" value="${requestScope.BoardList }"/>		<!-- BoardListAction에 이름이랑 같아야됨 .boardList -->
	<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
	
	<c:set var="nowPage" value="${requestScope.nowPage }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>

	<div>
		<table style="width: 900px;border: 1px;">
			<tr class="top" align="center" valign="middle">
				<td><h3>REVIEW</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>글 개수 : ${totalCnt } 개</td>
			</tr>
		</table>
		<table border="1" 
				style="border-collapse: separate;border-spacing: 0;width: 900px;" >
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="17%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			<%-- 게시글 작성 --%>
			<c:choose>
				<c:when test="${BoardList != null and fn:length(BoardList) > 0 }">
					<c:forEach var="board" items="${BoardList }">
						<tr align="center" valign="middle" 
							onmouseover="this.style.background='#bbdefb'" 
							onmouseout="this.style.background='' ">
							<td height="23px">
								${board.boardnum }
							</td>
							<td height="23px">
								<a href="/board/BoardView.bo?boardnum=${board.boardnum }">${board.boardtitle }</a> 
							</td>
							<td height="23px">
								${board.username }
							</td>
							<td height="23px">
								${board.boarddate }
							</td>	
							<td height="23px">
								${board.boardreadcount }
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<%-- 게시글이 없는 경우 --%>
	               <tr style="height:50px;">
	                  <td colspan="5" style="text-align:center;">등록된 게시물이 없습니다.</td>
	               </tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br>
		<%-- 페이징 처리 --%>
		<table style="border: 0px; width: 900px;">
			<tr align="center" valign="middle">
				<td>
					<c:if test="${nowPage > 1 }">
						<a href="/board/BoardList.bo?page=${nowPage-1}">&lt;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						 <c:choose>
						 	<%-- 현재 보고있는 페이지는 a tag 제거 --%>
							<c:when test="${i == nowPage }">${i }</c:when>
						 	<c:otherwise>
							  	<a href="/board/BoardList.bo?page=${i}">${i }</a> <!-- 잘 그려지는지 확인 [1]...[10] 글 개수 만큼 나옴 글 전체 개수가 21개면 [3]페이지 까지 나옴 -->
							</c:otherwise>
						 </c:choose>
					</c:forEach>
					<c:if test="${nowPage < totalPage }">
						<a href="/board/BoardList.bo?page=${nowPage+1}">&gt;</a>
					</c:if>
				</td>
			</tr>			
		</table>		
				
				
		<table style="border: 0px;width: 900px; ">
			<tr class="bottom" align="right" valign="middle">
				<td><a href="/board/BoardWrite.bo">글쓰기</a></td>
			</tr>
		</table>
	</div>
</body>
</html>








