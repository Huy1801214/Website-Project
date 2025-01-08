<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/product.css">
    <title>Product</title>
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div class="infor_product">
    <div>
        <img src="${product.img}" alt="${product.product_name}" style="width: 100%;">
    </div>

    <div>
        <!-- Tên -->
        <div class="title">${product.product_name}</div>
        <div class="price"><fmt:formatNumber value="${product.out_price}" pattern="#,###"/>đ</div>

        <!-- Màu -->
        <div>Màu sắc</div>
        <div class="color-selector">
            <c:forEach var="option" items="${options}">
                <c:choose>
                    <c:when test="${not empty option.color}">
                        <input type="radio" name="color" value="${option.color}"
                               style="background-color: ${option.color};">
                    </c:when>
                    <c:otherwise>
                        <div></div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <div>Kích thước</div>
        <div class="size-buttons">
            <c:forEach var="option" items="${options}">
                <c:if test="${not empty option.size}">
                    <button class="size-button" data-size="${option.size}"
                            onclick="selectSize(this)">${option.size}</button>
                </c:if>
            </c:forEach>
        </div>
        <div>
            <button class="buy-button">MUA NGAY</button>
            <button class="add-button">THÊM VÀO GIỎ</button>
        </div>
        <div class="accordion">
            <div class="accordion-header">Thông tin sản phẩm</div>
            <div class="accordion-content">
                <div>
                    ${product.description};
                </div>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Kích thước</div>
            <div class="accordion-content">
                <p>Thông tin về kích thước sản phẩm sẽ được hiển thị tại đây.</p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Chính sách giao hàng</div>
            <div class="accordion-content">
                <p>Thông tin về chính sách giao hàng của chúng tôi sẽ được hiển thị tại đây.</p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header">Chính sách đổi trả</div>
            <div class="accordion-content">
                <p>Thông tin về chính sách đổi trả của chúng tôi sẽ được hiển thị tại đây.</p>
            </div>
        </div>
    </div>
</div>
<div class="title" style="margin-left: 20px; text-align: center;">Gợi ý cho bạn</div>
<div class="product-container">
    <div class="product">
        <c:forEach var="suggestedProduct" items="${suggestedProducts}">
            <div>
                <a href="${pageContext.request.contextPath}/Ct_product?id_product=${suggestedProduct.id_product}">
                    <img src="${suggestedProduct.img}" alt="${suggestedProduct.product_name}" style="width: 270px; height: 300px">
                </a>
                <div class="product_infor">
                    <div class="product_name">${suggestedProduct.product_name}</div>
                    <div class="product_price">
                        <div><fmt:formatNumber value="${suggestedProduct.out_price}" pattern="#,###"/>₫</div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->

<script src="${pageContext.request.contextPath}/view/js/product.js"></script>
</body>
</html>