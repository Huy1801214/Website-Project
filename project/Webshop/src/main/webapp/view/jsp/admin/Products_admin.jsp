<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/products_admin.css">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
        .product-image-table {
            width: 50px;
            height: 50px;
        }

        .btn-custom-dark {
            background-color: black;
            color: white;
            border: black;
        }

        .btn-custom-dark:hover {
            background-color: #333333;
        }

        .btn-custom-gray {
            background-color: #e9ecef;
            border: #e9ecef;
            color: #555;
        }

        .btn-custom-gray:hover {
            background-color: #ddd;
        }

        th,
        td {
            text-align: center;
            vertical-align: middle; /* Căn giữa theo chiều dọc */
        }

        th:first-child,
        td:first-child {
            width: 80px; /* Mã sản phẩm */
        }
        th:nth-child(2),
        td:nth-child(2) {
            width: 350px; /* Tên sản phẩm */
        }

        th:nth-child(6),
        td:nth-child(6) {
            width: 80px; /* Số lượng */
        }

        .form-control,
        .form-select {
            border: none; /* Xóa border */
            text-align: center; /* Canh giữa chữ */
            box-shadow: none !important; /* Loại bỏ box-shadow */
        }
        body{
            background-color: #f8f9fa
        }
        .search-add-container {
            display: flex;
            justify-content: left; /* Canh giữa theo chiều ngang */
            margin-bottom: 20px;
        }
        .search-add-container .search-form{
            display: flex;
            width: 70%
        }
        .input-group {
            display: flex;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .table{
            background-color: white
        }
    </style>
</head>
<body>
<c:import url="../../viewshare/Header_admin.jsp"/>
<h2>Quản lý sản phẩm</h2>
<div class="search-add-container">
    <form action="#" class="search-form">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Nhập mã sản phẩm" name="search">
            <button class="btn btn-primary" type="button">Tìm kiếm</button>
            <button class="btn btn-warning btn-add btn-custom-dark" data-bs-toggle="modal"
                    data-bs-target="#addModal" type="button">Thêm sản phẩm
            </button>
        </div>
    </form>
</div>

<form id="updateForm" action="${pageContext.request.contextPath}/UpdateProductAdmin" method="post">
    <table class="table">
        <thead>
        <tr>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Hình ảnh</th>
            <th>Giá nhập</th>
            <th>Giá bán</th>
            <th>Số lượng</th>
            <th>Ngày nhập hàng</th>
            <th>Loại sản phẩm</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productsList}">
            <tr>
                <td>
                    <input type="text" class="form-control" name="id_product" value="${product.id_product}" readonly/>
                </td>
                <td>
                    <input type="text" class="form-control" name="product_name" value="${product.product_name}"
                           readonly/>
                </td>
                <td>
                    <img src="${product.img}" alt="${product.product_name}" class="product-image-table">
                </td>
                <td>
                    <fmt:formatNumber value="${product.in_price}" type="currency" maxFractionDigits="0"
                                      currencySymbol=""/>
                    <input type="hidden" class="form-control" name="in_price" value="${product.in_price}" />
                </td>
                <td>
                    <fmt:formatNumber value="${product.out_price}" type="currency" maxFractionDigits="0"
                                      currencySymbol=""/>
                    <input type="hidden" class="form-control" name="out_price" value="${product.out_price}" />
                </td>
                <td>
                    <input type="number" class="form-control" name="quantity" value="${product.quantity}" readonly/>
                </td>
                <td>
                    <input type="date" class="form-control" name="creadted_date"
                           value="<fmt:formatDate value="${product.creadted_date}" pattern="yyyy-MM-dd"/>" readonly/>
                </td>
                <td>
                    <select class="form-select" name="id_category" disabled >
                        <option value="1" ${product.id_category == 1 ? 'selected' : ''}>Áo</option>
                        <option value="2" ${product.id_category == 2 ? 'selected' : ''}>Quần</option>
                        <option value="3" ${product.id_category == 3 ? 'selected' : ''}>Phụ kiện</option>
                    </select>
                </td>
                <td>
                    <a href="<c:url value="/ShowDetailPro">
                    <c:param name="id_product" value="${product.id_product}"/></c:url>"
                       class="btn btn-danger btn-delete btn-custom-dark">Sửa</a>
                    <a href="<c:url value="/DeleteProductAdmin">
                    <c:param name="id_product" value="${product.id_product}"/></c:url>"
                       class="btn btn-danger btn-delete btn-custom-gray">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>


<!-- Modal popup thêm sản phẩm -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="addModalLabel">Thêm sản phẩm mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProductForm" action="${pageContext.request.contextPath}/AddProductAdmin" method="post">
                    <div class="mb-3">
                        <label for="add-product-name" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="add-product-name" name="product_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="add-img" class="form-label">URL hình ảnh</label>
                        <input type="text" class="form-control" id="add-img" name="img" required>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-description" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="add-product-description" name="description" rows="4"
                                  required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-in-price" class="form-label">Giá nhập</label>
                        <input type="number" class="form-control" id="add-product-in-price" name="in_price"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-out-price" class="form-label">Giá bán</label>
                        <input type="number" class="form-control" id="add-product-out-price" name="out_price"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-quantity" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="add-product-quantity" name="quantity"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-manufacture-date" class="form-label">Ngày nhập hàng</label>
                        <input type="date" class="form-control" id="add-product-manufacture-date"
                               name="creadted_date"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="add-product-category" class="form-label">Loại sản phẩm</label>
                        <select class="form-select" id="add-product-category" name="id_category" required>
                            <option value="1">Áo</option>
                            <option value="2">Quần</option>
                            <option value="3">Phụ kiện</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../../js/products_admin.js"></script>
<!-- Footer -->
<c:import url="../../viewshare/Footer.jsp"/>
</body>
</html>