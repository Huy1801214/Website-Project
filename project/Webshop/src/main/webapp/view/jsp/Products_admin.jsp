<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/2/2024
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/products_admin.css">
    <title>Quản ly sản phẩm</title>
</head>
<body>
<c:import url="../viewshare/Header_admin.jsp"/>
<h2>Quản lý sản phẩm</h2>
<div class="search-add-container">
    <form action="search" class="search-form">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Nhập mã sản phẩm" name="search">
            <button class="btn btn-primary" type="button">Tìm kiếm</button>
            <button class="btn btn-warning btn-add" type="button">Thêm sản phẩm</button>
        </div>
    </form>
</div>

<!-- Form thêm sản phẩm -->
<div class="form-add-product">
    <!-- Form thêm sản phẩm -->
    <form class="product-form">
        <h2 id="title-add-product">Thêm sản phẩm mới</h2>
        <!-- Mã sản phẩm -->
        <div class="mb-3">
            <label for="product-id" class="form-label">Mã sản phẩm</label>
            <input type="text" class="form-control" id="product-id" name="product-id" required>
        </div>

        <!-- Tên sản phẩm -->
        <div class="mb-3">
            <label for="product-name" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="product-name" name="product-name" required>
        </div>

        <!-- Mô tả -->
        <div class="mb-3">
            <label for="product-description" class="form-label">Mô tả</label>
            <textarea class="form-control" id="product-description" name="product-description" rows="4"
                      required></textarea>
        </div>

        <!-- Giá tiền -->
        <div class="mb-3">
            <label for="product-price" class="form-label">Giá tiền</label>
            <input type="number" class="form-control" id="product-price" name="product-price" required>
        </div>

        <!-- Số lượng -->
        <div class="mb-3">
            <label for="product-quantity" class="form-label">Số lượng</label>
            <input type="number" class="form-control" id="product-quantity" name="product-quantity" required>
        </div>

        <!-- Ngày sản xuất -->
        <div class="mb-3">
            <label for="product-manufacture-date" class="form-label">Ngày nhập hàng</label>
            <input type="date" class="form-control" id="product-manufacture-date" name="product-manufacture-date"
                   required>
        </div>

        <!-- Loại sản phẩm -->
        <div class="mb-3">
            <label for="product-category" class="form-label">Loại sản phẩm</label>
            <select class="form-select" id="product-category" name="product-category" required>
                <option value="shirt">Áo</option>
                <option value="pants">Quần</option>
                <option value="accessories">Phụ kiện</option>
            </select>
        </div>

        <!-- Nút thêm sản phẩm -->
        <button type="button" class="btn btn-primary">Thêm sản phẩm</button>
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
        <tr>
            <td>${product.id_product}</td>
            <td>${product.product_name}</td>
            <td><img src="${product.img}" alt="${product.product_name}" class="product-image-table" style="width: 50px; height: 50px"></td>
            <td><fmt:formatNumber value="${product.in_price}" type="currency" maxFractionDigits="0"
                                  currencySymbol=""/></td>
            <td><fmt:formatNumber value="${product.out_price}" type="currency" maxFractionDigits="0"
                                  currencySymbol=""/></td>
            <td>${product.quantity}</td>
            <td><fmt:formatDate value="${product.creadted_date}" pattern="dd/MM/yyyy"/></td>
            <td><c:choose>
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
                <button class="btn btn-primary btn-edit" data-id="${product.id_product}">Sửa</button>
                <form action="${pageContext.request.contextPath}/DeleteProductAdmin" method="get">
                    <button class="btn btn-danger btn-delete" data-id="${product.id_product}">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<!-- Modal popup chỉnh sửa sản phẩm -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close">×</span>
        <h2>Chỉnh sửa sản phẩm</h2>
        <form id="editProductForm" action="${pageContext.request.contextPath}/UpdateProductAdmin" method="post">
            <input type="hidden" id="edit-product-id" name="id_product">

            <div class="mb-3">
                <label for="edit-product-name" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" id="edit-product-name" name="product_name" required>
            </div>

            <div class="mb-3">
                <label for="edit-product-name" class="form-label">URL hình ảnh</label>
                <input type="text" class="form-control" id="edit-img" name="img" required>
            </div>

            <div class="mb-3">
                <label for="edit-product-description" class="form-label">Mô tả</label>
                <textarea class="form-control" id="edit-product-description" name="description" rows="4" required></textarea>
            </div>
            <div class="mb-3">
                <label for="edit-product-in-price" class="form-label">Giá nhập</label>
                <input type="number" class="form-control" id="edit-product-in-price" name="in_price" required>
            </div>
            <div class="mb-3">
                <label for="edit-product-out-price" class="form-label">Giá bán</label>
                <input type="number" class="form-control" id="edit-product-out-price" name="out_price" required>
            </div>
            <div class="mb-3">
                <label for="edit-product-quantity" class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="edit-product-quantity" name="quantity" required>
            </div>
            <div class="mb-3">
                <label for="edit-product-manufacture-date" class="form-label">Ngày nhập hàng</label>
                <input type="date" class="form-control" id="edit-product-manufacture-date" name="creadted_date"
                       required>
            </div>
            <div class="mb-3">
                <label for="edit-product-category" class="form-label">Loại sản phẩm</label>
                <select class="form-select" id="edit-product-category" name="id_category" required>
                    <option value="1">Áo</option>
                    <option value="2">Quần</option>
                    <option value="3">Phụ kiện</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Xác nhận</button>
            <button type="button" class="btn btn-secondary close-button">Hủy</button>
        </form>
    </div>
</div>
<script src="../js/products_admin.js"></script>

<!-- Footer -->
<c:import url="../viewshare/Footer.jsp"/>
</body>
</html>
