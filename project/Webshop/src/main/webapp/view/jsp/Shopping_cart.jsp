<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/cart.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div class="container">
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/index">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
    </div>
    <div class="cart-title">
        Shopping Cart
    </div>
    <div class="cart-content">
        <div class="cart-items">
            <c:if test="${not empty cart}">
                <c:set var="totalCartPrice" value="0"/>
                <c:forEach var="cartItem" items="${cart}">
                    <c:set var="totalItemPrice"
                           value="${cartItem.quantity * cartItem.product.out_price}"/>
                    <c:set var="totalCartPrice" value="${totalCartPrice + totalItemPrice}"/>
                    <div class="cart-item" data-price="${cartItem.product.out_price}">
                        <form action="${pageContext.request.contextPath}/remove-from-cart" method="post">
                            <input type="hidden" name="id_cart" value="${cartItem.cart.idCart}"/>
                            <button class="remove-button">
                                <i class="fas fa-times"></i>
                            </button>
                        </form>
                        <img alt="${cartItem.product.product_name}" height="100"
                             src="${cartItem.product.img}"
                             width="80"/>
                        <div class="cart-item-details">
                            <p><strong>${cartItem.product.product_name}</strong></p>
                        </div>
                        <div class="cart-item-actions">
                            <button class="quantity-button" data-action="decrease">
                                <i class="fas fa-minus"></i>
                            </button>
                            <input type="number" min="1" value="${cartItem.quantity}" class="quantity-input" disabled>
                            <button class="quantity-button" data-action="increase">
                                <i class="fas fa-plus"></i>
                            </button>
                            <p class="item-price">
                                <fmt:formatNumber value="${cartItem.product.out_price}" pattern="#,###"/>đ
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <textarea class="order-notes" placeholder="Ghi chú đơn hàng"></textarea>
            <div class="suggested-title">
                <fmt:message key="suggest_for_you"/>
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
                <button class="add-to-cart-button"><fmt:message key="add_to_cart"/></button>
            </div>
        </div>
        <div class="total-summary-container">
            <div class="total-summary">
                <p>
                    <strong>TỔNG CỘNG</strong>
                    <c:if test="${not empty cart}">
                            <span class="total-price">
                                  <fmt:formatNumber value="${totalCartPrice}" pattern="#,###"/>₫
                             </span>
                    </c:if>
                    <c:if test="${empty cart}">
                            <span class="total-price">
                                0đ
                            </span>
                    </c:if>

                </p>
                <form action="${pageContext.request.contextPath}/PaymentSer" method="get">
                    <button class="checkout-button" type="submit"><fmt:message key="checkout"/></button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
<script src="${pageContext.request.contextPath}/view/js/cart.js"></script>
</body>
</html>