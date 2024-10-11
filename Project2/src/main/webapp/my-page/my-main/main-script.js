// 이 펑션이 페이지에서 사이드바에 있는 카테고리 클릭하면 나타내주는 기능의 펑션
function showContent(sectionId) {
	// 모든 섹션 숨기기
	let sections = document.querySelectorAll('.content-section');
	sections.forEach(function(section) {
		section.style.display = 'none';
	});
	// 선택된 섹션만 표시하기
	let sectionToShow = document.getElementById(sectionId);
	if (sectionToShow) {
		sectionToShow.style.display = 'block';
	}
}

// 버튼 클릭시 계속 볼드채로 있는 평션 (클릭 시 사이드바 옵션들 볼드채)
function toggleBold(selectedElement) {
	// 모든 .sidebar-options 요소를 선택
	const options = document.querySelectorAll('.sidebar-options');
	// 모든 요소에서 'bold' 클래스를 제거
	options.forEach(option => {
		option.classList.remove('bold');
	});
	// 클릭한 요소에 'bold' 클래스를 추가
	selectedElement.classList.add('bold');
	// 클릭한 메뉴를 localStorage에 저장
	localStorage.setItem('activeMenu', selectedElement.innerText);
}

// 추적하기 엔터 눌러도 바로 추적하기 버튼 눌린거 처럼 하는거
document.getElementById('order-number').addEventListener('keydown', function(event) {
	if (event.key === 'Enter') {
		document.getElementById('track-button').click(); // 버튼 클릭 이벤트 호출	
	}
});

// 배달 현황 바 나오는 평션
// 버튼 누룰때 마다 1일 씩 줄어들어서 0이되면 배송 완료 나옴 그리고 리셋
document.getElementById('track-button').addEventListener('click', function() {
	const orderNumber = document.getElementById('order-number').value;
	const displayOrderNumber = document.getElementById('display-order-number');
	const trackingInfo = document.getElementById('tracking-info');
	const warningMessage = document.getElementById('warning-message');

	let progress = 0; // 배송 현황 바를 0으로 시작
	let expectedDays = 5; // 5일후 도착

	// 주문번호가 숫자 인지를 확인
	const isNumeric = /^\d+$/.test(orderNumber); // 정규 표현식으로 숫자 체크

	// 주문 번호가 비어있을 경우 경고 메시지 표시
	if (orderNumber == '') {
		/*warningMessage.style.display = 'block';*/
		warningMessage.textContent = '주문 번호를 입력해주세요';
		warningMessage.style.color = 'black';
		return; // 함수 종료
	} else if (!isNumeric) {
		// 숫자가 아닌 경우 경고 메시지 표시
		/*warningMessage.style.display = 'block';*/
		warningMessage.textContent = '주문 번호는 숫자만 입력할 수 있습니다';
		warningMessage.style.color = 'black';
		return; // 함수 종료
	} else {
		warningMessage.textContent = ''; // 경고 메시지 초기화
	}

	/*trackingInfo.style.display = 'block';*/
	displayOrderNumber.textContent = orderNumber;

	const progressBar = document.querySelector('.progress-bar');
	const currentLocation = document.getElementById('current-location');
	const expectedDeliveryDate = document.getElementById('expected-delivery-date');

	// 처음엔 5일로 시작
	expectedDeliveryDate.textContent = `${expectedDays}일 후`;
	progressBar.style.width = '0%'; // 초기값 설정

	const interval = setInterval(() => {
		if (progress < 100) {
			progress += 25; // 25 씩 증가함 
			expectedDays -= 1; // 도착일을 하루씩 줄임

			progressBar.style.width = progress + '%';

			expectedDeliveryDate.textContent = `${expectedDays}일 후`;	// 1씩 줄어드는거 표시하는거

			if (expectedDays == 5) {
				currentLocation.textContent = '물류센터 A';
			}
			if (expectedDays == 4) {
				currentLocation.textContent = '물류센터 B';
			}
			if (expectedDays == 3) {
				currentLocation.textContent = '물류센터 C';
			}
			if (expectedDays == 2) {
				currentLocation.textContent = '물류센터 D';
			}

			// 100 이면 배송 완료 나옴
			if (progress >= 100) {
				expectedDeliveryDate.textContent = '배송 완료';
				currentLocation.textContent = '집';
				clearInterval(interval); // 타이머 중지
			}
		}
	}, 1500); // 1.5초에 한번씩 진행바 올라감
});

// 멤버십 바 올라가는거 평션

