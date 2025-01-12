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
    <div class="container" style="border-bottom: solid thick black; padding-bottom: 10px">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="<c:url value="/LoadProduct"/>" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <img src="" alt="Company Logo" height="50"  width="50"/>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="<c:url value="/LoadProduct"/>" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="all"/></c:url>" class="nav-link px-2 link-body-emphasis">Shop</a></li>
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

    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="all"/></c:url>" class="nav-link px-2 link-secondary">ALL</a></li>
                <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="1"/></c:url>" class="nav-link px-2 link-body-emphasis">ÁO</a></li>
                <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="2"/></c:url>" class="nav-link px-2 link-body-emphasis">QUẦN</a></li>
                <li><a href="<c:url value="/ProductCategory"><c:param name="action" value="category"/>
                <c:param name="id_category" value="3"/></c:url>" class="nav-link px-2 link-body-emphasis">PHỤ KIỆN</a></li>
            </ul>
        </div>
    </div>
</header>

<script src="../js/header.js"></script>
</body>
</html>
