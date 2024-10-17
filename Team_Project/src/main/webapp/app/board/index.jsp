<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-box {
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

a {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: black;
	border-radius: 10px;
	width: 100px;
	height: 50px;
	margin: 0 10px;
	transition: all .3s;
}

a:hover {
	background-color: #eee;
	color: black;
}
</style>
</head>

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<body>

	<div class="btn-box">
		<a href="/board/BoardWrite.bo">글 쓰기</a><br/>
		<a href="${pageContext.request.contextPath }/board/BoardList.bo">글 목록</a>
	</div>
</body>
</html>