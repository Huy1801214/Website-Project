document.addEventListener('DOMContentLoaded', function() {
    const addButton = document.querySelector('.btn-add');
    const formAddProduct = document.querySelector('.form-add-product');

    addButton.addEventListener('click', function() {
        // Nếu form đang ẩn
        if (!formAddProduct.classList.contains('active')) {
            // Hiển thị form
            formAddProduct.style.display = 'block';
            // Đợi 10ms để CSS transition có thể hoạt động
            setTimeout(() => {
                formAddProduct.classList.add('active');
            }, 10);
        } else {
            // Ẩn form
            formAddProduct.classList.remove('active');
            // Đợi animation kết thúc rồi mới ẩn hoàn toàn
            setTimeout(() => {
                formAddProduct.style.display = 'none';
            }, 500);
        }
    });
});