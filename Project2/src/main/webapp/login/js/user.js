/**
 * 
 */
// 회원가입 폼 value 확인하는 자바스크립트
function sendit() {
	let frm = document.joinForm;
	let userid = frm.userid;
	let userpw = frm.userpw;
	let userpw_re = frm.userpw_re;
	let username = frm.username;
	let userphone = frm.userphone;
	let useraddress = frm.useraddress;

	// 아이디 빈값 처리
	if (userid.value == "") {
		alert("아이디를 입력하세요");
		userid.focus();
		return false;
	}

	// 아이디는 5자리 이상, 16자 미만
	if (userid.value.length <= 4
		|| userid.value.length >= 16) {
		alert("아이디는 5자리 이상, 16자 미만으로 작성해주세요");
		userid.focus();
		return false;
	}

	// 비밀번호 빈값 처리
	if (userpw.value == "") {
		alert("패스워드를 입력하세요");
		userpw.focus();
		return false;
	}

	// 비밀번호 8자리 이상 처리
	if (userpw.value.length < 8) {
		alert("비밀번호는 8자 이상으로 입력하세요");
		userpw.focus();
		return false;
	}

	// 비밀번호 == 비밀번호 확인 처리
	if (userpw.value != userpw_re.value) {
		alert("비밀번호 확인이 다릅니다");
		userpw_re.focus();
		return false;
	}

	// 이름 빈값 처리
	if (username.value == "") {
		alert("이름을 입력하세요");
		username.focus();
		return false;
	}

	// 휴대폰 번호 빈값처리
	if (userphone.value == "") {
		alert("휴대폰 번호를 입력하세요");
		userphone.focus();
		return false;
	}

	frm.submit();
}

function login() {
	let frm = document.frm;
	let useridElement = frm.userid;  // 아이디 입력 필드
	let userpw = frm.userpw.value;   // 비밀번호 입력 필드
	let userid = useridElement.value;

	// 아이디 빈값 체크
	if (userid == "") {
		alert("아이디를 입력하세요!");
		useridElement.focus();
		return false;
	}

	// 비밀번호 빈값 체크
	if (userpw == "") {
		alert("비밀번호를 입력하세요!");
		frm.userpw.focus();
		return false;
	}

	// Ajax로 로그인 요청
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "/join/userlogin.fr", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	// 요청 보낼 데이터 설정
	xhr.send("user_id=" + encodeURIComponent(userid) + "&user_pw=" + encodeURIComponent(userpw));

	xhr.onreadystatechange = function() {
		if (xhr.status == 200 && xhr.readyState == XMLHttpRequest.DONE) {
			// 서버에서 보낸 응답 처리
			let response = xhr.responseText.trim();
			if (response === "success") {
				// 로그인 성공 시, 메인 페이지로 리디렉션
				window.location.href = "/getAllItems.main";
			} else {
				// 로그인 실패 시 alert 표시
				alert("아이디 또는 비밀번호가 잘못되었습니다.");
			}
		}
	};
}

// 엔터 키 입력 시 로그인 함수 호출
document.addEventListener('keydown', function(event) {
	if (event.key === 'Enter') {
		event.preventDefault();  // 폼 제출 방지
		login();  // 로그인 함수 호출
	}
});

// 엔터 키 입력 시 (아이디 혹은 비밀번호)찾기 버튼 클릭
document.addEventListener('keydown', function(event) {
	if (event.key === 'Enter') {
		event.preventDefault();  // 폼 제출 방지
		document.getElementById('submitButton').click();  // 버튼 클릭
	}
});

// 주소 입력
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
			document.getElementById("useraddress").value = addr;
			// 커서를 주소 필드로 이동한다.
			document.getElementById("useraddress").focus();
		}
	}).open();
}

function checkId() {
	let userid = document.getElementById("userid").value;
	if (userid == "") {
		alert("아이디를 입력해주세요");
		userid.focus();
		return false;
	} else {
		// ajax 통신으로 id 중복체크
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/join/checkId.fr", true);

		// Content-Type 설정
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("user_id=" + encodeURIComponent(userid));
		xhr.onreadystatechange = function() {
			if (xhr.status == 200
				&& xhr.readyState == XMLHttpRequest.DONE) {
				// alert(xhr.responseText);	
				if (xhr.responseText.trim() == "ok") {
					document.getElementById("text").innerHTML
						= "사용할 수 있는 아이디 입니다.";
				} else {
					document.getElementById("text").innerHTML
						= "중복된 아이디 입니다. ";
				}
			}
		}

	}
}





