<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<%
boolean isLoggedIn = (session != null && session.getAttribute("member") != null);
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문 내역 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/my-page/ordered/order-status.css">
</head>

<body style="cursor: default;">
	<div class="container" style="text-align: center;">
		<header class="header">
			<a href="../../my-page/my-main/my-page-main.jsp"
				class="button-back-page" aria-label="이전 페이지로 이동"> <svg
					width="35" height="35" viewBox="0 0 28 28" fill="none">
                    <path
						d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
						stroke="currentColor" stroke-width="1.4"></path>
                </svg>
			</a>
			<h1 style="flex-grow: 1; text-align: center;">주문 내역</h1>
		</header>

		<div class="orderlist"
			style="min-height: 100vh; display: flex; flex-direction: column;">
			<h1>나의 주문 내역</h1>
			<c:set var="order" value="${requestScope.Ordered}" />
			<c:if test="${not empty Ordered}">
				<table>
					<thead>
						<tr>
							<th>주문 번호</th>
							<th>상품명</th>
							<th>가격</th>
							<th>주문 날짜</th>
							<th>환불/교환</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="order" items="${Ordered}">
							<tr>
								<!-- 주문 번호 -->
								<td id="order-number">${order.ordered_num}</td>

								<!-- 상품명 및 이미지 -->
								<td>
									<div class="product-info">
										<img src="${order.image_url}" alt="${order.product_name}"
											class="product-image" />
										<div class="product-details">
											<p>${order.product_name}</p>
											<p class="price">${order.price_amount}</p>
										</div>
									</div>
								</td>
								<!-- 가격 -->
								<td class="price" name="price" value="${order.price_amount}">${order.price_amount}</td>
								<!-- 주문 날짜 -->
								<td><span> 주문 날짜 <br /></span> ${order.ordered_date} <br />
								</td>
								<!-- 환불 및 교환 버튼 -->
								<td>
									<!-- 환불 날짜 또는 환불 상태에 값이 없을깨만 버튼 보여줌 (있으면 환불 된거임) --> 
									<c:choose>
										<%-- 환불 날짜 또는 환불 상태가 비어있을 경우 --%>
										<c:when
											test="${empty order.refunded_date || empty order.refund_status}">
											<a href="/refund.my"> <input type="button"
												class="refund-button" value="환불 및 교환하기"
												style="cursor: pointer;" />
											</a>
										</c:when>

										<%-- 환불 날짜와 환불 상태가 존재할 경우 --%>
										<c:otherwise>
									        ${order.refund_status } <br />
									        ${order.refunded_date } 
								    	</c:otherwise>
									</c:choose>

								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<!-- 환불할 제품이 없는 경우 -->
			<c:if test="${empty Ordered}">
				<p>환불할 제품이 없습니다.</p>
			</c:if>
		</div>

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

	<script type="text/javascript">
		// 가격 포맷팅
		function formatPrice() {
			let prices = document.querySelectorAll('.price');

			prices.forEach(function(price) {
				let priceValue = parseInt(price.innerText.replace(/₩|,/g, '')); // ₩와 콤마 제거 후 숫자로 변환

				if (!isNaN(priceValue)) {
					let priceStr = priceValue.toString();

					if (priceStr.length > 3) {
						// 마지막 세 자리 앞에 '.' 추가
						let formattedPrice = priceStr.slice(0,
								priceStr.length - 3).replace(
								/\B(?=(\d{3})+(?!\d))/g, ',')
								+ ',' + priceStr.slice(-3);
						price.innerText = '₩' + formattedPrice;
					}
				}
			});
		}

		// 페이지 로드 시 실행
		document.addEventListener("DOMContentLoaded", formatPrice);
	</script>

</body>

</html>
