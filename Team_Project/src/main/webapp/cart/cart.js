// 선택된 항목 삭제
function deleteSelectedItems() {
    const selectedItems = document.querySelectorAll('.item-checkbox:checked');
    if (selectedItems.length > 0) {
        // 삭제 확인 메시지
        if (confirm('선택한 항목을 삭제하시겠습니까?')) {
            // 체크된 항목들을 배열에 저장
            let itemIds = Array.from(selectedItems).map(item => item.value);
            // 배열의 값들을 문자열 형태로 변환하여 URL로 전달
            window.location.href = `deleteItems.ca?itemIds=${itemIds.join(",")}`;
        }
    } else {
        alert('삭제할 항목을 선택하세요.');
    }
}

// 선택된 항목 구매
function purchaseItems() {
    const selectedItems = document.querySelectorAll('.item-checkbox:checked');
    if (selectedItems.length > 0) {
		// 체크된 항목들을 배열에 저장
        let itemIds = Array.from(selectedItems).map(item => item.value);
		// 배열의 값들을 문자열 형태로 변환
        window.location.href = `purchaseItems.ca?itemIds=${itemIds.join(",")}`;
    } else {
        alert('구매할 항목을 선택하세요.');
    }
}

// 전체 선택
function toggleSelectAll(source) {
    const checkboxes = document.querySelectorAll('.item-checkbox');
    checkboxes.forEach(checkbox => {
        checkbox.checked = source.checked;
    });
}

// 장바구니 소계 및 총합 계산 함수
function calculateTotalPrice() {
    let totalPrice = 0;

    // 모든 상품의 소계를 계산하고, 총합을 구함
    document.querySelectorAll('.cart-item').forEach(item => {
        // 가격과 수량 가져오기
        const price = parseInt(item.querySelector('.item-price').textContent.replace('원', '').replace(/,/g, '').trim());
        const quantity = parseInt(item.querySelector('.item-quantity').textContent);
        
        // 소계 계산
        const subtotal = price * quantity;
        
        // 소계를 해당 요소에 업데이트
        item.querySelector('.item-subtotal').textContent = subtotal.toLocaleString() + '원';
		
        // 개당 가격에 ',' 추가
        item.querySelector('.item-price').textContent = price.toLocaleString() + '원';

        // 전체 총합에 소계를 더함
        totalPrice += subtotal;
    });

    // 총합을 cart_final_price 요소에 업데이트
    document.getElementById('cart_final_price').textContent = totalPrice.toLocaleString() + '원';
}

