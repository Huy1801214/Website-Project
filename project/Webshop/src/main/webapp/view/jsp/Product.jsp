<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/product.css">
    <title>Product</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
<!-- Header-->
<%--<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>--%>
<header STYLE="background-color: white">
    <div class="px-3 py-2 border-bottom">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="<c:url value="/LoadProduct"/>" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                    <img src="" alt="Company Logo" height="50"  width="50"/>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="<c:url value="/LoadProduct"/>" class="nav-link px-2 link-secondary">Home</a></li>
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
                            <a href="<c:url value="/view/jsp/account_infor.jsp"/>"><c:out
                                    value="${sessionScope.user.username}"/> <i class="fas fa-user"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value="/view/jsp/Login.jsp"/>">Đăng nhập <i class="fas fa-user"></i>
                            </a>
                        </c:otherwise>
                    </c:choose>

                    <a href="<c:url value="/view/jsp/Shopping_cart.jsp"/>"><i class="fas fa-shopping-bag"></i><span
                            id="cart-count">0</span></a>
                </div>
            </div>
        </div>
    </div>

    <div class="px-3 py-2 border-bottom mb-3">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="all"/></c:url>" class="nav-link px-2 link-secondary">ALL</a></li>
                    <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="1"/></c:url>" class="nav-link px-2 link-body-emphasis">ÁO THUN</a></li>
                    <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="2"/></c:url>" class="nav-link px-2 link-body-emphasis">QUẦN</a></li>
                    <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="3"/></c:url>" class="nav-link px-2 link-body-emphasis">PHỤ KIỆN</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
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
                <a href="<c:url value="/Ct_product"><c:param name="id_product" value="${suggestedProduct.id_product}"/></c:url>">
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