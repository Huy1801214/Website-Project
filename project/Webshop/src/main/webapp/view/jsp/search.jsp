<%--
  Created by IntelliJ IDEA.
  User: LAPTOP USA PRO
  Date: 08-01-2025
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
  <title>Search result</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .breadcrumb {
      background-color: #f0f0f0;
      font-size: small;
      padding: 10px 5%;
      margin-bottom: 0;
    }

    .breadcrumb a {
      color: #999;
      text-decoration: none;
    }

    .product-card {
      margin-bottom: 30px;
      position: relative;

    }

    .product-card img {
      width: 100%;
      height: auto;
      object-fit: cover;
      cursor: pointer;
    }

    .price-old {
      text-decoration: line-through;
      color: #999;
      margin-left: 8px;
    }

    .quick-view {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      background: rgba(0, 0, 0, 0.5);
      color: white;
      text-align: center;
      padding: 10px;
      opacity: 0;
      transition: opacity 0.3s ease;
      cursor: pointer;
    }

    .product-card:hover .quick-view {
      opacity: 1;
    }

    .product-image-container {
      position: relative;
      margin-bottom: 10px;
    }

    .product-title {
      font-size: 14px;
      margin: 10px 0;
      cursor: pointer;
    }

    .product-price {
      font-weight: bold;
    }

    .product-count {
      text-align: right;
      color: #666;
      margin-bottom: 20px;
    }

    .modal-product-info {
      padding: 20px;
    }

    .product-code {
      color: #666;
      margin-bottom: 15px;
    }

    .size-option {
      display: inline-block;
      padding: 5px 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      margin-right: 10px;
    }

    .add-to-cart-btn {
      background: #000;
      color: white;
      padding: 10px 20px;
      border: none;
      width: 100%;
      margin-top: 20px;
    }

    .view-detail-link {
      color: #666;
      text-decoration: none;
    }

    .modal-thumbnail {
      width: 70px;
      height: 70px;
      object-fit: cover;
      cursor: pointer;
      border: 2px solid transparent;
      /* Thêm border mặc định trong suốt */
      transition: border-color 0.3s ease;
      /* Thêm hiệu ứng transition */
    }

    .modal-thumbnail.active,
    .modal-thumbnail:hover {
      border-color: #007bff;
      /* Màu border khi active hoặc hover */
    }

    .modal-thumbnail:not(:last-child) {
      margin-right: 5px;
      /* Thêm khoảng cách giữa các ảnh thumbnail */
    }

    .size-options {
      display: flex;
      /* Hiển thị theo chiều ngang */
      gap: 10px;
      /* Khoảng cách giữa các ô */
      margin-top: 5px;
    }

    .size-box {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 50px;
      /* Kích thước ô vuông */
      height: 50px;
      border: 1px solid #ddd;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
      font-weight: bold;
      transition: background-color 0.3s, border-color 0.3s;
    }

    .size-box:hover {
      background-color: #f0f0f0;
    }

    .size-box.active {
      background-color: #007bff;
      color: white;
      border-color: #007bff;
    }

    .img-thumbnail {
      max-width: 80px;
      max-height: 80px;
      object-fit: cover;
    }

    .table th,
    .table td {
      vertical-align: middle;
    }

    .modal-footer h6 {
      font-size: 1.2rem;
    }
  </style>
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<!-- Breadcrumb -->
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/LoadProduct">Trang chủ</a></li>
    <li class="breadcrumb-item"><a href="#">Danh mục</a></li>
    <li class="breadcrumb-item active" aria-current="page">ALL PRODUCTS</li>
  </ol>
</nav>

<h2 style="text-align: center; font-weight: normal">Kết quả tìm kiếm</h2>

