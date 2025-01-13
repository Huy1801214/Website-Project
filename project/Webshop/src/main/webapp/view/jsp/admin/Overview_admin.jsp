<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/3/2024
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/overview_admin.css">
    <title>Tổng quan</title>
</head>
<body>
<!-- Header -->
<c:import url="../../viewshare/Header_admin.jsp"></c:import>
<!-- End Header -->

<!-- Body -->
<div class="container">
    <div class="card">
        <h2>Kết quả kinh doanh</h2>
        <div class="stats">
            <div class="stat stat-large">
                <h3>Doanh thu thuần</h3>
                <p>0₫</p>
            </div>
            <div class="stat">
                <h3>Tổng đơn</h3>
                <p>0</p>
            </div>
            <div class="stat">
                <h3>Chưa thanh toán</h3>
                <p>0</p>
            </div>
        </div>
        <div class="stats">
            <div class="stat">
                <h3>Số lượng hàng bán</h3>
                <p>0</p>
            </div>
            <div class="stat">
                <h3>Chưa giao</h3>
                <p>0</p>
            </div>
            <div class="stat">
                <h3>Đang giao</h3>
                <p>0</p>
            </div>
            <div class="stat">
                <h3>Hủy</h3>
                <p>0</p>
            </div>
        </div>
    </div>
    <div class="chart">
        <h2>Biểu đồ doanh thu</h2>
    </div>
</div>
<!-- End body -->
<!-- footer -->
<c:import url="../../viewshare/Footer.jsp"></c:import>
</body>
</html>
