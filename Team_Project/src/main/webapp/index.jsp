<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="gomain()">

	<script>
		// 페이지가 로드될 때 서버로 요청을 보내는 함수
		function gomain() {
			window.location.href = '/getAllItems.main';
		}
	</script>

</body>
</html>
