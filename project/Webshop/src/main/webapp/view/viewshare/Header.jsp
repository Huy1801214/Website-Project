<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 11/28/2024
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/navbar.css">
</head>
<body>
<header id="header" class="header">
    <div>
        <div class="top-bar">
            <div class="left-section">
                <div class="contact-info">
                    22130099@gmail.com | Hotline: 123 456 789
                </div>
            </div>
            <div class="center-section">
                <div class="promotions">
                    Đơn từ 300k - Tặng Tote | Đơn từ 499k - Tặng Figure | Đơn từ 799k - Tặng Áo thun trơn | Đơn từ
                    1,199k - Tặng Figure + Áo thun trơn
                </div>
            </div>
            <div class="right-section">
                <div class="search-bar">
                    <label>
                        <input type="text" placeholder="Tìm kiếm...">
                    </label>
                    <button><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="navbar">
    <div class="logo">
        <img alt="Company Logo" height="50" src="#" width="50"/>
    </div>
    <div class="nav-links">
        <a href="#">ALL</a>
        <a href="#">MỚI NHẤT</a>
        <a href="#">ÁO THUN<i class="fas fa-caret-down"></i></a>
        <a href="#">BABY TEE &amp; VÁY</a>
        <a href="#">POLO &amp; SƠ MI</a>
        <a href="#">ÁO KHOÁC</a>
        <a href="#">QUẦN</a>
        <a href="#">PHỤ KIỆN</a></div>
    <div class="nav-icons">
        <a href="#"><i class="fas fa-user"></i>Đăng nhập</a>
        <a href="#"><i class="fas fa-shopping-bag"></i>0</a>
    </div>
</div>
</body>
</html>
