const accordionHeaders = document.querySelectorAll('.accordion-header');

accordionHeaders.forEach(header => {
    header.addEventListener('click', () => {
        const content = header.nextElementSibling;
        const isActive = header.classList.contains('active');
        // Close all other open items
        accordionHeaders.forEach(otherHeader => {
            if (otherHeader !== header && otherHeader.classList.contains('active')) {
                otherHeader.classList.remove('active');
                otherHeader.nextElementSibling.classList.remove('show')
            }
        });
        header.classList.toggle('active');
        content.classList.toggle('show');
    });
});
// Drag to scroll
const productContainer = document.querySelector('.product-container');
const product = document.querySelector('.product');
let isDragging = false;
let startX;
let scrollLeft;
product.addEventListener('mousedown', (e) => {
    isDragging = true;
    product.classList.add('dragging');
    startX = e.pageX - product.offsetLeft;
    scrollLeft = product.scrollLeft;
});

product.addEventListener('mouseleave', () => {
    isDragging = false;
    product.classList.remove('dragging');
});

product.addEventListener('mouseup', () => {
    isDragging = false;
    product.classList.remove('dragging');
});

productContainer.addEventListener('mousemove', (e) => {
    if (!isDragging) return;
    e.preventDefault();
    const x = e.pageX - product.offsetLeft;
    const walk = (x - startX);
    product.style.transform = `translateX(${walk}px)`;
});

function selectSize(button) {
    // Loại bỏ selected class của các button khác
    const sizeButtons = document.querySelectorAll('.size-button');
    sizeButtons.forEach(btn => btn.classList.remove('selected'));

    // Thêm class selected vào button được chọn
    button.classList.add('selected');
    // Lấy `product_op_id` từ `data-option-id`
    const selectedOptionId = button.getAttribute('data-option-id');
    // Gán vào input hidden
    document.getElementById('selected_product_op_id').value = selectedOptionId;

    console.log("Selected Option ID:", selectedOptionId); // Debug
}