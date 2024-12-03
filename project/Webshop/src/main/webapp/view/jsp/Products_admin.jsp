<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/2/2024
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/products_admin.css">
    <title>Quản ly sản phẩm</title>
</head>
<body>
    <c:import url="../viewshare/Header_admin.jsp"></c:import>
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

            <!-- Hình ảnh -->
            <div class="mb-3">
                <label for="product-image" class="form-label">Hình ảnh</label>
                <input type="file" class="form-control" id="product-image" name="product-image" accept="image/*"
                       required>
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
                <label for="product-manufacture-date" class="form-label">Ngày sản xuất</label>
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
            <th>Mô tả</th>
            <th>Giá tiền</th>
            <th>Số lượng</th>
            <th>Ngày sản xuất</th>
            <th>Loại sản phẩm</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        </tbody>
    </table>
    <script src="../js/products_admin.js"></script>

    <!-- Footer -->
    <c:import url="../viewshare/Footer.jsp"></c:import>
</body>
</html>
