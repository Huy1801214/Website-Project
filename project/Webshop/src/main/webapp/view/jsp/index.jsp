<%--
  Created by IntelliJ IDEA.
  User: LAPTOP USA PRO
  Date: 05-12-2024
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/cookie.css">
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div id="cookie-banner">
    <p>Chúng tôi sử dụng cookie để cung cấp trải nghiệm duyệt web mượt mà, cá nhân hóa nội dung,
        <br> cải thiện trang web của chúng tôi,
        và thực hiện các điều khác được mô tả trong <a href="#">Chính sách cookie</a>.</p>
    <button id="accept-cookie-btn">Đồng ý</button>
    <button id="reject-cookie-btn">Không đồng ý</button>
</div>

<div id="product_advertising">
    <a href="#">
        <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg1.png?v=2334"
             style="width: 100%;" alt="">
    </a>
</div>
<div class="main-content">
    <div class="title">NEW IN</div>
    <div class="product">
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/161_da22d96f39a94e88984ef4f014ccc164_master.jpg"
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
            </a>
            <div class="product_infor">
                <div class="product_name">THE STAR BOXY HOODIE</div>
                <div class="product_price">
                    <div>579,000₫</div>
                    <div class="old_price_product">650,000₫</div>
                </div>
            </div>
        </div>
    </div>

    <div id="everyday_art">
        <div>
            <img src="https://theme.hstatic.net/200000677367/1001276449/14/infbannerchimg.png?v=2334"
                 style="width: 100%;" alt="">
        </div>
        <div>
            MATCHING' new drops <br>
            Matching outfits, a cart full of goodies, and the joy of preparing the home. <br> The holidays bringing us
            closer
        </div>
    </div>

    <div id="made_different">
        <div class="title">MADE DIFFERENT</div>
        <div id="left">
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg1.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg4.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
        </div>
        <div id="center">
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg2.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg5.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
        </div>
        <div id="right">
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg3.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
            <div>
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg6.png?v=2334"
                     style="width: 100%;" alt="">
            </div>
        </div>
    </div>

    <div class="title">TRENDING NOW</div>
    <div class="product">
        <div>
            <a href="Product.jsp">
                <img src="https://product.hstatic.net/200000677367/product/161_da22d96f39a94e88984ef4f014ccc164_master.jpg"
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
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
                     style="width: 100%;" alt="">
            </a>
            <div class="product_infor">
                <div class="product_name">THE STAR BOXY HOODIE</div>
                <div class="product_price">
                    <div>579,000₫</div>
                    <div class="old_price_product">650,000₫</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->

<script src="${pageContext.request.contextPath}/view/js/cookie.js"></script>
</body>
</html>
