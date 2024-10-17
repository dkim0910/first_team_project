// 스크롤 함수
function scrollToSection(event) {
    const sectionId = event.target.getAttribute('data-target');
    document.getElementById(sectionId).scrollIntoView({ 
        behavior: 'smooth', 
        block: "center"
    });
}

document.querySelectorAll('.left-goods-category li').forEach(function(li) {
    li.addEventListener('click', scrollToSection);
});

// 스크롤
const sections = document.querySelectorAll('.goods-category');
const navItems = document.querySelectorAll('.left-goods-category li');

window.addEventListener('scroll', () => {
    let currentSection = '';

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.offsetHeight;

        if (window.scrollY >= sectionTop - sectionHeight / 2 && window.scrollY < sectionTop + sectionHeight / 2) {
            currentSection = section.getAttribute('id');
        }
    });

    // 각 <li> 항목의 상태 업데이트
    navItems.forEach(li => {
        li.classList.remove('active');
        if (li.getAttribute('data-target') === currentSection) {
            li.classList.add('active');
        }
    });
});

// 엔터 키를 눌렀을 시 검색
$('#search').on('keydown', function(event) {
    if (event.key === 'Enter') {  // 엔터 키를 눌렀는지 확인
        search();  // 검색 함수 실행
    }
});

// 검색
function search() {
    let search_value = $('#search').val();
    
    // 각 .goods 요소의 name 속성을 순회하면서 확인
    $('.goods').each(function() {
        let name = $(this).attr('name');  // 각 요소의 name 속성값을 가져옴
        if (name === search_value) {
            let href = $(this).attr('href');
            window.location.href = href;
        }
    });
}

// 상품 옆의 작은 설명 상자
document.querySelectorAll('.goods').forEach(product => {
    const description = product.querySelector('.product-description');

    product.addEventListener('mouseenter', () => {
        description.style.display = 'block';
    });

    product.addEventListener('mousemove', (e) => {
        // 마우스 위치에 따라 설명 상자의 위치 설정
        description.style.left = `${e.pageX + 10}px`;
        description.style.top = `${e.pageY + 10}px`;
    });

    product.addEventListener('mouseleave', () => {
        description.style.display = 'none';
    });
});