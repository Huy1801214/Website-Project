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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<style>
    .custom-img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* Đảm bảo hình ảnh bao phủ toàn bộ không gian */
        aspect-ratio: 16/9; /* Đặt tỷ lệ khung hình tương tự như SVG */
    }
</style>
<body>
<!-- Header-->
<%--<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>--%>
<!-- End Header-->

<div id="cookie-banner">
    <p>Chúng tôi sử dụng cookie để cung cấp trải nghiệm duyệt web mượt mà, cá nhân hóa nội dung,
        <br> cải thiện trang web của chúng tôi,
        và thực hiện các điều khác được mô tả trong <a href="#">Chính sách cookie</a>.</p>
    <button id="accept-cookie-btn">Đồng ý</button>
    <button id="reject-cookie-btn">Không đồng ý</button>
</div>

<header class="p-3 mb-3 border-bottom">
    <div class="container" style="border-bottom: solid thick black; padding-bottom: 10px">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="${pageContext.request.contextPath}/LoadProduct" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <img src="" alt="Company Logo" height="50"  width="50"/>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="${pageContext.request.contextPath}/LoadProduct" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Shop</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Features</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">About</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="${pageContext.request.contextPath}/SearchProduct" method="get">
                <div class="position-relative">
                    <input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search" style="padding-right: 40px;">
                    <i class="bi bi-search position-absolute top-50 end-0 translate-middle-y me-3" style="pointer-events: none; color: gray;"></i>
                </div>
            </form>


            <div class="nav-icons">
                <%-- Hiển thị username nếu có user trong session --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/view/jsp/account_infor.jsp"><c:out
                                value="${sessionScope.user.username}"/> <i class="fas fa-user"></i></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/view/jsp/Login.jsp">Đăng nhập <i class="fas fa-user"></i>
                        </a>
                    </c:otherwise>
                </c:choose>

                <a href="${pageContext.request.contextPath}/view/jsp/Shopping_cart.jsp"><i class="fas fa-shopping-bag"></i><span
                        id="cart-count">0</span></a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="${pageContext.request.contextPath}/ProductCategory?action=all" class="nav-link px-2 link-secondary">ALL</a></li>
                <li><a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=1" class="nav-link px-2 link-body-emphasis">ÁO THUN</a></li>
                <li><a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=2" class="nav-link px-2 link-body-emphasis">QUẦN</a></li>
                <li><a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=3" class="nav-link px-2 link-body-emphasis">PHỤ KIỆN</a></li>
            </ul>
        </div>
    </div>
</header>

<div class="container">
    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active"
                    aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg1.png?v=2476" class="d-block w-100 custom-img" alt="Slider 1">
            </div>
            <div class="carousel-item active">
                <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg2.png?v=2476" class="d-block w-100 custom-img" alt="Slider 2">
            </div>
            <div class="carousel-item">
                <img src="https://theme.hstatic.net/1000197303/1001046599/14/popup_banner.jpg?v=10329" class="d-block w-100 custom-img" alt="Slider 2">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<div class="main-content">
    <div class="title">COLLECTIONS</div>

    <div class="slideshow-container">
        <div class="slides">
            <!-- hiện sản phẩm -->
            <c:forEach var="product" items="${products}">
                <div class="slide">
                    <!-- giống response.encodeURL -->
                    <a href="<c:url value="/Ct_product"><c:param name="id_product" value="${product.id_product}"/></c:url>">
                        <img src="${product.img}" style="width: 270px; height: 300px;" alt=""/>
                    </a>
                    <div class="product_infor">
                        <div class="product_name">${product.product_name}</div>
                        <div class="product_price">
                            <div><fmt:formatNumber value="${product.out_price}" type="currency" currencySymbol="đ"
                                                   maxFractionDigits="0"/></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button class="prev-button"><</button>
        <button class="next-button">></button>
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
</div>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->

<script src="${pageContext.request.contextPath}/view/js/cookie.js"></script>
<script src="${pageContext.request.contextPath}/view/js/index.js"></script>
</body>
</html>
