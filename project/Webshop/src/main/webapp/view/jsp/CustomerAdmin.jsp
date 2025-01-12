<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 1/12/2025
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/products_admin.css">
    <title>Quản lý khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
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
<h2>Quản lý khách hàng</h2>
<div class="search-add-container">
    <form action="#" class="search-form">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Nhập mã khách hàng" name="search">
            <button class="btn btn-primary" type="button">Tìm kiếm</button>
        </div>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>Mã khách hàng</th>
        <th>Tên khách hàng</th>
        <th>Email</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.id_user}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.phone_num}</td>
            <td>${user.address}</td>
            <td>
                <button class="btn btn-primary btn-edit btn-custom-dark" data-id="${user.id_user}">Xem chi tiết</button>
                <form action="${pageContext.request.contextPath}/DeleteCustomerAdmin" method="get">
                    <button class="btn btn-danger btn-delete btn-custom-gray" data-id="${user.id_user}">Xóa</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="../js/products_admin.js"></script>
<!-- Footer -->
<c:import url="../viewshare/Footer.jsp"/>
</body>
</html>