<div class="container mt-4">
  <div class="product-count">
    ${fn:length(products)} sản phẩm
  </div>

  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-3">
      <div class="card">
        <div class="card-body">
          <table class="table">
            <thead>
            <th>Sắp xếp</th>
            </thead>
            <tbody>
            <tr>
              <td><a href="#" class="text-decoration-none" style="color: black;">Sản phẩm bán chạy</a>
              </td>
            </tr>
            <tr>
              <td><a href="#" class="text-decoration-none" style="color: black;">Sản phẩm nổi bật</a></td>
            </tr>
            <tr>
              <td><a href="#" class="text-decoration-none" style="color: black;">Giá từ thấp đến cao</a>
              </td>
            </tr>
            <tr>
              <td><a href="#" class="text-decoration-none" style="color: black;">Giá từ cao đến thấp</a>
              </td>
            </tr>
            <tr>
              <td><a href="#" class="text-decoration-none" style="color: black;">Sản phẩm mới nhất</a>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Products Grid -->
    <div class="col-md-9">
      <div class="row">
        <!-- Product Card 1 -->
        <c:forEach var="product" items="${products}">
          <div class="col-md-4 product-card">
            <div class="product-image-container">
              <a href="${pageContext.request.contextPath}/Ct_product?id_product=${product.id_product}">
                <img src="${product.img}" alt="">
              </a>
              <div class="quick-view" data-bs-toggle="modal" data-bs-target="#quickViewModal"
                   data-product-name="[KIDS] SET 03 SS LOGO SOCKS" data-product-code="112455106"
                   data-product-price="99,000₫" data-product-image="0" data-product-size="3pcs/set"
                   data-product-thumbnails='["https://product.hstatic.net/200000677367/product/7__kids__vo_c983dc7c22fc4660a992c0f8b79f1793_grande.jpg"]'>
                QUICK VIEW
              </div>
            </div>
            <h5 class="product-title">${product.product_name}</h5>
            <p class="mb-0">
                            <span class="product-price"><fmt:formatNumber value="${product.out_price}" type="currency"
                                                                          maxFractionDigits="0"/></span>
            </p>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>

<!-- Quick View Modal -->
<div class="modal fade" id="quickViewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header border-0">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-6">
            <img src="" class="img-fluid main-image" id="modalProductImage" alt="Product Image">
            <div class="modal-thumbnail-container mt-2 d-flex justify-content-between">
              <!-- Các ảnh thumbnail sẽ được tạo bằng JavaScript -->
            </div>
          </div>
          <div class="col-md-6 modal-product-info">
            <h4 id="modalProductName"></h4>
            <div class="product-code" id="modalProductCode"></div>
            <div class="product-price mb-3" id="modalProductPrice"></div>

            <div class="mb-3">
              <h6>Kích cỡ</h6>
              <div class="size-options">
                <div class="size-box" data-size="S">S</div>
                <div class="size-box" data-size="M">M</div>
                <div class="size-box" data-size="L">L</div>
              </div>
            </div>

            <button class="btn btn-primary add-to-cart-btn">THÊM VÀO GIỎ</button>
            <div class="text-center mt-2">
              <a href="#" class="view-detail-link">hoặc Xem chi tiết</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Cart Modal -->
