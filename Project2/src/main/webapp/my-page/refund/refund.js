// 버튼 누루면 아래 환불 신청 자료 나옴
function showRefundForm(productName, orderNumber) {
    document.getElementById('refund-form-section').style.display = 'block';
    document.getElementById('product-name').value = productName;
    document.getElementById('order-number').value = orderNumber;
}

// 스타일 제거 아래 공백 제거임 100vh 설정된거
function removeStyles() {
    var section = document.getElementById("remove-style");
    section.style.minHeight = ""; // min-height 제거
    section.style.display = "";   // display 제거
}

