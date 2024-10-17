// 배송지 변경 
function new_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				/*-- // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				 if(extraAddr !== ''){
					 extraAddr = ' (' + extraAddr + ')';
				 }
				 // 조합된 참고항목을 해당 필드에 넣는다.
				 document.getElementById("input_extraAddress").value = extraAddr;
			 --*/
			} else {
				//   document.getElementById("input_extraAddress").value = '';
			}

			// 주소 정보를 해당 필드에 넣는다.
			document.getElementById("input_address").value = addr;
			// 커서를 주소 필드로 이동한다.
			document.getElementById("input_address").focus();
		}
	}).open();
}

// 배송 메세지 선택 selectbox
document.addEventListener('DOMContentLoaded', () => {
	const btn = document.querySelector(".sheet-message-text");
	const list = document.querySelector(".sheet-message-selectbox");

	// 요소가 존재하는지 확인
	if (!btn || !list) {
		console.error("버튼이나 리스트 요소를 찾을 수 없습니다.");
		return;
	}

	// 버튼을 누르면 화살표 방향이 바뀌어야 한다. 
	// 셀렉트 박스 옵션이 담긴 ul 이 나와야한다. 
	// 클릭했을 때 그 클릭된 요소가 박스에 보여야 한다. 

	btn.addEventListener('click', () => {
		btn.classList.toggle('on');
		list.classList.toggle('on');
	});

	list.addEventListener('click', (e) => {
		if (e.target.nodeName === 'BUTTON') {
			btn.innerHTML = e.target.innerHTML;
			list.classList.remove('on');
			btn.classList.remove('on');
		}
	});
});

// 기타 결제 부분
function toggleOtherPayments(show) {
	var otherPayments = document.getElementById('other-payment-options');
	if (show) {
		otherPayments.style.display = 'block';
	} else {
		otherPayments.style.display = 'none';
	}
}
// 기타 -> 카드 결제 부분
function togglePaymentCard(show) {
	var listPayments = document.getElementById('list-payment');
	if (show) {
		listPayments.style.display = 'block';
	} else {
		listPayments.style.display = 'none';
	}
}

// 장바구니 상품 결제하기
// 선택된 항목 구매
function purchasecartItems() {
	const selectedItems = document.querySelectorAll('.item-purchase-list');
	// 구매할 상품ID들을 배열에 저장
	let itemIds = Array.from(selectedItems).map(item => item.value);
	// 배열의 값들을 문자열 형태로 변환하고 전송
	window.location.href = `/order/cart_to_order.or_c?itemIds=${itemIds.join(",")}`;
}

// 바텀바 2차메뉴 클릭 기능
$(document).ready(function() {
	$('.toggle-icon, .toggle-menu').click(function(event) {
		event.preventDefault(); // 링크 클릭시 페이지 이동 방지
		$(this).parent().next('.submenu').slideToggle(); // 
		$('.submenu').not($(this).parent().next('.submenu')).slideUp();
	});
});

$(document).ready(function() {
	// 기타 결제 버튼 클릭 기능
	$('#other-payment-options button').on('click', function() {
		// 모든 버튼의 border를 초기화
		$('#other-payment-options button').css('border', '2px solid #e0e0e0');

		// 클릭된 버튼의 border를 검은색으로 변경
		$(this).css('border', '2px solid black');

		// 모든 li의 border를 초기화
		$('#other-payment-options li').css('border', 'none');

		// 클릭된 버튼이 포함된 li의 border를 검은색으로 변경
		$(this).closest('li').css('border', '1px solid black');
	});

	// 카드 결제 버튼 클릭 기능
	$('.card-selection-input').on('click', function() {
		// 모든 li의 border를 초기화
		$('li').css('border', '1px solid #e0e0e0');

		// 클릭된 input의 조상인 label의 부모 li의 border를 검은색으로 변경
		$(this).closest('label').parent('li').css('border', '1px solid black');

		// 선택된 버튼의 border를 검은색으로 유지
		$('#other-payment-options button').each(function() {
			if ($(this).css('border') === '2px solid black') {
				$(this).css('border', '2px solid black');
			}
		});
	});
});