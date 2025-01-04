<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 1/3/2025
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/payment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Thanh toán</title>
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div class="container">
    <main class="checkout-page">

        <section class="shipping-info" id="shipping-section">
            <div class="checkout-header">
                <h1>SOUSTATE</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/view/jsp/Shopping_cart.jsp">Giỏ hàng</a>
                    <span>></span>
                    <a href="#" class="active" class="breadcrumb-shipping">Thông tin giao hàng</a>
                    <span>></span>
                    <a href="#" class="breadcrumb-payment">Phương thức thanh toán</a>
                </nav>
            </div>

            <h2>Thông tin giao hàng</h2>
            <div class="user-info">
                <i class="fas fa-user"></i>
                <div class="user-info-text">
                    <span>Anh Huy (ttahuy1801@gmail.com)</span>
                    <a href="#">Đăng xuất</a>
                </div>
            </div>
            <div class="form-group">
                <label for="name">Họ và tên</label>
                <input type="text" id="name" name="name" value="Anh Huy" required>
            </div>
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" placeholder="Nhập địa chỉ" required>
            </div>
            <div class="form-group">
                <div class="address-group">
                    <select name="province" id="province">
                        <option value="" disabled selected>Chọn tỉnh / thành</option>
                    </select>
                    <select name="district" id="district">
                        <option value="" disabled selected>Chọn quận / huyện</option>
                    </select>
                    <select name="ward" id="ward">
                        <option value="" disabled selected>Chọn phường / xã</option>
                    </select>
                </div>
            </div>
            <div class="cart-next-group">
                <div class="back-to-cart">
                    <a href="#">Giỏ hàng</a>
                </div>
                <button class="next-button" id="next-to-payment">Tiếp tục đến phương thức thanh toán</button>
            </div>

        </section>
        <section class="payment-info" id="payment-section" style="display:none;">
            <div class="checkout-header">
                <h1>SOUSTATE</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/view/jsp/Shopping_cart.jsp">Giỏ hàng</a>
                    <span>></span>
                    <a href="#" class="breadcrumb-shipping">Thông tin giao hàng</a>
                    <span>></span>
                    <a href="#" class="active" class="breadcrumb-payment">Phương thức thanh toán</a>
                </nav>
            </div>
            <h2>Phương thức vận chuyển</h2>
            <div class="shipping-methods">
                <label>
                    <input type="radio" name="shipping-method" value="free" checked>
                    <span>Free ship cho đơn hàng từ 500K</span>
                    <span class="price">0đ</span>
                </label>
            </div>
            <h2>Phương thức thanh toán</h2>
            <div class="payment-methods">
                <label>
                    <input type="radio" name="payment-method" value="momo" checked>
                    <img src="momo.png" alt="Ví MoMo">
                    <span>Ví MoMo</span>
                </label>
                <label>
                    <input type="radio" name="payment-method" value="momo-later">
                    <img src="momo-paylater.png" alt="Ví Trả Sau - MoMo">
                    <span>Ví Trả Sau - MoMo</span>
                </label>
                <label>
                    <input type="radio" name="payment-method" value="cod">
                    <img src="cod.png" alt="Thanh toán khi giao hàng (COD)">
                    <span>Thanh toán khi giao hàng (COD)</span>
                </label>
            </div>
            <div class="payment-footer">
                <div class="back-to-cart">
                    <a href="${pageContext.request.contextPath}/view/jsp/Shopping_cart.jsp">Giỏ hàng</a>
                </div>
                <button class="next-button" id="complete-order">Hoàn tất đơn hàng</button>
            </div>
        </section>
        <section class="order-summary">
            <div class="item">
                <img src="product1.jpg" alt="Product 1">
                <div class="item-info">
                    <h3>BASIC LOGO SWEATPANTS</h3>
                    <p>Flatium / M</p>
                </div>
                <span class="price">620,000đ</span>
            </div>
            <div class="item">
                <img src="product2.jpg" alt="Product 2">
                <div class="item-info">
                    <h3>[KIDS] BASIC LOGO SWEATSHORTS</h3>
                    <p>Flatium / 1</p>
                </div>
                <span class="price">320,000đ</span>
            </div>
            <div class="discount">
                <input type="text" placeholder="Mã giảm giá">
                <button>Sử dụng</button>
            </div>
            <div class="summary-info">
                <div class="subtotal">
                    <span>Tạm tính</span>
                    <span class="price">940,000đ</span>
                </div>
                <div class="shipping">
                    <span>Phí vận chuyển</span>
                    <span class="price">Miễn phí</span>
                </div>
                <div class="total">
                    <span>Tổng cộng</span>
                    <span class="price">940,000đ</span>
                </div>
            </div>
        </section>
    </main>
</div>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="../js/payment.js"></script>
</body>
</html>