// 사용자 현재 포인트 예시
const currentPoints = 750; // 현재 포인트
const nextLevelPoints = 1000; // 다음 레벨까지 필요한 포인트 (예: Premium)

// 진행 상태 바 업데이트
const memberBar = document.getElementById('membership-bar');

// 현재 포인트 비율 계산
const progressPercent = (currentPoints / nextLevelPoints) * 100;

// progress-bar의 width 속성을 설정하여 상태바 색을 채움
memberBar.style.width = progressPercent + '%';

// 남은 포인트 계산 후 텍스트 업데이트
const pointsLeft = nextLevelPoints - currentPoints;
document.getElementById('points-left-text').textContent = `다음 등급까지 ${pointsLeft} 포인트가 남았습니다!`;


// 회원 탈퇴 펑션
function showModal() {
	document.getElementById("modal").style.display = "flex";
}

function confirmWithdrawal(confirmed) {
	const modal = document.getElementById("modal");
	modal.style.display = "none"; // 모달 닫기

	if (confirmed) {
		alert("회원 탈퇴가 성공적으로 완료되었습니다.");

		window.location.href = "/byebye.my";
	}

	if (!confirmed) {
		alert("회원 탈퇴를 실패했습니다.");
	}
}

// 로그 아웃 alert 창 
function logout() {
	// 확인 대화상자 표시
	if (confirm("로그 아웃 하시겠습니까?")) {
		// 사용자가 "네"를 클릭한 경우 로그아웃 페이지로 이동
		window.location.href = "/bye.my"; // 로그아웃 페이지의 URL로 변경
	}
	// 사용자가 "아니요"를 클릭한 경우 아무 작업도 하지 않음
}

// 정보 수정 
window.onload = function() {
	let showMyInfo = '<c:out value="${showMyInfo}" />'; // 세션에서 showMyInfo 값을 가져옴

	if (showMyInfo === 'true') {
		// '나의 정보'가 선택된 상태라면 localStorage 값을 유지
		let activeMenu = localStorage.getItem('activeMenu');
		const options = document.querySelectorAll('.sidebar-options');
		options.forEach(option => {
			if (option.innerText === activeMenu) {
				option.classList.add('bold');
			}
		});
	} else {
		// '나의 정보'가 선택되지 않은 상태라면 localStorage 초기화
		localStorage.removeItem('activeMenu');

		// 모든 sidebar-options 요소에서 'bold' 클래스를 제거
		const options = document.querySelectorAll('.sidebar-options');
		options.forEach(option => {
			option.classList.remove('bold');
		});
	}
};
// 정보 수정 텍스트 박스 클릭해도 넘어가지는거 방지하는 평션 (나만 오류남?)

// 정보 수정 시 빈 값 체크
function infocheck() {
	let frm = document.infoEditForm;
	let user_name = frm["user-Name"].value;  			// 이름 입력 필드
	let user_pw = frm["user-Pw"].value;   				// 비밀번호 입력 필드
	let user_address = frm["user_address"].value;   	// 주소 입력 필드
	let user_phone = frm["user_phone"].value;   		// 전화번호 입력 필드

	// 이름 빈값 체크
	if (user_name == "") {
		alert("이름을 입력하세요");
		frm["user-Name"].focus();
		return false;
	}

	// 비밀번호 빈값 체크
	if (user_pw == "") {
		alert("비밀번호를 입력하세요");
		frm["user-Pw"].focus();
		return false;
	}

	// 주소 빈값 체크
	if (user_address == "") {
		alert("주소를 입력하세요");
		frm["user_address"].focus();
		return false;
	}

	// 전화번호 빈값 체크
	if (user_phone == "") {
		alert("전화번호를 입력하세요");
		frm["user_phone"].focus();
		return false;
	}
	frm.submit();
	showContent('my-info');
}

// 주소 변경 
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



function formatPhoneNumber(input) {
	// 입력 값에서 숫자만 추출
	const value = input.value.replace(/\D/g, '');

	// 11자리 제한
	if (value.length > 11) {
		input.value = value.slice(0, 11); // 11자리까지만 잘라냄
	}

	// 전화번호 형식 적용
	if (value.length === 11) {
		input.value = value.replace(/^(\d{3})(\d{4})(\d{4})$/,
			'$1-$2-$3');
	} else if (value.length > 7) {
		input.value = value.replace(/^(\d{3})(\d{4})$/, '$1-$2');
	} else if (value.length > 3) {
		input.value = value.replace(/^(\d{3})(\d{0,4})$/, '$1-$2');
	} else {
		input.value = value;
	}
}

