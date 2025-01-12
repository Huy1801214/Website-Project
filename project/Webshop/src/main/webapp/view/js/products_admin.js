document.addEventListener('DOMContentLoaded', function () {
    const addButton = document.querySelector('.btn-add');


    addButton.addEventListener('click', function () {
        // Lấy id từ form thêm sản phẩm
        const addProductForm = document.getElementById('addProductForm');
        // reset lại các input trong form thêm sản phẩm
        addProductForm.reset();
    });
});


// Get the buttons that open the modal
const editButtons = document.querySelectorAll(".btn-edit");

editButtons.forEach(button => {
    button.addEventListener("click", function (e) {
        e.preventDefault(); // Prevent default action

        const productId = this.getAttribute('data-id');
        console.log("Id product = " + productId);
        // Tìm dòng chứa sản phẩm dựa trên id
        const row = this.closest('tr');
        // console.log("Row product = "+ row);

        // Lấy dữ liệu từ các thuộc tính data-*
        const productName = row.dataset.productName;
        const img = row.dataset.productImg;
        const description = row.dataset.productDescription;
        const inPrice = row.dataset.productInPrice;
        const outPrice = row.dataset.productOutPrice;
        const quantity = row.dataset.productQuantity;
        const createdDate = row.dataset.productCreatedDate;
        const categoryValue = row.dataset.productCategory;


        // Load dữ liệu vào các input trong popup
        document.getElementById("edit-product-id").value = productId;
        document.getElementById("edit-product-name").value = productName;
        document.getElementById("edit-img").value = img;
        document.getElementById("edit-product-description").value = description;
        document.getElementById("edit-product-in-price").value = inPrice;
        document.getElementById("edit-product-out-price").value = outPrice;
        document.getElementById("edit-product-quantity").value = quantity;
        document.getElementById("edit-product-manufacture-date").value = createdDate;
        document.getElementById("edit-product-category").value = categoryValue;

        // show modal by using bootstrap
        const modal = document.getElementById("editModal");
        const modalBootstrap = new bootstrap.Modal(modal);
        modalBootstrap.show();

    });
});