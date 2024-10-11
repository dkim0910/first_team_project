<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.login.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
</head>

<!-- 제이쿼리 불러오기  -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- 스와이퍼 불러오기-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- css 연결 -->
<link rel="stylesheet" href="/main-page/style/style.css">

<!-- 공통 js 연결 -->
<script defer src="/main-page/script/script.js"></script>

<!-- jquery 불러오기 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%
boolean isLoggedIn = (session != null && session.getAttribute("member") != null);
%>
<body>
	<header>
		<div class="con mx-auto">
			<div class="pc-top-bar flex">
				<div class="flex-1 flex h-full">
					<div id="logo-box" class="self-center">
						<a href="#" id="logo" class="flex"> <span>쇼핑하조</span>
						</a>
					</div>
				</div>
				<div class="flex-1"></div>
				<div class="flex-1 h-full">
					<div id="icon-box">
						<div id="icon">
							<!-- <a href="main-page./login/join/login_view.jsp" id="login">
                <i class="fa-regular fa-user"></i>
              </a> -->
							<div class="user">
								<c:set var="member" value="${sessionScope.member}" />
								<c:if test="${not empty member}">
									<p>${member.user_name}님 환영합니다!</p>
								</c:if>
							</div>
							<a
								href="<%=isLoggedIn ? "/my-page/my-main/my-page-main.jsp" : "/login/join/login_view.jsp"%>"
								id="login"> <i class="fa-regular fa-user"></i> <%-- <%= isLoggedIn ? "마이페이지" : "로그인" %> --%>
							</a> <a href="/category/category.jsp" id="more"> <i
								class="fa-solid fa-bars"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<nav id="menu-box1" class="pc-top-bar">
				<ul id="menu1" class="flex h-full justify-center">
					<li><a class="flex h-full items-center px-10 active" href="#"
						data-tab="tab1">추천</a></li>
					<li><a class="flex h-full items-center px-10" href="#"
						data-tab="tab2">브랜드</a></li>
					<li><a class="flex h-full items-center px-10" href="#"
						data-tab="tab3">발매</a></li>
					<li><a class="flex h-full items-center px-10" href="#"
						data-tab="tab5">세일</a></li>
				</ul>
			</nav>

			<div id="tab-content">
				<div class="tab-content" id="tab1">
					<section class="section-slider">
						<div class="con mx-auto">
							<div class="slider-box-1" data-index="0">
								<div class="slides">
									<div class="slide-item">
										<img src="/main-page/images/slide1.jpg" alt="슬라이드이미지1">
									</div>
									<div class="slide-item">
										<img src="/main-page/images/slide2.jpg" alt="슬라이드이미지2">
									</div>
									<div class="slide-item">
										<img src="/main-page/images/slide3.jpg" alt="슬라이드이미지3">
									</div>
									<div class="slide-item">
										<img src="/main-page/images/slide4.png" alt="슬라이드이미지4">
									</div>
									<div class="slide-item">
										<img src="/main-page/images/slide5.jpg" alt="슬라이드이미지5">
									</div>
								</div>
							</div>
						</div>
					</section>

					<section class="section-prod-list con-min-width">
						<div class="con mx-auto">
							<nav class="prod-menu">
								<div class="title">
									<span> 인기 카테고리 트렌드 <br> 인기 카테고리 추천
									</span> <a href="/category/category.jsp"> 더보기 </a>
								</div>
								<ul class="flex-grid">
									<c:forEach var="product" items="${requestScope.getAllProducts}"
										varStatus="status">
										<c:if test="${status.index >= 7 && status.index < 13}">
											<li><a
												href="/scg.product?PRODUCT_ID=${product.product_id }"
												class="block"> <img class="w-full block"
													src="${product.image_url }" alt="">
											</a> <a href="#" class="block text-center">${product.product_name }</a>
												<div>
													<span>${product.price_amount }</span>
												</div>
										</c:if>
									</c:forEach>
								</ul>
							</nav>
						</div>
					</section>

					<section
						class="section-prod-list section-prod-list-2 con-min-width">
						<div class="con mx-auto">
							<nav class="prod-menu">
								<div class="title">
									<span> 고객이 찾는 캐주얼 스타일 <br> 조거팬츠
									</span> <a href="/category/category.jsp"> 더보기 </a>
								</div>
								<ul class="flex-grid">
									<c:forEach var="product" items="${requestScope.getAllProducts}"
										varStatus="status">
										<c:if test="${status.index >= 494 && status.index <= 499}">
											<li><a
												href="/scg.product?PRODUCT_ID=${product.product_id }"
												class="block"> <img class="w-full block"
													src="${product.image_url }" alt="">
											</a> <a href="#" class="block text-center">${product.product_name }</a>
												<div>
													<span>${product.price_amount }</span>
												</div>
										</c:if>
									</c:forEach>
								</ul>
							</nav>
						</div>
					</section>
				</div>

				<div class="tab-content hidden" id="tab2">
					<section class="section-img">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="/category/category.jsp"> <img src="" alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">쿠콥</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-1">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-1 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con1 section-img-swiper">
							<ul class="swiper-wrapper">
								<c:forEach var="product" items="${requestScope.getAllProducts}"
									varStatus="status">
									<c:if test="${status.index >= 364 && status.index <= 371}">
										<li class="swiper-slide"><a
											href="/scg.product?PRODUCT_ID=${product.product_id }">
												<div class="img-box">
													<img src="${product.image_url }" alt="">
												</div>
												<div class="content">
													<p class="category">${product.product_name }</p>
												</div>
										</a>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>

					<section class="section-img section-img-2">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="/category/category.jsp"> <img src="" alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">알에스에스씨</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-2">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-2 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con2 section-img-2-swiper">
							<ul class="swiper-wrapper">
								<c:forEach var="product" items="${requestScope.getAllProducts}"
									varStatus="status">
									<c:if test="${status.index >= 450 && status.index <= 457}">
										<li class="swiper-slide"><a
											href="/scg.product?PRODUCT_ID=${product.product_id }">
												<div class="img-box">
													<img src="${product.image_url }" alt="">
												</div>
												<div class="content">
													<p class="category">${product.product_name }</p>
												</div>
										</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>

					<section class="section-img section-img-3">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="/category/category.jsp"> <img
									src="" alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">디프</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-3">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-3 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con3 section-img-3-swiper">
							<ul class="swiper-wrapper">
							<c:forEach var="product" items="${requestScope.getAllProducts}"
									varStatus="status">
									<c:if test="${status.index >= 510 && status.index <= 517}">
								<li class="swiper-slide"><a href="/scg.product?PRODUCT_ID=${product.product_id }">
										<div class="img-box">
											<img src="${product.image_url }" alt="">
										</div>
										<div class="content">
											<p class="category">${product.product_name }</p>
										</div>
								</a></li>
								</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>
				</div>
				
				<div class="tab-content hidden" id="tab3">
					<section class="section-img section-img-4">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="#"> <img src="/main-page/images/comming/4-1.png"
									alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">제로 24 F/W 3차 신상 발매</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-4">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-4 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con4 section-img-4-swiper">
							<ul class="swiper-wrapper">
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-2.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Vintage Washed Sweat Ma-1 [3 Colors]</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-3.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Tender Ombre Check Hood Shirts [2
												Colors]</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-4.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Denim Hood Shirts [2 Colors]</p>
											<p class="price">31,890원</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-5.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Flannel Check Hood Shirts [2 Colors]</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-6.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Vintage Washed Long Sleeve String
												T-Shirts [4 Colors]</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-7.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Column Line Texture Wide Pants [2
												Colors]</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/4-8.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Cargo Over String Sweat Pants [4
												Colors]</p>
										</div>
								</a></li>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>

					<section class="section-img section-img-5">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="#"> <img src="/main-page/images/comming/5-1.png"
									alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">일리오 24 F/W 신상 한정 발매</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-5">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-5 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con5 section-img-5-swiper">
							<ul class="swiper-wrapper">
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-2.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Black check stud shirts</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-3.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Faux suede stud shirts</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-4.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Black leopard cross necklace top</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-5.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">White leopard cross necklace top</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-6.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Black lover one shoulder long sleeve</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-7.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Gray lover one shoulder long sleeve</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-8.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Light gray lover one shoulder long
												sleeve</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/5-9.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">Black stud sweat set</p>
										</div>
								</a></li>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>

					<section class="section-img section-img-6">
						<div class="con mx-auto">
							<div class="logo-box">
								<a href="#"> <img src="/main-page/images/comming/6-1.png"
									alt="">
								</a>
							</div>
							<h2 class="tit text-[40px] font-bold">커리쉴 신상 발매</h2>
							<div class="swiper-btn-box">
								<div class="swiper-btn swiper-btn__prev swiper-btn__prev-6">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
								<div
									class="swiper-btn swiper-btn__next swiper-btn__next-6 active">
									<span> <img src="/main-page/images/brand/sl_arrow.svg"
										alt="">
									</span>
								</div>
							</div>
						</div>
						<div class="swiper swiper-con swiper-con6 section-img-6-swiper">
							<ul class="swiper-wrapper">
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-2.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">에프터 살롱 케어 리페어 헤어 앰플 100ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-3.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">에프터 살롱 케어 샴푸 (극손상) 500g</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-4.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">에프터 살롱 케어 헤어팩 트리트먼트 250ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-5.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">퍼펙션 컬 크림 150ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-6.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">젤 오일 왁스 150ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-7.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">제로 그래비티 왁스 100ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-8.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">스타일 그래비티 왁스 100ml</p>
										</div>
								</a></li>
								<li class="swiper-slide"><a href="#">
										<div class="img-box">
											<img src="/main-page/images/comming/6-9.jpg" alt="">
										</div>
										<div class="content">
											<p class="category">새틴 앤 에어리 스프레이 300ml</p>
										</div>
								</a></li>
							</ul>
						</div>
						<div class="section-img__bg"></div>
					</section>
				</div>
				<div class="tab-content hidden" id="tab5">
					<section class="time-sale">
						<div class="con mx-auto">
							<div class="timer">
								<span>오늘의 세일</span>
							</div>
							<nav class="list">
								<ul class="flex-grid">
									<li><a href="#"> <img
											src="/main-page/images/sale/s1.jpg" alt="">
									</a> <a href="#">후브스</a>
										<div class="price">
											<span class="sale">35%</span> <span>48,990원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s2.jpg" alt="">
									</a> <a href="#">테이크이지</a>
										<div class="price">
											<span class="sale">40%</span> <span>50,400원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s3.jpg" alt="">
									</a> <a href="#">슬로우 레코드 하우스</a>
										<div class="price">
											<span class="sale">45%</span> <span>34,100원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s4.jpg" alt="">
									</a> <a href="#">엘리메노</a>
										<div class="price">
											<span class="sale">44%</span> <span>32,800원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s5.jpg" alt="">
									</a> <a href="#">스파오</a>
										<div class="price">
											<span class="sale">50%</span> <span>29,990원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s6.jpg" alt="">
									</a> <a href="#">레더리</a>
										<div class="price">
											<span class="sale">20%</span> <span>52,000원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s7.jpg" alt="">
									</a> <a href="#">트릴리온</a>
										<div class="price">
											<span class="sale">40%</span> <span>29,800원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s8.jpg" alt="">
									</a> <a href="#">런트</a>
										<div class="price">
											<span class="sale">48%</span> <span>35,990원</span>
										</div></li>
									<li><a href="#"> <img
											src="/main-page/images/sale/s9.jpg" alt="">
									</a> <a href="#">아웃스탠딩</a>
										<div class="price">
											<span class="sale">40%</span> <span>191,400원</span>
										</div></li>
								</ul>
							</nav>
						</div>
					</section>
				</div>
			</div>
		</div>
	</header>

	<footer>
		<div class="con mx-auto">
			<nav class="bottom-menu">
				<ul class="space-y-2">
					<li class="flex justify-between items-center"><a href="#"
						class="toggle-menu">사업자 정보</a> <i
						class="fa-solid fa-chevron-down cursor-pointer toggle-icon"></i></li>
					<ul class="submenu hidden pl-4">
						<p>
							(주) 쇼핑하조 | 대표자 : 3조 | 주소 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 | 개인정보보호책임자 :
							3조 | 호스팅사업자 : 쇼핑하조 <br> 당사는 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증
							계약을 체결하여 안전거래를 보장하고 있습니다. 서비스 가입사실 확인
						</p>
					</ul>
					<li class="flex justify-between items-center"><a href="#"
						class="toggle-menu">법적 고지사항</a> <i
						class="fa-solid fa-chevron-down cursor-pointer toggle-icon"></i></li>
					<ul class="submenu hidden pl-4">
						<li><a href="#">회사소개</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">영상정보처리기기 운영/관리방침</a></li>
					</ul>
					<li class="flex justify-between items-center"><a href="#"
						class="toggle-menu">파트너 지원</a> <i
						class="fa-solid fa-chevron-down cursor-pointer toggle-icon"></i></li>
					<ul class="submenu hidden pl-4">
						<li><a href="#">입점 및 제휴문의</a></li>
						<li><a href="#">브랜드 구인</a></li>
					</ul>
					<li class="flex justify-between items-center"><a href="#"
						class="toggle-menu">고객지원</a> <i
						class="fa-solid fa-chevron-down cursor-pointer toggle-icon"></i></li>
					<ul class="submenu hidden pl-4">
						<li><a href="#">1:1 문의하기</a></li>
						<li><a href="#">FAQ 자주 묻는 질문</a></li>
						<li><a href="#">안전 거래 센터</a></li>
						<span> 고객센터 1234-56789 <br> 운영시간 : 평일 09:00 - 18:00 <br>
							(점심시간 12:00 - 13:00 제외)
						</span>
					</ul>
				</ul>
			</nav>
			<div class="copyright">
				<div>© 쇼핑하조 ALL RIGHTS RESERVED</div>
				<div>
					<a href="#">개인정보처리방침 · </a> <a href="#">이용약관</a>
				</div>
				<div>
					<span>일부 상품의 경우 쇼핑하조는 통신판매의 당사자가 아닌 통신판매중개자로서 상품, 상품정보, 거래에
						대한 <br> 책임이 제한될 수 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.
					</span>
				</div>
			</div>
			<div class="btn-icon">
				<a href=""><i class="fa-brands fa-instagram"></i></a> <a href=""><i
					class="fa-brands fa-youtube"></i></a> <a href=""><i
					class="fa-brands fa-tiktok"></i></a>
			</div>
		</div>
	</footer>
</body>

</html>