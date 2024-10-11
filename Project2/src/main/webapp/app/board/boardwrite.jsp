<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	color: #eee;
	padding: 2px 5px;
	border-radius: 7px;
	transition: all .3s;
}

a:hover {
	background-color: #eee;
	color: black;
}
</style>

<!-- 제이쿼리 불러오기  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<body>
	<c:if test="${not param.flag and not empty param.flag }">
		<script>
			alert("게시글 등록 실패! 다시 시도하세요")
		</script>
	</c:if>
   <div>
      <form method="post" name="boardForm" action="/board/BoardWriteOk.bo">
         <table style="width: 900px; border: 0px;">
            <tr class="top" align="center" valign="middle">
               <td><h3>REVIEW</h3></td>
            </tr>
         </table>
         <table border="1" style="border-collapse:separate;">
            <tr height="30px">
               <th align="center" width="150px">
                  제 목
               </th>
               <td>
                  <input name="boardtitle" size="50" maxlength="100" value="" placeholder="제목을 입력하세요">
               </td>
            </tr>
            <tr height="30px">
               <th align="center" width="150px">
                  작성자
               </th>
               <td>
                  <input name="username" size="20" maxlength="20" value="" placeholder="이름을 입력하세요">
               </td>
            </tr>
            <tr height="300px">
               <th align="center" width="150px">
                  내 용
               </th>
               <td>
                  <textarea name="boardcontents" style="width:700px;height:250px;"></textarea>               
               </td>
            </tr>
         </table>
         <table style="border:0px;">
            <tr align="right" valign="middle">
               <td>
                  <a href="javascript:document.boardForm.submit();">등록</a>&nbsp;&nbsp;
                  <a href="/board/BoardList.bo">목록</a>
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>









