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


// Get the modal
const modal = document.getElementById("editModal");

// Get the buttons that open the modal
const editButtons = document.querySelectorAll(".btn-edit");

// Get the <span> element that closes the modal
const closeButton = document.querySelector(".close");
const cancelButton = document.querySelector(".close-button");


editButtons.forEach(button => {
    button.addEventListener("click", function (e) {
        e.preventDefault();
        const productId = this.getAttribute('data-id');
        console.log("Id product = "+ productId);
        // Tìm dòng chứa sản phẩm dựa trên id
        const row = this.closest('tr');
        // console.log("Row product = "+ row);


        // Lấy dữ liệu từ các ô trong dòng
        const productName = row.cells[1].textContent;
        // lấy giá trị hình ảnh từ cột thứ 2 và tìm thẻ img
        const imgElement = row.cells[2].querySelector('img');
        // Kiểm tra nếu có thẻ img thì lấy src
        let img = imgElement ? imgElement.getAttribute('src') : '';

        const productInPrice = row.cells[3].textContent;
        const productOutPrice = row.cells[4].textContent;
        const productQuantity = row.cells[5].textContent;
        const productCreatedDate = row.cells[6].textContent;

        let productCategory = row.cells[7].textContent;

        let categoryValue;
        if (productCategory.trim() === "ÁO") {
            categoryValue = 1;
        } else if(productCategory.trim() === "QUẦN") {
            categoryValue = 2;
        }else {
            categoryValue = 3;
        }


        // Load dữ liệu vào các input trong popup
        document.getElementById("edit-product-id").value = productId;
        document.getElementById("edit-product-name").value = productName;
        document.getElementById("edit-img").value = img;

        document.getElementById("edit-product-in-price").value = productInPrice;
        document.getElementById("edit-product-out-price").value = productOutPrice;
        document.getElementById("edit-product-quantity").value = productQuantity;
        document.getElementById("edit-product-manufacture-date").value = productCreatedDate;
        document.getElementById("edit-product-category").value = categoryValue;


        modal.style.display = "block";
    });
});


// When the user clicks on <span> (x), close the modal
if(closeButton){
    closeButton.onclick = function () {
        modal.style.display = "none";
    }
}
if(cancelButton){
    cancelButton.onclick = function (){
        modal.style.display ="none";
    }
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}