<div class="modal fade" id="cartInfoModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">GIỎ HÀNG HIỆN CÓ (1) SẢN PHẨM</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="d-flex align-items-center">
          <img src="" alt="Product Image" class="img-thumbnail me-3" style="width: 80px;">
          <div>
            <p class="fw-bold"></p>
            <div class="d-flex">
              <span id="totalPrice"></span>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary">Giỏ hàng</button>
        <button type="button" class="btn btn-primary">Thanh toán</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Quick View Script -->
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const productLinks = document.querySelectorAll('.product-link');

    productLinks.forEach(link => {
      link.addEventListener('click', function (event) {
        event.preventDefault();
        const productUrl = this.getAttribute('data-product-url');
        if (productUrl) {
          window.location.href = productUrl;
        }
      });
    });


    const quickViewModal = document.getElementById('quickViewModal');

    quickViewModal.addEventListener('show.bs.modal', function (event) {
      const button = event.relatedTarget;
      // Lấy thông tin sản phẩm từ data attributes
      const productName = button.getAttribute('data-product-name');
      const productCode = button.getAttribute('data-product-code');
      const productPrice = button.getAttribute('data-product-price');
      const productImageIndex = button.getAttribute('data-product-image');
      //const productSize = button.getAttribute('data-product-size'); //Không cần nữa
      const productThumbnailsJson = button.getAttribute('data-product-thumbnails');


      // Cập nhật nội dung modal
      document.getElementById('modalProductName').textContent = productName;
      document.getElementById('modalProductCode').textContent = 'Mã sản phẩm: ' + productCode;
      document.getElementById('modalProductPrice').textContent = productPrice;

      const mainImage = document.querySelector('#modalProductImage');
      const thumbnailContainer = document.querySelector('.modal-thumbnail-container');
      // Lấy ra tất cả các ảnh thumbnail đã tạo trước đó và xóa đi
      thumbnailContainer.innerHTML = '';


      // Chuyển chuỗi JSON thành mảng
      const thumbnailImages = JSON.parse(productThumbnailsJson);
      // Lấy ảnh chính từ mảng thumbnail dựa trên index đã lưu
      const productImage = thumbnailImages[productImageIndex];
      mainImage.src = productImage;

      // Tạo ảnh thumbnail động
      thumbnailImages.forEach((imageUrl, index) => {
        const thumbnail = document.createElement('img');
        thumbnail.src = imageUrl;
        thumbnail.classList.add('img-thumbnail', 'modal-thumbnail');
        thumbnail.setAttribute('data-image', imageUrl);

        //  Gán sự kiện click
        thumbnail.addEventListener('click', function () {
          const thumbnails = thumbnailContainer.querySelectorAll('.modal-thumbnail');
          thumbnails.forEach(thumb => thumb.classList.remove('active'));
          thumbnail.classList.add('active');
          mainImage.src = imageUrl;
        });
        thumbnailContainer.appendChild(thumbnail);
      });
      // Đặt ảnh thumbnail đầu tiên là active và hiển thị ảnh chính
      if (thumbnailContainer.firstChild) {
        thumbnailContainer.firstChild.classList.add('active');
      }
    });

    // Thêm sự kiện click cho từng ô kích thước
    const sizeBoxes = document.querySelectorAll('.size-box');

    sizeBoxes.forEach(box => {
      box.addEventListener('click', function () {
        // Xóa lớp "active" khỏi tất cả các ô
        sizeBoxes.forEach(b => b.classList.remove('active'));
        // Thêm lớp "active" vào ô được chọn
        this.classList.add('active');

        // Lấy giá trị kích thước
        const selectedSize = this.getAttribute('data-size');
        console.log('Selected size:', selectedSize);
      });
    });

    // Thêm chức năng hiển thị và xử lý sử kiện của hộp giỏ hàng nhỏ khi nhấp chuột vào nút thêm vào giỏ
    const addToCartBtn = quickViewModal.querySelector('.add-to-cart-btn'); // Nút "THÊM VÀO GIỎ"
    const cartModal = new bootstrap.Modal(document.getElementById('cartInfoModal')); // Hộp thông tin giỏ hàng

    // Khi nhấn nút "THÊM VÀO GIỎ"
    addToCartBtn.addEventListener('click', function () {
      // Đóng Quick View Modal
      const bootstrapModal = bootstrap.Modal.getInstance(quickViewModal);
      bootstrapModal.hide(); // Đóng modal Quick View

      // Hiển thị Hộp thông tin giỏ hàng
      cartModal.show(); // Hiển thị giỏ hàng
    });

    // Lấy tất cả các nút "QUICK VIEW"
    const quickViewButtons = document.querySelectorAll('.quick-view');
    const quickViewAddToCartBtn = document.querySelector('.add-to-cart-btn');

    // Thông tin trong Quick View Modal
    const modalProductName = document.getElementById('modalProductName');
    const modalProductCode = document.getElementById('modalProductCode');
    const modalProductPrice = document.getElementById('modalProductPrice');
    const modalProductImage = document.getElementById('modalProductImage');

    // Thông tin trong Cart Modal
    const cartProductName = document.querySelector('#cartInfoModal .fw-bold');
    const cartProductPrice = document.querySelector('#cartInfoModal #totalPrice');
    const cartProductImage = document.querySelector('#cartInfoModal .img-thumbnail');

    quickViewButtons.forEach(button => {
      button.addEventListener('click', function () {
        const productName = button.getAttribute('data-product-name');
        const productCode = button.getAttribute('data-product-code');
        const productPrice = button.getAttribute('data-product-price');
        const productImage = button.parentElement.querySelector('img').src;

        modalProductName.textContent = productName;
        modalProductCode.textContent = `Mã sản phẩm: ${productCode}`;
        modalProductPrice.textContent = productPrice;
        modalProductImage.src = productImage;
      });
    });

    quickViewAddToCartBtn.addEventListener('click', function () {
      const productName = modalProductName.textContent;
      const productPrice = modalProductPrice.textContent;
      const productImage = modalProductImage.src;

      cartProductName.textContent = productName;
      cartProductPrice.textContent = productPrice;
      cartProductImage.src = productImage;

      const bootstrapModal = bootstrap.Modal.getInstance(quickViewModal);
      bootstrapModal.hide();

      cartModal.show();
    });
  });
</script>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
</body>
</html>
