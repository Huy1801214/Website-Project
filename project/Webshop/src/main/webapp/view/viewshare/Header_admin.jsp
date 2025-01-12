<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/2/2024
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/header_admin.css">
    <title>Title</title>
</head>
<body>
<div class="navbar">
    <div class="logo">
        <img alt="Company Logo" height="50" src="#" width="50"/>
    </div>
    <div class="nav-links">
        <a href="">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/view/jsp/Overview_admin.jsp">Tổng quan</a>
        <a href="${pageContext.request.contextPath}/view/jsp/Products_admin.jsp">Sản phẩm</a>
        <a href="${pageContext.request.contextPath}/view/jsp/Banner_admin.jsp">Quản lý Banner</a>
        <a href="">Thống kê</a>
    </div>
    <div class="info-user">
        <a href="">Thông tin tài khoản</a>
    </div>
</div>
</body>
</html>
