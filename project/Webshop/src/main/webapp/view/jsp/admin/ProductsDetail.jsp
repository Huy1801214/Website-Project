<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title><fmt:message key="product_details_title"/></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/cookie.css">
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
<div id="header-container">
    <c:import url="/view/viewshare/Header.jsp"/>
</div>
<!-- End Header-->

<!-- Header với hình nền -->
<div class="position-relative mb-4">
    <!-- Hình nền -->
    <div style="height: 250px; background-color: #f0f0f0;">
        <img src="${pageContext.request.contextPath}/view/img/product_01.png" class="w-100 h-100 object-fit-cover"
             alt="Background image">
    </div>

    <!-- Text chào mừng - đã điều chỉnh vị trí -->
    <div class="position-absolute start-0 top-50 translate-middle-y p-4 text-white">
        <h2 class="m-0"><fmt:message key="hello"/></h2>
        <h2 class="m-0"><c:out value="${sessionScope.user.surname}"/></h2>
    </div>
</div>

<!-- Container chính của trang -->
<div class="container mt-4" style="margin: 1.5rem 6rem 3rem;">
    <div class="card mb-4">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                <div>
                    <i class="bi bi-person"></i>
                    <span class="h5"><fmt:message key="product_infor"/></span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/UpdateProductAdmin" method="post">
                <input type="hidden" name="id_product" value="${requestScope.product.id_product}">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th scope="row"><fmt:message key="product_name"/></th>
                        <td>
                            <input type="text" name="product_name" class="form-control"
                                   value="<c:out value="${requestScope.product.product_name}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="image"/></th>
                        <td>
                            <input type="text" name="img" class="form-control"
                                   value="<c:out value="${requestScope.product.img}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="product_description"/></th>
                        <td>
                            <input type="text" name="description" class="form-control"
                                   value="<c:out value="${requestScope.product.description}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="in_price"/></th>
                        <td>
                            <input type="number" name="in_price" class="form-control"
                                   value="<c:out value="${requestScope.product.in_price}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="out_price"/></th>
                        <td>
                            <input type="number" name="out_price" class="form-control"
                                   value="<c:out value="${requestScope.product.out_price}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="quantity"/></th>
                        <td>
                            <input type="number" name="quantity" class="form-control"
                                   value="<c:out value="${requestScope.product.quantity}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><fmt:message key="import_date"/></th>
                        <td>
                            <input type="date" name="creadted_date" class="form-control"
                                   value="<fmt:formatDate value="${requestScope.product.creadted_date}" pattern="yyyy-MM-dd"/>"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <!-- Nút cập nhật -->
                <div class="mt-3 text-end">
                    <a href="<c:url value="/LoadProductAdmin"/>" class="btn btn-dark px-4"><fmt:message key="back"/></a>
                    <button type="submit" class="btn btn-dark px-4"><fmt:message key="admin_product_update"/></button>
                </div>
            </form>

        </div>
    </div>

</div>
</body>
<!--Footer-->
<div>
    <c:import url="/view/viewshare/Footer.jsp"/>
</div>
<!-- End Footer-->
</html>