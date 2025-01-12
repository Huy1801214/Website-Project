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
    </style>
</head>
<body>
<c:import url="../viewshare/Header_admin.jsp"/>
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


<table>
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
        <tr data-product-id="${product.id_product}"
            data-product-name="${product.product_name}"
            data-product-img="${product.img}"
            data-product-description="${product.description}"
            data-product-in-price="${product.in_price}"
            data-product-out-price="${product.out_price}"
            data-product-quantity="${product.quantity}"
            data-product-created-date="<fmt:formatDate value="${product.creadted_date}" pattern="yyyy-MM-dd"/>"
            data-product-category="${product.id_category}">
            <td>${product.id_product}</td>
            <td>${product.product_name}</td>
            <td>
                <img src="${product.img}" alt="${product.product_name}" class="product-image-table">
            </td>
            <td><fmt:formatNumber value="${product.in_price}" type="currency" maxFractionDigits="0"
                                  currencySymbol=""/></td>
            <td><fmt:formatNumber value="${product.out_price}" type="currency" maxFractionDigits="0"
                                  currencySymbol=""/></td>
            <td>${product.quantity}</td>
            <td><fmt:formatDate value="${product.creadted_date}" pattern="dd/MM/yyyy"/></td>
            <td>
                <c:choose>
                    <c:when test="${product.id_category == 1}">
                        <p>ÁO</p>
                    </c:when>
                    <c:when test="${product.id_category == 2}">
                        <p>QUẦN</p>
                    </c:when>
                    <c:otherwise>
                        <p>PHỤ KIỆN</p>
                    </c:otherwise>
                </c:choose></td>
            <td>
                <button class="btn btn-primary btn-edit btn-custom-dark" data-bs-toggle="modal"
                        data-bs-target="#editModal" data-id="${product.id_product}">Sửa
                </button>
                <a href="<c:url value="/DeleteProductAdmin">
                    <c:param name="id_product" value="${product.id_product}"/></c:url>"
                   class="btn btn-danger btn-delete btn-custom-gray">Xóa</a>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal popup chỉnh sửa sản phẩm -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="editModalLabel">Chỉnh sửa sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editProductForm" action="${pageContext.request.contextPath}/UpdateProductAdmin" method="post">
                    <input type="hidden" id="edit-product-id" name="id_product">

                    <div class="mb-3">
                        <label for="edit-product-name" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="edit-product-name" name="product_name" required
                               value="">
                    </div>

                    <div class="mb-3">
                        <label for="edit-img" class="form-label">URL hình ảnh</label>
                        <input type="text" class="form-control" id="edit-img" name="img" required
                               value="">
                    </div>

                    <div class="mb-3">
                        <label for="edit-product-description" class="form-label">Mô tả</label>
                        <textarea class="form-control" id="edit-product-description" name="description" rows="4"
                                  required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="edit-product-in-price" class="form-label">Giá nhập</label>
                        <input type="number" class="form-control" id="edit-product-in-price" name="in_price"
                               required value="">
                    </div>
                    <div class="mb-3">
                        <label for="edit-product-out-price" class="form-label">Giá bán</label>
                        <input type="number" class="form-control" id="edit-product-out-price" name="out_price"
                               required value="">
                    </div>
                    <div class="mb-3">
                        <label for="edit-product-quantity" class="form-label">Số lượng</label>
                        <input type="number" class="form-control" id="edit-product-quantity" name="quantity"
                               required value="">
                    </div>
                    <div class="mb-3">
                        <label for="edit-product-manufacture-date" class="form-label">Ngày nhập hàng</label>
                        <input type="date" class="form-control" id="edit-product-manufacture-date"
                               name="creadted_date"
                               required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-product-category" class="form-label">Loại sản phẩm</label>
                        <select class="form-select" id="edit-product-category" name="id_category" required
                        >
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
                        <label for="add-product-id" class="form-label">Mã sản phẩm</label>
                        <input type="text" class="form-control" id="add-product-id" name="id_product" required>
                    </div>
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
<script src="../js/products_admin.js"></script>
<!-- Footer -->
<c:import url="../viewshare/Footer.jsp"/>
</body>
</html>