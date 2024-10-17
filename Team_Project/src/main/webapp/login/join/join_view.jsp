<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | 쇼핑하조</title>
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

/* 폼 컨테이너 */
.form-container {
	width: 450px;
	margin: 50px auto;
	background-color: white;
	padding: 50px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	box-sizing: border-box;
}

/* 모든 입력창에 적용되는 스타일 */
.input_style {
	width: 98.5%;
	height: 46px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	outline: none;
	background-color: #fafafa;
	margin-bottom: 20px;
	transition: border-color 0.3s;
	text-indent: 10px;
}

#userid, #userphone {
	width: 50%;
}

.input_style:focus {
	border-color: #999;
}

/* 중복확인 버튼 스타일 */
.check_button, .addressFind_button {
	width: 100px;
	height: 46px;
	font-size: 16px;
	background-color: #222;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
	float: right;
}

.check_button:hover {
	background-color: #555;
}

/* 성별 선택 영역 */
.gender_section {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

/* 성별 라벨과 버튼 스타일 */
.gender_section label {
	margin-right: 10px;
	font-size: 16px;
	color: #555;
}

.gender_section input[type="radio"] {
	appearance: none;
	background-color: #ddd;
	border: 1px solid #999;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	outline: none;
	cursor: pointer;
	transition: background-color 0.3s, border-color 0.3s;
	margin-right: 10px;
}

.gender_section input[type="radio"]:checked {
	background-color: #222;
	border-color: #222;
}

/* 회원가입 버튼 스타일 */
.submit_button {
	width: 100%;
	height: 48px;
	font-size: 16px;
	border: none;
	color: white;
	border-radius: 8px;
	background-color: #222;
	cursor: pointer;
	margin-top: 10px;
	transition: background-color 0.3s;
}

.submit_button:hover {
	background-color: #555;
}

.submit_button:hover {
	background-color: #555;
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

/* 화면 크기에 따라 스타일을 조정하는 미디어 쿼리 */
@media screen and (max-width: 600px) {
	.form-container {
		width: 80%; /* 작은 화면에서는 폼 너비를 80%로 설정 */
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
	<form action="/join/userjoin.fr" method="post" name="joinForm">
		<!-- 상단 회색 배경 영역 -->
		<div class="top-section"></div>
		<div class="form-container">
			<div class="input_row">
				<h2>회원가입</h2>
			</div>
			<!-- 아이디 입력 필드 -->
			<div class="input_row" id="input_userid">
				<p id="text"></p>
				<input id="userid" class="input_style" type="text" name="user_id"
					placeholder="아이디"> <input type="button" value="중복확인"
					class="check_button" onclick="checkId();" />
			</div>
			<!-- 비밀번호 입력 필드 -->
			<div class="input_row">
				<input id="userpw" class="input_style" type="password"
					name="user_pw" placeholder="비밀번호">
			</div>
			<!-- 비밀번호 확인 필드 -->
			<div class="input_row">
				<input id="userpw_re" class="input_style" type="password"
					name="userpw_re" placeholder="비밀번호 확인">
			</div>
			<!-- 이름 입력 필드 -->
			<div class="input_row">
				<input id="username" class="input_style" type="text"
					name="user_name" placeholder="이름">
			</div>
			<!-- 휴대폰 번호 입력 필드 -->
			<div class="input_row" id="input_userphone">
				<input id="userphone" class="input_style" type="text"
					name="user_phone" placeholder="휴대폰 번호"
					oninput="formatPhoneNumber(this)" maxlength="13" /> <input
					type="button" value="주소 찾기" class="addressFind_button"
					onclick="new_execDaumPostcode()" />
			</div>
			<!-- 주소 입력 필드 -->
			<div class="input_row">
				<input id="useraddress" class="input_style" type="text"
					name="user_address" placeholder="주소">
			</div>
			<br />
			<!-- 성별 선택 필드 -->
			<div class="input_row gender_section">
				<input id="male" type="radio" name="user_gender" value="M" checked>
				<label for="male">남자</label> <input id="female" type="radio"
					name="user_gender" value="W"> <label for="female">여자</label>
			</div>
			<!-- 회원가입 버튼 -->
			<div class="input_row">
				<input type="button" value="회원가입" class="submit_button"
					onclick="sendit()" />
			</div>
			<!-- 하단 링크 (로그인, 아이디/비밀번호 찾기) -->
			<div class="join">
				<a href="login_view.jsp">로그인</a> | <a href="id_find.jsp">아이디찾기</a> |
				<a href="pw_find.jsp">비밀번호찾기</a>
			</div>
		</div>
	</form>

	<script>
		function formatPhoneNumber(input) {
			// 입력 값에서 숫자만 추출
			const value = input.value.replace(/\D/g, '');

			// 11자리 제한
			if (value.length > 11) {
				input.value = value.slice(0, 11); // 11자리까지만 잘라냄
			}

			// 전화번호 형식 적용
			if (value.length === 11) {
				input.value = value.replace(/^(\d{3})(\d{4})(\d{4})$/,
						'$1-$2-$3');
			} else if (value.length > 7) {
				input.value = value.replace(/^(\d{3})(\d{4})$/, '$1-$2');
			} else if (value.length > 3) {
				input.value = value.replace(/^(\d{3})(\d{0,4})$/, '$1-$2');
			} else {
				input.value = value;
			}
		}
	</script>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/user.js"></script>
</html>




