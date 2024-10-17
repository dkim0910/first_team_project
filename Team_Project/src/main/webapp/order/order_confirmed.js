// 바텀바 2차메뉴 클릭 기능
$(document).ready(function() {
	$('.toggle-icon, .toggle-menu').click(function(event) {
		event.preventDefault(); // 링크 클릭시 페이지 이동 방지
		$(this).parent().next('.submenu').slideToggle(); // 
		$('.submenu').not($(this).parent().next('.submenu')).slideUp();
	});
});