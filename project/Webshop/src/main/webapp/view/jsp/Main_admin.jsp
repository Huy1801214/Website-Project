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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/main_admin.css">
    <title>Tổng quan</title>
</head>
<body>
    <c:import url="../viewshare/Header_admin.jsp"></c:import>
    <h2>Quản lý sản phẩm</h2>
    <div class="search-add-container">
        <form action="search" class="search-form">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Nhập mã sản phẩm" name="search">
                <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                <button class="btn btn-warning btn-add">Thêm sản phẩm</button>
            </div>
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
</body>
</html>
