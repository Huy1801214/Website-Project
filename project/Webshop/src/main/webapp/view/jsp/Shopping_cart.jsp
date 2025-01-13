<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/27/2024
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="../css/cart.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div class="container">
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/view/jsp/index.jsp">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/view/jsp/Shopping_cart.jsp">Giỏ hàng</a>
    </div>
    <div class="cart-title">
        Giỏ hàng
    </div>
    <div class="cart-content">
        <div class="cart-items">
            <div class="cart-item" data-price="620000">
                <button class="remove-button">
                    <i class="fas fa-times"></i>
                </button>
                <img alt="BASIC LOGO SWEATPANTS" height="100"
                     src="https://storage.googleapis.com/a1aa/image/PFL6zHpIqDpeXKTQrl9SK6DlgRBvFwVeANn4AtVdEnfFXNePB.jpg"
                     width="80"/>
                <div class="cart-item-details">
                    <p><strong>BASIC LOGO SWEATPANTS</strong></p>
                    <p>Màu sắc: Flatinum</p>
                    <p>Kích thước: M</p>
                </div>
                <div class="cart-item-actions">
                    <button class="quantity-button" data-action="decrease">
                        <i class="fas fa-minus"></i>
                    </button>
                    <input type="number" min="1" value="1" class="quantity-input">
                    <button class="quantity-button" data-action="increase">
                        <i class="fas fa-plus"></i>
                    </button>
                    <p class="item-price">
                        620,000đ
                    </p>
                </div>
            </div>
            <textarea class="order-notes" placeholder="Ghi chú đơn hàng"></textarea>
            <div class="suggested-title">
                SẢN PHẨM BẠN CÓ THỂ THÍCH
            </div>
            <div class="suggested-item">
                <img alt="BASIC LOGO SWEATPANTS" height="100"
                     src="https://storage.googleapis.com/a1aa/image/PFL6zHpIqDpeXKTQrl9SK6DlgRBvFwVeANn4AtVdEnfFXNePB.jpg"
                     width="80"/>
                <div class="suggested-item-details">
                    <p><strong>BASIC LOGO SWEATPANTS</strong></p>
                    <p>620,000đ</p>
                    <select>
                        <option>Flatinum / M</option>
                    </select>
                </div>
                <button class="add-to-cart-button">THÊM VÀO GIỎ HÀNG</button>
            </div>
        </div>
        <div class="total-summary-container">
            <div class="total-summary">
                <p>
                    <strong>TỔNG CỘNG</strong>
                    <span class="total-price">620,000đ</span>
                </p>
                <button class="checkout-button" type="submit">Thanh Toán</button>
            </div>
        </div>
    </div>
</div>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
<script src="../js/cart.js"></script>
</body>
</html>
