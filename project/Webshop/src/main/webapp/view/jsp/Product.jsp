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
        <div class="title">${product.product_name}</div>
        <div class="price"><fmt:formatNumber value="${product.out_price}" pattern="#,###"/>đ</div>
        <div>Màu sắc</div>
        <div class="color-selector">
            <c:forEach var="option" items="${options}">
                <c:if test="${not empty option.color}">
                    <input type="radio" name="color" value="${option.color}">
                </c:if>
            </c:forEach>
        </div>
        <div>Kích thước</div>
        <div class="size-buttons">
            <button>M</button>
            <button>L</button>
        </div>
        <div>
            <button class="buy-button">MUA NGAY</button>
            <button class="add-button">THÊM VÀO GIỎ</button>
        </div>
        <div class="accordion">
            <div class="accordion-header">Thông tin sản phẩm</div>
            <div class="accordion-content">
                <div>Màu sắc: Đen/Xám</div>
                <div>Form: Ống rộng</div>
                <div>Size: M/L</div>
                <div>Chất liệu: Cotton (nỉ bông), 350gsm</div>
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
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/161_da22d96f39a94e88984ef4f014ccc164_master.jpg"
                     alt="Product 1">
            </a>
            <div class="product_infor">
                <div class="product_name">REBOOT THE PROGRAM BIG BOXY T-SHIRT</div>
                <div class="product_price">
                    <div>329,000₫</div>
                    <div class="old_price_product">390,000₫</div>
                </div>
            </div>
        </div>
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/175_cca8e55234c7438d959f838601f48428_master.jpg"
                     alt="Product 2">
            </a>
            <div class="product_infor">
                <div class="product_name">SS NO.2 BIG BOXY SHIRT</div>
                <div class="product_price">
                    <div>439,000₫</div>
                    <div class="old_price_product">450,000₫</div>
                </div>
            </div>
        </div>
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/173_b2b86a9beac3495ba2e60d2df56c27c3_master.jpg"
                     alt="Product 3">
            </a>
            <div class="product_infor">
                <div class="product_name">SS LOGO CARGO PANTS V.2</div>
                <div class="product_price">
                    <div>599,000₫</div>
                    <div class="old_price_product">620,000₫</div>
                </div>
            </div>
        </div>
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/171_37870a0a7d364cf9a9d1cbcc82d66a41_master.jpg"
                     alt="Product 4">
            </a>
            <div class="product_infor">
                <div class="product_name">THE STAR BOXY HOODIE</div>
                <div class="product_price">
                    <div>579,000₫</div>
                    <div class="old_price_product">650,000₫</div>
                </div>
            </div>
        </div>
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/172_ae5726e7f2db411d9f6ba4fd4249a96e_master.jpg"
                     alt="Product 5">
            </a>
            <div class="product_infor">
                <div class="product_name">SS LOGO BAGGY PANTS</div>
                <div class="product_price">
                    <div>599,000₫</div>
                    <div class="old_price_product">620,000₫</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->

<script src="${pageContext.request.contextPath}/view/js/product.js"></script>
</body>
</html>