<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title><fmt:message key="product_details_title"/></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/product.css">
    <meta name="viewport" content="width=device-width">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
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
        <div class="price"><fmt:formatNumber value="${product.out_price}" pattern="#,###"/>₫</div>

        <!-- Màu -->
        <div><fmt:message key="product_color"/></div>
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
        <div><fmt:message key="product_size"/></div>
        <div class="size-buttons">
            <c:forEach var="option" items="${options}">
                <c:if test="${not empty option.size}">
                    <button class="size-button" data-size="${option.size}"
                            onclick="selectSize(this)">${option.size}</button>
                </c:if>
            </c:forEach>
        </div>
        <div>
            <button class="buy-button"><fmt:message key="buy_now"/></button>
            <button class="add-button"><fmt:message key="add_to_cart"/></button>
        </div>
        <div class="accordion">
            <div class="accordion-header"><fmt:message key="product_infor"/></div>
            <div class="accordion-content">
                <div>
                    ${product.description};
                </div>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header"><fmt:message key="product_size_guide"/></div>
            <div class="accordion-content">
                <p><fmt:message key="product_size_guide_des"/></p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header"><fmt:message key="delivery_policy"/></div>
            <div class="accordion-content">
                <p><fmt:message key="delivery_policy_des"/></p>
            </div>
        </div>
        <div class="accordion">
            <div class="accordion-header"><fmt:message key="return_policy"/></div>
            <div class="accordion-content">
                <p><fmt:message key="return_policy_des"/></p>
            </div>
        </div>
    </div>
</div>
<div class="title" style="margin-left: 20px; text-align: center;"><fmt:message key="suggest_for_you"/></div>
<div class="product-container">
    <div class="product">
        <c:forEach var="suggestedProduct" items="${suggestedProducts}">
            <div>
                <a href="<c:url value="/Ct_product"><c:param name="id_product" value="${suggestedProduct.id_product}"/></c:url>">
                    <img src="${suggestedProduct.img}" alt="${suggestedProduct.product_name}"
                         style="width: 270px; height: 300px">
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