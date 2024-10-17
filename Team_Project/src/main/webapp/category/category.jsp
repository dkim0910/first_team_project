<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="java.text.DecimalFormat"%>
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
    <link rel="stylesheet" href="/category/category.css">
    <!-- 폰트어썸 불러오기 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="/category/category.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="member" value="${sessionScope.member}" />
	<% boolean isLoggedIn = (session != null && session.getAttribute("member") != null); %>
    <div id="common">
        <div id="commonLayoutContainer">
            <!-- 상단 검색창 영역 -->
            <header id="commonLayoutHeader">
                <div class="top-search-bar">
                    <input type="text" id="search" placeholder="검색할 상품을 입력하세요" value="" />
                    <button type="button" id="search-button" onclick="search()">검색</button>
                </div>
                <!-- 메인페이지로 가기 -->
            	<div class="back-button">
            		<a href="/index.jsp" class="button-back-page" aria-label="이전 페이지로 이동">
					    <svg width="35" height="35" viewBox="0 0 28 28" fill="none">
					        <path d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
					            stroke="black" stroke-width="1.4"></path>
					    </svg>
					</a>
            	</div>
                <div class="top-menu">
		            <!-- 로그인 상태인 경우 -->
		            <a href="<%= isLoggedIn ? "/my-page/my-main/my-page-main.jsp" : "/login/join/login_view.jsp" %>" class="menu-button">
		                <img src="./img/마이.png">
		            </a>
		            <a href="<%= isLoggedIn ? "/cart.ca" : "/login/join/login_view.jsp" %>" class="menu-button">
		                <img src="./img/카트.png">
		            </a>
                    <a href="/index.jsp" class="menu-button">
						<img src="./img/홈.png"  >
					</a>
                </div>
            </header>
            
            <main id="commonLayoutContents">
                <!-- 좌측 카테고리 목록 -->
                <div class="left-goods-category">
                    <ul>
                        <li data-target="beauty-section">뷰티</li>
                        <li data-target="shoes-section">신발</li>
                        <li data-target="bags-section">가방</li>
                        <li data-target="topcloth-section">상의</li>
                        <li data-target="bottomscloth-section">바지</li>
                    </ul>
                </div>

                <!-- 우측 상품 카테고리 목록 -->
                <div class="right-goods-category">
                    <section class="goods-category" id="beauty-section">
                        <h2 class="goods-category-index" >뷰티</h2>
                        <div class="goods-category-real">
                            <a href="/cg.product?category=뷰티&subcategory=헤어케어" class="goods" name="헤어케어">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_104006_17164420040904_big.png" >
                                <span>헤어케어</span>
                            </a>
                            <a href="/cg.product?category=뷰티&subcategory=스킨케어" class="goods" name="스킨케어">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_104001_17164420025345_big.png"  >
                                <span>스킨케어</span>
                            </a>
                            <a href="/cg.product?category=뷰티&subcategory=선케어" class="goods" name="선케어">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_104002_17164420028786_big.png"  >
                                <span>선케어</span>
                            </a>
                            <a href="/cg.product?category=뷰티&subcategory=클렌징" class="goods" name="클렌징">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_104003_17164420031582_big.png"  >
								<span>클렌징</span>
							</a>
							<a href="/cg.product?category=뷰티&subcategory=메이크업" class="goods" name="메이크업">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_104004_17164420034611_big.png"  >
								<span>메이크업</span>
							</a>
							<a href="/cg.product?category=뷰티&subcategory=프레그런스" class="goods" name="프레그런스">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_104005_17164420037579_big.png"  >
								<span>프레그런스</span>
							</a>
                        </div>
                    </section>

                    <section class="goods-category" id="shoes-section">
                        <h2 class="goods-category-index" >신발</h2>
                        <div class="goods-category-real">
                            <a href="/cg.product?category=신발&subcategory=스니커즈" class="goods" name="스니커즈">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_103004_17164420017705_big.png"  >
                                <span>스니커즈</span>
                            </a>
                            <a href="/cg.product?category=신발&subcategory=스포츠화" class="goods" name="스포츠화">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_103005_17164420020288_big.png"  >
                                <span>스포츠화</span>
                            </a>
                            <a href="/cg.product?category=신발&subcategory=구두" class="goods" name="구두">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_103001_17164420008529_big.png"  >
								<span>구두</span>
							</a>
                            <a href="/cg.product?category=신발&subcategory=샌들/슬리퍼" class="goods" name="샌들/슬리퍼">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_103003_17164420014447_big.png"  >
								<span>샌들/슬리퍼</span>
							</a>
                            <a href="/cg.product?category=신발&subcategory=부츠/워커" class="goods" name="부츠/워커">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_103002_17164420011373_big.png"  >
								<span>부츠/워커</span>
							</a>
                            <a href="/cg.product?category=신발&subcategory=신발용품" class="goods" name="신발용품">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_103006_17164446463550_big.png"  >
								<span>신발용품</span>
							</a>
                        </div>
                    </section>

                    <section class="goods-category" id="bags-section">
                        <h2 class="goods-category-index" >가방</h2>
                        <div class="goods-category-real">
                            <a href="/cg.product?category=가방&subcategory=캐리어" class="goods" name="캐리어">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_004009_17164419860999_big.png"  >
                                <span>캐리어</span>
                            </a>
                            <a href="/cg.product?category=가방&subcategory=백팩" class="goods" name="백팩">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_004001_17164419839188_big.png"  >
                                <span>백팩</span>
                            </a>
                            <a href="/cg.product?category=가방&subcategory=지갑/머니클립" class="goods" name="지갑/머니클립">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_004016_17164419876335_big.png"  >
								<span>지갑/머니클립</span>
							</a>
                            <a href="/cg.product?category=가방&subcategory=숄더백" class="goods" name="숄더백">
								<img src="https://image.msscdn.net/images/category_img/women/ITEM_004003_17164419695044_big.png"  >
								<span>숄더백</span>
							</a>
                            <a href="/cg.product?category=가방&subcategory=토트백" class="goods" name="토트백">
								<img src="https://image.msscdn.net/images/category_img/women/ITEM_004015_17164419697688_big.png"  >
								<span>토트백</span>
							</a>
                            <a href="/cg.product?category=가방&subcategory=에코백" class="goods" name="에코백">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_004014_17164419870060_big.png" >
								<span>에코백</span>
							</a>
                        </div>
                    </section>

                    <section class="goods-category" id="topcloth-section">
                        <h2 class="goods-category-index" >상의</h2>
                        <div class="goods-category-real">
                            <a href="/cg.product?category=상의&subcategory=피케/카라 티셔츠" class="goods" name="피케/카라 티셔츠">
                                <img src="https://image.msscdn.net/images/category_img/women/ITEM_001003_17164419662809_big.png"  >
                                <span>피케/카라 티셔츠</span>
                            </a>
                            <a href="/cg.product?category=상의&subcategory=맨투맨/스웨트" class="goods" name="맨투맨/스웨트">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_001005_17164419731519_big.png"  >
                                <span>맨투맨/스웨트</span>
                            </a>
                            <a href="/cg.product?category=상의&subcategory=셔츠/블라우스" class="goods" name="셔츠/블라우스">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_001002_17164419723992_big.png"  >
								<span>셔츠/블라우스</span>
							</a>
                            <a href="/cg.product?category=상의&subcategory=후드 티셔츠" class="goods" name="후드 티셔츠">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_001004_17164419728866_big.png"  >
								<span>후드 티셔츠</span>
							</a>
                            <a href="/cg.product?category=상의&subcategory=민소매 티셔츠" class="goods" name="민소매 티셔츠">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_001011_17164419742970_big.png"  >
								<span>민소매 티셔츠</span>
							</a>
                            <a href="/cg.product?category=상의&subcategory=니트/스웨터" class="goods" name="니트/스웨터">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_001006_17164419735311_big.png" >
								<span>니트/스웨터</span>
							</a>
                        </div>
                    </section>

                    <section class="goods-category" id="bottomscloth-section">
                        <h2 class="goods-category-index" >바지</h2>
                        <div class="goods-category-real">
                            <a href="/cg.product?category=바지&subcategory=숏 팬츠" class="goods" name="숏 팬츠">
                                <img src="https://image.msscdn.net/images/category_img/women/ITEM_003009_17164419691815_big.png"  >
                                <span>숏 팬츠</span>
                            </a>
                            <a href="/cg.product?category=바지&subcategory=데님 팬츠" class="goods" name="데님 팬츠">
                                <img src="https://image.msscdn.net/images/category_img/men/ITEM_003002_17164419814765_big.png"  >
                                <span>데님 팬츠</span>
                            </a>
                            <a href="/cg.product?category=바지&subcategory=코튼 팬츠" class="goods" name="코튼팬 츠">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_003007_17164419825758_big.png"  >
								<span>코튼 팬츠</span>
							</a>
                            <a href="/cg.product?category=바지&subcategory=트레이닝/조거 팬츠" class="goods" name="트레이닝/조거 팬츠">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_003004_17164419817276_big.png"  >
								<span>트레이닝/조거 팬츠</span>
							</a>
                            <a href="/cg.product?category=바지&subcategory=슈트 팬츠/슬랙스" class="goods" name="슈트 팬츠/슬랙스">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_003008_17164419828375_big.png"  >
								<span>슈트 팬츠/슬랙스</span>
							</a>
                            <a href="/cg.product?category=바지&subcategory=기타 바지" class="goods" name="기타 바지">
								<img src="https://image.msscdn.net/images/category_img/men/ITEM_003006_17164419823071_big.png" >
								<span>기타 바지</span>
							</a>
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
