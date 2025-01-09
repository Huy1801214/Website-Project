<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 11/28/2024
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
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
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Shop</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Features</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">About</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="${pageContext.request.contextPath}/SearchProduct" method="get">
                <input class="form-control me-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
            </form>

            <div class="text-end">
                <button type="button" class="btn btn-outline-primary me-2">Login</button>
                <button type="button" class="btn btn-primary">Sign-up</button>
            </div>
        </div>
    </div>
</header>

<div class="navbar">
    <div class="logo">
        <a href="${pageContext.request.contextPath}/LoadProduct"><img alt="Company Logo" height="50" src="#"
                                                                      width="50"/></a>
    </div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/ProductCategory?action=all">ALL</a>
        <a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=1">ÁO THUN</a>
        <a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=2">QUẦN</a>
        <a href="${pageContext.request.contextPath}/ProductCategory?action=category&id_category=3">PHỤ KIỆN</a></div>
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
<script src="../js/header.js"></script>
</body>
</html>
