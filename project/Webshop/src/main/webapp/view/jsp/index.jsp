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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/navbar.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>

<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<div id="cookie-banner">
    <p><fmt:message key="cookie_front"/>
        <br> <fmt:message key="cookie_middle"/></p>
    <form method="get" action="${pageContext.request.contextPath}/CookieConsentS">
        <button id="accept-cookie-btn" name="consent" value="true"><fmt:message key="cookie_yes"/></button>
        <button id="reject-cookie-btn" name="consent" value="false"><fmt:message key="cookie_no"/></button>
    </form>
</div>

<%--Slider--%>
<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" style="width: 100vw; margin-left: calc(-50vw + 50%); margin-top: 70px">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class="active"
                    aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <a href="${pageContext.request.contextPath}/ProductCategory?action=all">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg1.png?v=2476"
                         class="d-block w-100 custom-img" alt="Slider 1">
                </a>

            </div>
            <div class="carousel-item active">
                <a href="${pageContext.request.contextPath}/ProductCategory?action=all">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg2.png?v=2476"
                         class="d-block w-100 custom-img" alt="Slider 2">
                </a>
            </div>
            <div class="carousel-item">
                <a href="${pageContext.request.contextPath}/ProductCategory?action=all">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/woinsliderimg1.png?v=2476"
                         class="d-block w-100 custom-img" alt="Slider 3">
                </a>
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


<div class="main-content">
    <div class="title"><fmt:message key="index_colec"/></div>

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
                <a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="2"/></c:url>" class="nav-link px-2 link-body-emphasis">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg1.png?v=2334"
                         style="width: 100%;" alt=""></a>

            </div>
            <div>
                <a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="2"/></c:url>" class="nav-link px-2 link-body-emphasis">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg4.png?v=2334"
                                                            style="width: 100%;" alt=""></a>

            </div>
        </div>
        <div id="center">
            <div>
               <a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="1"/></c:url>" class="nav-link px-2 link-body-emphasis">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg2.png?v=2334"
                         style="width: 100%;" alt="">
                    </a>

            </div>
            <div>
                <a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="1"/></c:url>" class="nav-link px-2 link-body-emphasis">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg5.png?v=2334"
                         style="width: 100%;" alt="">
                </a>

            </div>
        </div>
        <div id="right">
            <div>
                <a href="<c:url value="/ProductCategory"><c:param name="action" value="all"/></c:url>"
                   class="nav-link px-2 link-secondary"><img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg3.png?v=2334"
                                                             style="width: 100%;" alt=""></a>

            </div>
            <div>
                <a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="3"/></c:url>" class="nav-link px-2 link-body-emphasis">
                    <img src="https://theme.hstatic.net/200000677367/1001276449/14/drlifestiimimg6.png?v=2334"
                         style="width: 100%;" alt=""></a>

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
