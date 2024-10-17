<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카테고리 페이지 | 쇼핑하조</title>
    <!-- 페이지 제목 옆의 아이콘 -->
    <link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
    <link rel="stylesheet" href="/category/categoryDetail/categoryDetail.css">
    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="/category/categoryDetail/categoryDetail.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="member" value="${sessionScope.member}" />
	<c:set var="category" value="${requestScope.categoryList }"/>
	<% boolean isLoggedIn = (session != null && session.getAttribute("member") != null); %>
    <div id="common">
        <div id="commonLayoutContainer">
            <!-- 상단 검색창 영역 -->
            <header id="commonLayoutHeader">
                <div class="top-search-bar">
                </div>
                <!-- 카테고리 페이지로 가기 -->
            	<div class="back-button">
            		<a href="/category/category.jsp" class="button-back-page" aria-label="이전 페이지로 이동">
					    <svg width="35" height="35" viewBox="0 0 28 28" fill="none">
					        <path d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
					            stroke="black" stroke-width="1.4"></path>
					    </svg>
					</a>
            	</div>
                <div class="top-menu">
                	<a href="<%= isLoggedIn ? "/my-page/my-main/my-page-main.jsp" : "/login/join/login_view.jsp" %>" class="menu-button">
					<!-- <a href="../../my-page/my-main/my-page-main.jsp" class="menu-button"> -->
						<img src="/category/img/마이.png"  >
					</a>
					<a href="<%= isLoggedIn ? "/cart.ca" : "/login/join/login_view.jsp" %>" class="menu-button">
                    <!-- <a href="/cart.ca" class="menu-button"> -->
						<img src="/category/img/카트.png"  >
                    </a>
                    <a href="/index.jsp" class="menu-button">
						<img src="/category/img/홈.png"  >
					</a>
                </div>
            </header>
            
            <main id="commonLayoutContents">
                <!-- 중앙 상품 카테고리 목록 -->
                <div class="main-goods-category">
                    <section class="goods-category" id="beauty-section">
                        <div class="goods-category-real">
                        	<c:forEach var="category" items="${category }">
	                            <a href="/scg.product?PRODUCT_ID=${category.PRODUCT_ID }" class="goods" >
	                                <img src="${category.IMAGE_URL }"  >
	                                <c:choose>
									    <c:when test="${fn:length(category.PRODUCT_NAME) > 15}">
									        <span>${fn:substring(category.PRODUCT_NAME, 0, 15)}...</span>
									    </c:when>
									    <c:otherwise>
									        <span>${category.PRODUCT_NAME}</span>
									    </c:otherwise>
									</c:choose>

	                                <div class="product-description">
	                                    <img src="${category.IMAGE_URL }" alt="상품 이미지">
	                                    <p id="product-description-name">${category.PRODUCT_NAME }</p>
	                                    <span id="product-description-price" data-price="${category.PRICE_AMOUNT}"></span><span>원</span>
	                                    
	                                </div>
	                            </a>
                            </c:forEach>
                        </div>
                    </section>

                </div>
            </main>

            <footer id="commonLayoutFooter">
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
        </div>
    </div>
</body>
</html>
