<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/payment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <title><fmt:message key="checkout"/></title>
</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->
<div class="container">
    <main class="checkout-page">
        <section class="shipping-info" id="shipping-section">
            <div class="checkout-header">
                <h1>SOUSTATE</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/ViewCart"><fmt:message key="shopping_cart"/></a>
                    <span>></span>
                    <a href="#" class="active" class="breadcrumb-shipping"><fmt:message key="delivery_info"/></a>
                    <span>></span>
                    <a href="#" class="breadcrumb-payment"><fmt:message key="payment_method"/></a>
                </nav>
            </div>

            <h2><fmt:message key="delivery_info"/></h2>
            <div class="user-info">
                <i class="fas fa-user"></i>
                <div class="user-info-text">
                    <span>Anh Huy (ttahuy1801@gmail.com)</span>
                    <a href="#">Đăng xuất</a>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/place-order" method="post">
                <div class="form-group">
                    <label for="name"><fmt:message key="name"/></label>
                    <input type="text" id="name" name="name" value="Anh Huy" required>
                </div>
                <div class="form-group">
                    <label for="phone"><fmt:message key="phone_number"/></label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="address"><fmt:message key="address"/></label>
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
                        <a href="${pageContext.request.contextPath}/ViewCart"><fmt:message key="shopping_cart"/></a>
                    </div>
                    <button class="next-button" id="next-to-payment"><fmt:message key="next_to_payment"/></button>
                </div>
            </form>
        </section>
        <section class="payment-info" id="payment-section" style="display:none;">
            <div class="checkout-header">
                <h1>SOUSTATE</h1>
                <nav>
                    <a href="${pageContext.request.contextPath}/ViewCart"><fmt:message key="shopping_cart"/></a>
                    <span>></span>
                    <a href="#" class="breadcrumb-shipping"><fmt:message key="delivery_info"/></a>
                    <span>></span>
                    <a href="#" class="active" class="breadcrumb-payment"><fmt:message key="payment_method"/></a>
                </nav>
            </div>
            <h2><fmt:message key="shipping_method"/></h2>
            <div class="shipping-methods">
                <label>
                    <input type="radio" name="shipping-method" value="free" checked>
                    <span><fmt:message key="free_ship_order_from"/> 500K</span>
                    <span class="price">0đ</span>
                </label>
            </div>
            <h2><fmt:message key="payment_method"/></h2>
            <div class="payment-methods">
                <label>
                    <input type="radio" name="pay_method" value="1" checked>
                    <img src="${pageContext.request.contextPath}/view/image/momo.png" alt="Ví MoMo">
                    <span><fmt:message key="momo"/></span>
                </label>
                <label>
                    <input type="radio" name="pay_method" value="2">
                    <img src="${pageContext.request.contextPath}/view/image/momo-paylater.png" alt="Ví Trả Sau - MoMo">
                    <span><fmt:message key="momo_paylater"/></span>
                </label>
                <label>
                    <input type="radio" name="pay_method" value="3">
                    <img src="${pageContext.request.contextPath}/view/image/cod.png"
                         alt="Thanh toán khi giao hàng (COD)">
                    <span><fmt:message key="cod"/></span>
                </label>
            </div>
            <div class="payment-footer">
                <div class="back-to-cart">
                    <a href="${pageContext.request.contextPath}/ViewCart"><fmt:message key="shopping_cart"/></a>
                </div>
                <form action="${pageContext.request.contextPath}/OrderSer" method="post">
                    <button type="submit" class="next-button" id="complete-order"><fmt:message key="place_order"/></button>
                </form>
            </div>
        </section>
        <section class="order-summary">
            <c:if test="${not empty cart}">
                <c:set var="totalCartPrice" value="0"/>
                <c:forEach var="cartItem" items="${cart}">
                    <c:set var="totalItemPrice"
                           value="${cartItem.quantity * cartItem.product.out_price}"/>
                    <c:set var="totalCartPrice" value="${totalCartPrice + totalItemPrice}"/>
                    <div class="item">
                        <img src="${cartItem.product.img}" alt="${cartItem.product.product_name}">
                        <div class="item-info">
                            <h3>${cartItem.product.product_name}</h3>
                        </div>
                        <span class="price"><fmt:formatNumber value="${cartItem.product.out_price}"
                                                              pattern="#,###"/>đ</span>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty cart}">
                <p><fmt:message key="no_product_in_cart"/></p>
            </c:if>
            <div class="discount">
                <input type="text" placeholder="<fmt:message key="discount_code"/>">
                <button><fmt:message key="apply"/></button>
            </div>
            <div class="summary-info">
                <div class="subtotal">
                    <span><fmt:message key="subtotal"/></span>
                    <c:if test="${not empty cart}">
                        <span class="price"><fmt:formatNumber value="${totalCartPrice}" pattern="#,###"/>đ</span>
                    </c:if>
                    <c:if test="${empty cart}">
                        <span class="price">0đ</span>
                    </c:if>
                </div>
                <div class="shipping">
                    <span><fmt:message key="shipping_fee"/></span>
                    <span class="price"><fmt:message key="free"/></span>
                </div>
                <div class="total">
                    <span><fmt:message key="total_price"/></span>
                    <c:if test="${not empty cart}">
                        <span class="price"><fmt:formatNumber value="${totalCartPrice}" pattern="#,###"/>đ</span>
                    </c:if>
                    <c:if test="${empty cart}">
                        <span class="price">0đ</span>
                    </c:if>
                </div>
            </div>
        </section>
        </form>
    </main>
</div>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="${pageContext.request.contextPath}/view/js/payment.js"></script>
</body>
</html>