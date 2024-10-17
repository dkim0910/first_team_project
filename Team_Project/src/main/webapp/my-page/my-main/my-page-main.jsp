<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이 페이지 | 쇼핑하조</title>
<!-- 페이지 제목 옆의 아이콘 -->
<link href="https://i.ibb.co/X4b9F9N/logo.png" rel="icon">
<link rel="stylesheet" href="/my-page/my-main/main.css">
</head>

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- 테일윈드 css 불러오기 -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- 주소 변경 -->
<script defer
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body style="cursor: default;">
	<c:set var="showMyInfo" value="${requestScope.showMyInfo}" />
	<div class="header-container">
		<header class="header">
			<a href="/index.jsp" class="" aria-label="이전 페이지로 이동 (로그인 후의 메인 페이지)">
				<svg width="35" height="35" viewBox="0 0 28 28" fill="none">
                    <path
						d="M16.1004 21.7L8.61252 14.2122C8.49537 14.095 8.49537 13.9051 8.61252 13.7879L16.1004 6.30005"
						stroke="currentColor" stroke-width="1.4"></path>
                </svg>
			</a>
			<h1 onclick="toggleBold(this); showContent('maincontents')"
				style="color: #ffffff; cursor: default;">마이 페이지</h1>

			<a href="/cart.ca"> <label
				style="font-size: 24px; cursor: pointer;"> <input
					type="button" value="장바구니" style="cursor: pointer;" /> <!-- 장바구니 이미지 -->
					<i class="fa-solid fa-cart-shopping"></i>
			</label>
			</a>

		</header>

		<div class="con mx-auto"
			style="min-height: 100vh; display: flex; flex-direction: column;">

			<div class="container" style="flex: 1">
				<nav class="sidebar">
					<div class="sidebar-title" id=""
						onclick="toggleBold(this); showContent('maincontents')">
						<p>마이페이지</p>
					</div>
					<ul>
						<!-- 나의 정보창 -->
						<!-- 이거만 refund 컨트롤러 안가고 마이페이지 컨트롤러감 ...? -->
						<!-- <li><a href="/MemberList.my" -->
						<li><a href="/my-main/MemberList.up"
							onclick="toggleBold(this); showContent('my-info')"
							class="sidebar-options">나의 정보</a></li>
						<!-- 여기에 주문 취소랑 주소 변경 등 넣기-->
						<li><a href="/ordered.my"
							onclick="toggleBold(this); showContent('orders')"
							class="sidebar-options">주문 내역</a></li>
						<!-- 여기에 멤버십 포인트나 할인 이벤트 등 넣기 -->
						<li><a href="#"
							onclick="toggleBold(this); showContent('membership')"
							class="sidebar-options">멤버십</a></li>
						<!-- 고객센터 페이지-->
						<li><a href="#"
							onclick="toggleBold(this); showContent('helpcenter')"
							class="sidebar-options">고객센터</a></li>
						<!-- 환불 및 교환 페이지 -->
						<li><a href="/refund.my"
							onclick="toggleBold(this); showContent('refunds')"
							class="sidebar-options">환불 및 교환</a></li>
						<!-- 이벤트 -->
						<li><a href="#"
							onclick="toggleBold(this); showContent('events')"
							class="sidebar-options">이벤트</a></li>
						<!-- 공지사항 페이지 -->
						<li><a href="#"
							onclick="toggleBold(this); showContent('announcement')"
							class="sidebar-options">공지사항</a></li>
						<!-- 회원 탈퇴 페이지 -->
						<li><a href="#"
							onclick="toggleBold(this); showContent('byebye')"
							class="sidebar-options">회원 탈퇴</a></li>

						<li><a href="#" onclick="toggleBold(this); showContent('')"
							class="sidebar-options"></a></li>
						<!-- ('') 안쪽에 더 추가해서 화면 더 만들기 -->

					</ul>
					<%-- 로그 아웃 버튼 --%>
					<button style="font-weight: bold; color: red;" onclick="logout()">로그
						아웃</button>

				</nav>



				<main class="main-hello">
					<div class="hello">
						<p class="left" style="font-weight: bold; cursor: pointer;"
							onclick="showContent('my-info')">

							<!-- 세션에 저장되어 있는 user 값 가지고 옴 (UserLoginAction에 있음)-->
							<%
							boolean isLoggedIn = (session != null && session.getAttribute("member") != null);
							%>

							<c:set var="member" value="${sessionScope.member}" />
							<!-- 세션에 user_name 이 있는 경우 -->
							<c:if test="${not empty member}">
								<span>${member.user_name}님 어서오세요</span>
							</c:if>
							<!-- 만약 세션에 user_name 이 없는 경우 -->
							<c:if test="${empty member}">
								<span>비회원님 로그인 해주세요</span>
							</c:if>

						</p>
						<div class="right-container">
							<p id="member-status" class="right" style="cursor: pointer;"
								onclick="showContent('membership')">
								회원 등급: <span style="color: gray">VIP</span> 등급
							</p>
							<p id="user-member-point" class="right" style="cursor: pointer;"
								onclick="showContent('membership')">
								보유 포인트: <span style="color: gray">750</span> p
							</p>
						</div>
					</div>

					<!-- 위에 박스랑 아래 내용이랑 조금 공백 넣으려고 넣음 -->
					<br />
					<hr class="line" />
					<br />

					<!-- 메인페이지 내용 페이지-->
					<!--  -->
					<div id="maincontents" class="content-section"
						style="display: <c:out value="${empty showMyInfo ? 'block' : 'none'}" />;">

						<div class="main-container">
							<div class="tracking">
								<h2 class="bold">주문현황</h2>
								<hr class="line" />

								<!-- 배송 추적 시스템 -->
								<div class="tracking-container">
									<header class="tracking-header">
										<h1 class="bold">배송 추적하기</h1>
										<hr />
									</header>

									<div class="tracking-box" style="border-radius: 5px;">
										<h2 class="bold">주문 번호를 입력하세요:</h2>
										<form id="tracking-form">
											<input type="text" id="order-number" placeholder="예: 123"
												required />
											<button type="button" class="all-button" id="track-button">추적하기</button>
										</form>
										<span id="warning-message" style="display: block;"></span>
										<!-- 경고 메시지 표시를 위한 요소 -->

										<div id="tracking-info" class="tracking-info"
											style="display: block;">
											<hr class="line" />
											<h3>배송 정보</h3>
											<p>
												<strong>주문 번호:</strong> <span id="display-order-number"></span>
											</p>
											<div class="progress-container">
												<div class="progress-bar"></div>
											</div>
											<div class="progress-labels">
												<span>주문 접수</span> <span>배송 준비중</span> <span>배송 중</span> <span>배송
													완료</span>
											</div>
											<p>
												<strong>현재 위치:</strong> <span id="current-location">
													쇼핑하조 물류센터 </span>
											</p>
											<p>
												<strong>예상 도착일:</strong> <span id="expected-delivery-date">
													준비중 </span>
											</p>
										</div>
									</div>



									<br />

								</div>

								<!-- <div class="main-box">
                                <a href="#" onclick="showContent('helpcenter')">
                                    <h2 class="bold">고객센터</h2>
                                </a>
                                <hr class="line" />
                                <p>1 : 1 문의 내용</p>

                                -- 여기 내용 더 추가하기 --

                            </div> -->

								<!-- 후기 페이지랑 연결? -->
								<!-- 시간이 없다 -->
								<div class="main-box">
									<h2 class="bold">나의 후기</h2>
									<hr class="line" />
									<div>
										<strong>${member.user_name}</strong>
										<div class="rating">
											<span class="star">★</span> <span class="star">★</span> <span
												class="star">★</span> <span class="star">★</span> <span
												class="star">★</span>
										</div>
										<p class="review-text">최근에 운동복을 구매했는데, 가격 대비 품질이 정말 뛰어나요!
											운동할 때 착용하기 좋은 스타일이었고, 고객 서비스도 친절해서 만족스러웠습니다.</p>
									</div>
									<br />
									<div>
										<strong>${member.user_name}</strong>
										<div class="rating">
											<span class="star">★</span> <span class="star">★</span> <span
												class="star">★</span> <span class="star">★</span> <span
												class="star">★</span>
										</div>
										<p class="review-text">제가 좋아하는 브랜드의 운동복을 할인된 가격에 구매할 수 있어서
											기뻤어요! 품질이 뛰어나고, 소재가 부드러워서 착용감이 아주 좋습니다. 앞으로 자주 이용할 것 같습니다</p>
									</div>
									<br /> <strong>${member.user_name}</strong>
									<div class="rating">
										<span class="star">★</span> <span class="star">★</span> <span
											class="star">★</span> <span class="star">★</span> <span
											class="star">★</span>
									</div>
									<p class="review-text">저는 요가를 자주 하는데, 이곳에서 산 레깅스는 정말 대단해요!
										착용감이 뛰어나고 디자인도 예뻐서 운동할 때마다 기분이 좋아지네요. 특히 허리 부분이 너무 편해서 장시간 입고
										있어도 불편함이 없어요. 친구들에게도 추천하고 싶어요!</p>
								</div>



							</div>

						</div>
					</div>
					<!-- 나의 정보 내용 페이지 -->
					<!--  -->
					<div id="my-info" class="content-section"
						style="display: <c:out value="${not empty showMyInfo ? 'block' : 'none'}" />;">
						<div class="profile-container">
							<h2 class="bold" id="myInformation">나의 정보</h2>
							<p></p>
							<div class="profile-info">
								<!-- 나의 정보 -->
								<div class="profile-info">
									<label for="user-name">이름 : ${member.user_name }</label>
								</div>
								<div class="profile-info">
									<label for="user-id">아이디 : ${member.user_id }</label>
								</div>
								<div class="profile-info">
									<!-- 나중에 ${member.user_pw } 부분을 *로 수정하기 -->
									<label for="user-pw"></label>비밀번호 : <span id="user-pw">비밀번호는
										보안을 위해 표시되지 않습니다</span>
								</div>
								<div class="profile-info">
									<label for="phone">전화번호 : ${member.user_phone }</label>
								</div>
								<div class="profile-info">
									<label for="address">주소 : ${member.user_address }</label>
								</div>
								<div class="profile-info">
									<label for="user-gender">성별 : ${member.user_gender }</label>

								</div>

								<!-- edit-my-info 와서 보여주는거 -->
								<div style="width: 100%;">
									<a href="#" onclick="showContent('edit-my-info')"> <input
										type="button" id="" class="all-button" value="정보 수정하기"
										style="width: 100%;" />
									</a>
								</div>

							</div>

						</div>

					</div>



					<!-- 나의 멤버십 페이지 -->

					<!-- 현재 포인트 섹션 -->
					<!-- 지금은 그냥 숫자 넣는데 나중에 바꾸기? -->
					<div id="membership" class="content-section" style="display: none;">
						<section class="bold" style="text-align: center;">
							<h2>
								현재 보유 포인트: <span id="current-points">750</span> P
							</h2>
							<div class="membership-bar-container">
								<div class="membership-bar" id="membership-bar"></div>
							</div>
							<p id="points-left-text">다음 등급까지 250 포인트가 남았습니다!</p>
						</section>

						<!-- 멤버십 단계 -->
						<section class="membership-levels">
							<div class="membership-level">
								<h3>Basic</h3>
								<p>0 - 199,999 포인트</p>
								<ul>
									<li>신규 가입 시 5% 할인 쿠폰</li>
									<li>포인트 적립: 구매 금액의 1%</li>
									<li>무료 배송 (일정 금액 이상 구매시)</li>
								</ul>
							</div>

							<div class="membership-level">
								<h3>Premium</h3>
								<p>200,000 - 499,999 포인트</p>
								<ul>
									<li>10% 할인 쿠폰</li>
									<li>포인트 적립: 구매 금액의 5%</li>
									<li>무료 배송</li>
									<li>생일 축하 쿠폰</li>
								</ul>
							</div>

							<div class="membership-level">
								<h3>VIP</h3>
								<p>500,000 포인트 이상</p>
								<ul>
									<li>20% 할인 쿠폰</li>
									<li>포인트 적립: 구매 금액의 10%</li>
									<li>전 제품 무료 배송</li>
									<li>생일 축하 쿠폰</li>
									<li>한정판 상품 사전 예약 기회</li>
								</ul>
							</div>
						</section>

					</div>


					<!-- 고객센터 상담 페이지 -->
					<div id="helpcenter" class="content-section" style="display: none;">
						<div class="profile-container">
							<h2 class="bold">고객 지원 센터 센터</h2>
							<div>
								고객 지원 센터: 1234-5678 | 이메일: shoppinghajo@samjo.com<br /> 운영 시간:
								월-금, 09:00-18:00 (주말 및 공휴일 휴무)<br />
							</div>
							<br /> <a href="https://chatgpt.com/" target="_blank">
								<p class="all-button">AI 챗 봇이랑 대화하기</p>
							</a>

							<!-- <hr class="line" />
                    1 : 1 상담 버튼 추가 -> 상담하고 그 내역 전송
                    (전송된거 받는 페이지 or DB) 안보임
                    상담 내역 추가 - 장바구니 나 주문내역 에서 for 문 돌린거 처럼 추가 하면 될듯 (아직은 for문 없음)

                    박스 2개 있음 좌우로 한개는 상담 하기 내용 한개는 상담 한 후의 내용 / 내역 -->

						</div>
					</div>

					<!-- 이벤트 페이지 -->
					<div id="events" class="content-section" style="display: none;">
						<div>

							<!-- 스크롤 가능한 이벤트 카드 섹션 -->
							<div class="events-section-wrapper">
								<section class="events-section">

									<!-- 이벤트 카드 1 -->
									<div class="event-card">
										<img
											src="https://img.pikbest.com/backgrounds/20190730/warm-color-autumn-discount-coupon-1_5723639.jpg!sw800"
											alt="이벤트 1 이미지">
										<div class="event-card-content">
											<h3>가을 시즌 할인</h3>
											<p>가을을 맞이 아웃터 할인중! 지금 바로 쇼핑하세요.</p>
											<a href="/selectouter.my" class="all-button">가을 할인 제품</a>
										</div>
									</div>

									<!-- 이벤트 카드 2 -->
									<div class="event-card">
										<img
											src="/my-page/events/images/DALL·E-2024-10-08-13.59_1.jpg"
											alt="이벤트 2 이미지">
										<div class="event-card-content">
											<h3>3만원의 행복 이벤트</h3>
											<p>3만원으로 구매할 수 있는 상품 판매중! 지금 바로 쇼핑하세요.</p>
											<a href="/selectUnderthree.my" class="all-button">3만원의 행복</a>
										</div>
									</div>

									<!-- 이벤트 카드 3 -->
									<div class="event-card">
										<img
											src="https://marketplace.canva.com/EAGEK6RPm58/1/0/1600w/canva-%EB%B3%B4%EB%9D%BC%EC%83%89-%EB%B0%94%ED%83%95-%EB%8F%84%ED%98%95-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EC%8B%A0%EA%B7%9C-%EA%B0%80%EC%9E%85-%EC%BF%A0%ED%8F%B0-%EC%9D%B4%EB%B2%A4%ED%8A%B8-instagram-%EA%B2%8C%EC%8B%9C%EB%AC%BC-y9QtJNhIw38.jpg"
											alt="이벤트 3 이미지">
										<div class="event-card-content">
											<h3>신규 회원 웰컴 쿠폰</h3>
											<p>신규 회원 가입 시 할인 쿠폰을 드립니다!</p>
											<a href="#" class="all-button">이벤트 참여하기</a>
										</div>
									</div>

									<!-- 이벤트 카드 4 -->
									<div class="event-card">
										<img
											src="https://img.freepik.com/free-vector/gradient-vip-invitation-card-template_23-2150996118.jpg"
											alt="이벤트 4 이미지">
										<div class="event-card-content">
											<h3>VIP 전용 프로모션</h3>
											<p>VIP 고객님들만을 위한 특별한 혜택을 누려보세요.</p>
											<a href="#" class="all-button">이벤트 참여하기</a>
										</div>
									</div>

								</section>
							</div>

						</div>
					</div>


					<!-- 공지사항 페이지 -->
					<div id="announcement" class="content-section" style="display: none;">
					    <div class="profile-container">
					        <!-- 공지 누르면 바로 공지 페이지로 이동 가능하게끔 만들기 -->
					        <div class="events-section-wrapper">
					            <section class="events-section">
					
					                <!-- 공지1: 신규 상품 출시 -->
					                <div class="event-card">
					                    <div class="event-card-content">
					                        <h3>공지 1: 2024 가을/겨울 신상품 출시!</h3>
					                        <p>쇼핑하조와 함께하는 2024 가을/겨울 신상품이 출시되었습니다! 한정 기간 동안 특별 할인도 제공되니 놓치지 마세요.</p>
					                    </div>
					                </div>
					
					                <!-- 공지 2: 배송 안내 -->
					                <div class="event-card">
					                    <div class="event-card-content">
					                        <h3>공지 2: 배송 지연 안내</h3>
					                        <p>현재 주문량 증가로 인해 배송이 2~3일 지연되고 있습니다. 고객님의 너그러운 양해 부탁드립니다.</p>
					                    </div>
					                </div>
					
					                <!-- 공지 3: 멤버십 혜택 변경 -->
					                <div class="event-card">
					                    <div class="event-card-content">
					                        <h3>공지 3: 멤버십 혜택 업데이트</h3>
					                        <p>2024년부터 새로운 멤버십 등급과 혜택이 도입됩니다. 더 많은 포인트 적립과 할인 혜택을 누려보세요!</p>
					                    </div>
					                </div>
					
					                <!-- 공지 4: 연말 이벤트 -->
					                <div class="event-card">
					                    <div class="event-card-content">
					                        <h3>공지 4: 연말 감사 이벤트 안내</h3>
					                        <p>올 한 해 동안 사랑해주신 고객님들께 감사의 마음을 담아 특별 연말 이벤트를 준비했습니다. 다양한 상품을 할인된 가격에 만나보세요.</p>
					                    </div>
					                </div>
					
					            </section>
					        </div>
					    </div>
					</div>



					<!-- 회원 탈퇴 -->
					<!-- DB가서 전체 회원 정보랑 카트에 담긴 물품 주문 내역 등 다 삭제함 -->
					<div id="byebye" class="content-section" style="display: none;">
						<div class="profile-container">

							<button onclick="showModal()" class="all-button">회원 탈퇴</button>

							<div id="modal">
								<div id="modalContent">
									<h2>회원 탈퇴 확인</h2>
									<p>회원 탈퇴하시겠습니까?</p>
									<button class="all-button" onclick="confirmWithdrawal(true)">네</button>
									<button class="all-button" onclick="confirmWithdrawal(false)">아니오</button>
								</div>
							</div>

						</div>

					</div>

					<!-- 정보 수정하기 페이지 -->
					<!-- DB 가서 update 문으로 바꾸고 옴 -->
					<div id="edit-my-info" class="content-section"
						style="display: none;">
						<div class="profile-container">
							<h1 style="font-size: 26px; font-weight: bold;">정보 수정하기</h1>
							<br />

							<form action="/my-main/MemberUpdate.up" name="infoEditForm">
								<label for="user-Name">이름</label> <input type="text" id=""
									name="user-Name" id="user-Name"
									placeholder="현재 이름 : ${member.user_name }"> <label
									for="user-Pw">비밀번호</label> <input type="text" id=""
									name="user-Pw" id="user-Pw"
									placeholder="현재 비밀번호 : 비밀번호는 보안을 위해 표시되지 않습니다"> 
									<label for="user_address">주소</label>
								<button class="sheet-address-title-button" type="button"
									id="button-address-change" onclick="new_execDaumPostcode()">
									주소 변경</button>
								<input type="text" id="input_address" name="user_address"
									placeholder="현재 주소 : ${member.user_address }"> <label
									for="user_phone">전화번호</label> <input type="tel" id=""
									name="user_phone" id="user_phone"
									placeholder="현재 전화번호 : ${member.user_phone }" oninput="formatPhoneNumber(this)" maxlength="13" > <label
									for="user-Gender">성별</label>
								<div style="padding-top: 12px;">
									<input type="radio" id="male" name="user-Gender" value="M"
										checked> <label for="male">남</label> <input
										type="radio" id="female" name="user-Gender" value="W">
									<label for="female">여</label>
								</div>
								<div style="padding-top: 20px;">
									<input type="button" value="수정하기" class="all-button"
										onclick="infocheck();" />
								</div>
							</form>
						</div>

					</div>
					<!-- 더 추가할 페이지들 -->
				</main>
			</div>
		</div>
	</div>
</body>
<script src="/my-page/my-main/main-script.js"></script>

</html>


