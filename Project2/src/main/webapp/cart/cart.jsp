<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="java.text.DecimalFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>장바구니 | 쇼핑하조</title>
     <!-- 페이지 제목 옆의 아이콘 -->
    <link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
    <link rel="stylesheet" href="/cart/cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="/cart/cart.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body onload="calculateTotalPrice()" style="cursor: default;">
	<c:set var="member" value="${sessionScope.member}" />
	<c:set var="cartList" value="${requestScope.cartList}" />
	<header class="header">
		<a href="../../my-page/my-main/my-page-main.jsp" class="button-back-page" aria-label="이전 페이지로 이동">
		    <svg width="35" height="35" viewBox="0 0 28 28" fill="none">
		        <path d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
		            stroke="currentColor" stroke-width="1.4"></path>
		    </svg>
		</a>
		<h1 class="Title">장바구니</h1>
	</header>
	
	<div class="main" >
		<div class="main-top">
			<div>
	            <input type="checkbox" id="select-all" onClick="toggleSelectAll(this)">
	            <label for="select-all">전체선택</label>
	            <button class="delete-selected" onclick="deleteSelectedItems()">선택삭제</button>
	        </div>
			<button class="keepshoping" onclick="window.location.href='../category/category.jsp'">쇼핑 계속하기</button>
		</div>
		<table class = "table table-hover">
			<tr>	
				<th>선택</th>
				<th>상품번호</th>
				<th>이름</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<c:choose>
			    <c:when test="${empty cartList}">
			    	<tr>
			        	<td colspan="7">장바구니에 상품이 존재하지 않습니다.</td>
			        </tr>
			    </c:when>
			    <c:otherwise>
					<c:forEach var="goods" items="${cartList }">
						<tr class="cart-item">
							<td><input type="checkbox" class="item-checkbox" value="${goods.PRODUCT_ID}"></td>
							<td>${goods.PRODUCT_ID }</td>
							<c:choose>
							    <c:when test="${fn:length(goods.PRODUCT_NAME) > 30}">
							        <td>${fn:substring(goods.PRODUCT_NAME, 0, 30)}...</td>
							    </c:when>
							    <c:otherwise>
							        <td>${goods.PRODUCT_NAME}</td>
							    </c:otherwise>
							</c:choose>
							<%-- <td>${goods.PRODUCT_NAME }</td> --%>
							<td id="item-price" class="item-price">${goods.NORMAL_PRICE}원</td> 
					        <td class="item-quantity">1</td> 
					        <td id="item-subtotal" class="item-subtotal">0원</td>
							<td>비고</td>
						</tr>
					</c:forEach>
			    </c:otherwise>
			</c:choose>
			<tr>
				<th colspan="5">총액</th>
    			<th colspan="2" id="cart_final_price">0원</th>
			</tr>
		</table>
	</div>

	<!-- 장바구니 항목 전체 선택 및 삭제 -->
	<div class="cart">
	    <div class="cart-header">
	        <!-- 구매하기 버튼 -->
			<button class="purchase-button" onclick="purchaseItems()">구매하기</button>
	    </div>
	</div>
	
	<!-- 옵션 변경 모달 -->
	<!-- <div id="optionModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal('optionModal')">&times;</span>
	        <h2>옵션 변경</h2>
	        <form action="updateOption.jsp" method="post">
	            <input type="hidden" id="optionItemId" name="itemId">
	            <label for="newOption">새 옵션:</label>
	            <input type="text" id="newOption" name="newOption">
	            <button type="submit">변경</button>
	        </form>
	    </div>
	</div> -->
	
	<footer class="footer">
	    <p>고객 지원 센터: 1234-5678 | 이메일: shoppinghajo@samjo.com</p>
	    <p>운영 시간: 월-금, 09:00-18:00 (주말 및 공휴일 휴무)</p>
	    <div>
	        © 쇼핑하조 ALL RIGHTS RESERVED
	    </div>
	    <div>
	        <span>일부 상품의 경우 쇼핑하조는 통신판매의 당사자가 아닌 통신판매중개자로서 상품, 상품정보, 거래에 대한
	            <br>
	            책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
	        </span>
	    </div>
    </footer>
</body>
</html>