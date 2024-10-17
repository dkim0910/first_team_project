console.clear();

$(document).ready(function() {
	// 탭 메뉴 클릭 이벤트
	$('#menu1 li a').on('click', function(e) {
		e.preventDefault();

		// 모든 메뉴 항목에서 active 클래스 제거
		$('#menu1 li a').removeClass('active');

		// 클릭된 메뉴 항목에 active 클래스 추가
		$(this).addClass('active');

		// 모든 탭 콘텐츠 숨김
		$('.tab-content').addClass('hidden');

		// 관련된 탭 콘텐츠 표시
		const tabId = $(this).data('tab');
		$('#' + tabId).removeClass('hidden');
	});

	// 첫 번째 탭 기본 활성화
	$('#menu1 li a').first().addClass('active');
	$('.tab-content').first().removeClass('hidden');
});


// 배너 fade-in, fade-out 기능
function SliderBox__init() {
	let SliderBox1__idx = 0;

	setInterval(function() {
		$('.slider-box-1').attr('data-index', ++SliderBox1__idx % 5);
	}, 3000);
}

SliderBox__init();

// 바텀바 2차메뉴 클릭 기능
$(document).ready(function() {
	$('.toggle-icon, .toggle-menu').click(function(event) {
		event.preventDefault(); // 링크 클릭시 페이지 이동 방지
		$(this).parent().next('.submenu').slideToggle(); // 
		$('.submenu').not($(this).parent().next('.submenu')).slideUp();
	});
});


// 브랜드페이지 스와이퍼 기능
function SwiperInit(selector, prevBtnClass, nextBtnClass) {
	const swiper = new Swiper(selector, {
		spaceBetween: 20,
		speed: 800,
		allowSlidePrev: false,
		allowSlideNext: false,
	});

	$(`.${nextBtnClass}`).click(function() {
		$(selector).addClass('active');
		$(`.${nextBtnClass}`).removeClass('active');
		$(`.${prevBtnClass}`).addClass('active');
	});

	$(`.${prevBtnClass}`).click(function() {
		$(selector).removeClass('active');
		$(`.${nextBtnClass}`).addClass('active');
		$(`.${prevBtnClass}`).removeClass('active');
	});
}

SwiperInit('.section-img .swiper-con1', 'swiper-btn__prev-1', 'swiper-btn__next-1');
SwiperInit('.section-img-2 .swiper-con2', 'swiper-btn__prev-2', 'swiper-btn__next-2');
SwiperInit('.section-img-3 .swiper-con3', 'swiper-btn__prev-3', 'swiper-btn__next-3');
SwiperInit('.section-img-4 .swiper-con4', 'swiper-btn__prev-4', 'swiper-btn__next-4');
SwiperInit('.section-img-5 .swiper-con5', 'swiper-btn__prev-5', 'swiper-btn__next-5');
SwiperInit('.section-img-6 .swiper-con6', 'swiper-btn__prev-6', 'swiper-btn__next-6');


