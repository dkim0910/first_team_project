<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>환불 및 교환 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/my-page/refund/refund.css">
</head>
<%
boolean isLoggedIn = (session != null && session.getAttribute("member") != null);
%>
<body style="cursor: default;">
	<div class="container">
		<header class="header">
			<a href="./my-page/my-main/my-page-main.jsp" class="button-back-page"
				aria-label="이전 페이지로 이동"> <svg width="35" height="35"
					viewBox="0 0 28 28" fill="none">
                    <path
						d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
						stroke="currentColor" stroke-width="1.4"></path>
                </svg>
			</a>
			<h1 style="flex-grow: 1; text-align: center;">환불 및 교환</h1>
		</header>

		<section class="products-section" id="remove-style"
			style="min-height: 100vh; display: flex; flex-direction: column;">
					<h2>환불 제품 목록</h2>
			<c:forEach var="refund" items="${Refunded}" varStatus="status">
				<c:if
					test="${empty refund.refunded_date || empty refund.refund_status}">
				</c:if>
			</c:forEach>
			<ul class="product-list">
				<c:forEach var="refund" items="${Refunded}" varStatus="status">
					<!-- 제품 5개까지만 보여주는거 -->
					<c:if test="${status.index < 5}">
						<!-- 환불 날짜 또는 환불 상태가 비어있는 경우에만 보여줌 -->
						<c:if
							test="${empty refund.refunded_date || empty refund.refund_status}">
							<li class="product-item"
								onclick="showRefundForm('${refund.product_name}', '${refund.ordered_num}')">
								<img src="${refund.image_url}" alt="${refund.product_name}"
								class="product-image"> <span class="product-name">${refund.product_name}</span>
								<span class="order-number">주문 번호: ${refund.ordered_num}</span> <span
								class="refund-button" onclick="removeStyles()">환불 신청</span>
							</li>
						</c:if>
						<!-- 환불 날짜 또는 환불 상태가 비어있지 않은 경우 생략 -->
					</c:if>
				</c:forEach>

				<c:if test="${fn:length(Refunded) == 0}">
					<li class="product-item" style="display: none;"></li>
				</c:if>
			</ul>
			<!-- forEach 문 밖이니 또 선언해주고 -->
			<c:forEach var="refund" items="${Refunded}" varStatus="status">
				<!-- 이건 List 인거 같은데 그러니 한개만 나오게끔 만들기 (환불 제품이 한개도 없을때만 나오는거니) -->
				<c:if test="${status.index < 1}">
					<c:if
						test="${not empty refund.refunded_date || not empty refund.refund_status}">
					<h2>환불할 제품이 없습니다</h2>
					</c:if>
				</c:if>
			</c:forEach>
		</section>

		<section class="refund-form-section" id="refund-form-section">
			<h2>환불 신청서</h2>
			<form id="refund-form"
				action="/setSessionForProductsAtFinished-Refund.my" method="post">
				<div class="form-group">
					<label for="product-name">제품 이름</label> <input type="text"
						id="product-name" name="product-name"
						value="${refund.product_name}" readonly>
				</div>
				<div class="form-group">
					<label for="order-number">주문 번호</label> <input type="text"
						id="order-number" name="order-number"
						value="${refund.ordered_num}" readonly>
				</div>
				<div class="form-group">
					<label for="reason">환불 사유</label>
					<textarea id="reason" name="reason" rows="4"></textarea>
				</div>
				<button type="submit" class="submit-button">환불 신청하기</button>
			</form>
		</section>

		<footer class="footer">
			<p>고객 지원 센터: 1234-5678 | 이메일: shoppinghajo@samjo.com</p>
			<p>운영 시간: 월-금, 09:00-18:00 (주말 및 공휴일 휴무)</p>
			<div>© 쇼핑하조 ALL RIGHTS RESERVED</div>
			<div>
				<span>일부 상품의 경우 쇼핑하조는 통신판매의 당사자가 아닌 통신판매중개자로서 상품, 상품정보, 거래에
					대한 책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.</span>
			</div>
		</footer>
	</div>
</body>

<script
	src="${pageContext.request.contextPath}/my-page/refund/refund.js"></script>

</html>
