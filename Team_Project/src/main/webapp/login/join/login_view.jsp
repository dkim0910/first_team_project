<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
<style>
@charset "UTF-8";

@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}
/* 페이지 기본 설정 */
body {
	margin: 0;
	background-color: #f4f4f4;
	font-family: 'GmarketSansMedium';
}
button, input {
	font-family: 'GmarketSansMedium';
}

/* 상단 영역 (여백 추가) */
.top-section {
	height: 100px;
	width: 100%;
}
/* 뒤로가기 버튼 */
.back_button {
	margin: -30px 0 0 -45px;
}

.button-back-page {
	background-color: white;
	border: none;
	cursor: pointer;
}

/* 폼 컨테이너 (로그인 박스 크기 증가) */
.form-container {
	width: 450px; /* 로그인 박스 너비 (크기 증가) */
	margin: 50px auto; /* 화면 중앙 배치 */
	background-color: white;
	padding: 50px; /* 내부 여백 (크기 증가) */
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	border-radius: 12px;
	box-sizing: border-box;
}

/* 모든 입력창에 적용되는 스타일 */
.input_style {
	width: 98.5%;
	height: 46px; /* 입력창 크기 증가 */
	font-size: 18px;
	border: 1px solid #ddd; /* 테두리 스타일 */
	border-radius: 8px;
	outline: none;
	background-color: #fafafa;
	margin-bottom: 20px; /* 입력창 사이 간격 증가 */
	transition: border-color 0.3s;
	text-indent: 10px;
}

.input_style:focus {
	border-color: #999; /* 포커스 시 테두리 색 변경 */
}

/* 로그인 버튼 스타일 */
.btn {
	width: 100%;
	height: 48px;
	font-size: 17px;
	border: none;
	color: white;
	border-radius: 8px;
	background-color: #222; /* 버튼 배경색 */
	cursor: pointer;
	margin-top: 10px;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: #555; /* 버튼 호버 시 색 변경 */
}

/* 하단 링크 영역 */
.join {
	font-size: 14px;
	text-align: center;
	margin-top: 15px;
}

.join a {
	text-decoration: none;
	color: #888;
	margin: 0 5px;
}

.join a:hover {
	color: #222; /* 호버 시 링크 색 변경 */
}

/* 비밀번호 확인 버튼 스타일 (중복확인과 동일하게) */
.btn1 {
	width: 40%;
	height: 46px;
	font-size: 16px;
	background-color: #222; /* 버튼 배경색 */
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px; /* 위 아래 간격 */
}

.btn1:hover {
	background-color: #555; /* 호버 시 색상 변경 */
}

/* 화면 크기에 따라 스타일을 조정하는 미디어 쿼리 */
@media screen and (max-width: 600px) {
	.form-container {
		width: 70%; /* 작은 화면에서는 폼 너비를 70%로 설정 */
	}
}

@media screen and (min-width: 1200px) {
	.form-container {
		width: 30%; /* 큰 화면에서는 폼 너비를 20%로 줄임 */
	}
}
</style>
</head>
<body>
	<%
	String flag = request.getParameter("flag");
	%>
	<form action="/join/userlogin.fr" method="post" name="frm">
		<!-- 상단 파란색 배경 영역 -->
		<div class="top-section"></div>

		<!-- 로그인 폼 컨테이너 -->
		<div class="form-container">
			<!-- 뒤로가기 버튼 -->
			<div class="back_button">
				<a href="/index.jsp">
					<button type="button" aria-label="이전 페이지로 이동(메인 페이지)"
						class="button-back-page">
						<svg fill="#000000" height="28" width="28" version="1.1"
							id="Layer_1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink"
							viewBox="0 0 404.258 404.258" xml:space="preserve">
						<polygon
								points="289.927,18 265.927,0 114.331,202.129 265.927,404.258 289.927,386.258 151.831,202.129 " />
					</svg>
					</button>
				</a>

			</div>
			<!-- 제목 -->
			<h2>로그인</h2>

			<!-- 아이디 입력 필드 -->
			<div class="input_row">
				<input type="text" name="user_id" id="userid" class="input_style"
					placeholder="아이디">
			</div>

			<!-- 비밀번호 입력 필드 -->
			<div class="input_row" style="position: relative;">
				<input type="password" name="user_pw" id="userpw"
					class="input_style" placeholder="비밀번호">
			</div>

			<!-- 비밀번호 확인 버튼 -->
			<div class="input_row_ch">
				<button type="button" id="togglePwBtn" class="btn1">비밀번호 확인</button>
			</div>
			<br />
			<!-- 로그인 버튼 -->
			<div class="input_row">
				<input type="button" value="로그인" class="btn" onclick="login()">
			</div>
			<br />
			<!-- 하단 링크 (아이디/비밀번호 찾기, 회원가입) -->
			<div class="join">
				<a href="id_find.jsp">아이디찾기</a> | <a href="pw_find.jsp">비밀번호찾기</a> |
				<a href="join_view.jsp">회원가입</a>
			</div>
		</div>
	</form>

	<script src="../js/user.js"></script>
	<script>
		// 비밀번호 확인 버튼에 마우스 올리면 비밀번호 보이기
		const togglePwBtn = document.getElementById('togglePwBtn');
		const pwField = document.getElementById('userpw');

		// 마우스가 버튼 위에 있을 때 비밀번호를 보이게 설정
		togglePwBtn.addEventListener('mouseover', function() {
			pwField.setAttribute('type', 'text'); // 비밀번호 보이기
		});

		// 마우스가 버튼에서 벗어나면 비밀번호를 다시 숨기기
		togglePwBtn.addEventListener('mouseout', function() {
			pwField.setAttribute('type', 'password'); // 비밀번호 숨기기
		});
	</script>
</body>
</html>







