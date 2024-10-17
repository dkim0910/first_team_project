<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
<!-- 이벤트 css -->
<link rel="stylesheet" type="text/css" href="my-page/events/events_style.css">
</head>
<body>
	<div class="container">
		<header class="header">
			<a href="./my-page/my-main/my-page-main.jsp" class="button-back-page" aria-label="이전 페이지로 이동"> 
				<svg width="35" height="35" viewBox="0 0 28 28" fill="none">
                    <path d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005" stroke="white" stroke-width="1.4"></path>
                </svg>
			</a>
			<h1 style="flex-grow: 1; text-align: center;">3만의 행복</h1>
		</header>

		<section class="content">
			<c:forEach var="underthree" items="${underthree}">
				<div class="card">
					<a href="/scg.product?PRODUCT_ID=${underthree.product_id }"> <!-- 그 제품의 상세페이지로 이동 -->
						<img src="${underthree.image_url}" alt="${underthree.product_name}">
						<h3>${underthree.product_name}</h3>
						<h4>
						<c:if test="${underthree.sale_rate != 0 }">
							<span class="colorred">${underthree.sale_rate}%</span>
						</c:if>
							<strong>${underthree.price_amount}원</strong>
						</h4>
					</a>
				</div>
			</c:forEach>
		</section>

		<footer class="footer">
			<p>고객 지원 센터: 1234-5678 | 이메일: shoppinghajo@samjo.com</p>
			<p>운영 시간: 월-금, 09:00-18:00 (주말 및 공휴일 휴무)</p>
			<div>© 쇼핑하조 ALL RIGHTS RESERVED</div>
			<div>
				<span>일부 상품의 경우 쇼핑하조는 통신판매의 당사자가 아닌 통신판매중개자로서 상품, 상품정보, 거래에 대한 책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.</span>
			</div>
		</footer>
	</div>
</body>
</html>