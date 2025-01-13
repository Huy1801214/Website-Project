<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 1/12/2025
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Account Information</title>
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
        <h2 class="m-0">Xin chào</h2>
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
                    <span class="h5">THÔNG TIN TÀI KHOẢN</span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/UpdateCustomerAdmin" method="post">
                <input type="hidden" name="id_user" value="${requestScope.customer.id_user}">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th scope="row">Họ</th>
                        <td>
                            <input type="text" name="surname" class="form-control"
                                   value="<c:out value="${requestScope.customer.surname}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Tên</th>
                        <td>
                            <input type="text" name="lastname" class="form-control"
                                   value="<c:out value="${requestScope.customer.lastname}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Tên đăng nhập</th>
                        <td>
                            <input type="text" name="username" class="form-control"
                                   value="<c:out value="${requestScope.customer.username}"/>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Giới tính</th>
                        <td>
                            <div class="d-flex align-items-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="female"
                                           value="Nữ" ${requestScope.customer.gender == 'Nữ' ? 'checked' : ''}>
                                    <label class="form-check-label" for="female">Nữ</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="Nam"
                                    ${requestScope.customer.gender == 'Nam' ? 'checked' : ''}>
                                    <label class="form-check-label" for="male">Nam</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Email</th>
                        <td>
                            <input type="text" name="email" class="form-control"
                                   value="<c:out value="${requestScope.customer.email}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Số điện thoại</th>
                        <td>
                            <input type="text" name="phone_num" class="form-control"
                                   value="<c:out value="${requestScope.customer.phone_num}"/>">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">Địa chỉ</th>
                        <td>
                            <input type="text" name="address" class="form-control"
                                   value="<c:out value="${requestScope.customer.address}"/>">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <!-- Nút cập nhật -->
                <div class="mt-3 text-end">
                    <a href="<c:url value="/LoadCustomerAdmin"/>" class="btn btn-dark px-4">Quay lại</a>
                    <button type="submit" class="btn btn-dark px-4">Cập nhật thông tin khách hàng</button>
                </div>
            </form>

        </div>
    </div>

    <!-- Cột phải chứa lịch sử mua hàng và sản phẩm yêu thích -->
    <div class="col-md-6">
        <!-- Lịch sử mua hàng -->
        <div class="card mb-4">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                    <div>
                        <i class="bi bi-clock-history"></i>
                        <span class="h5">LỊCH SỬ MUA HÀNG</span>
                    </div>
                    <a href="#" class="text-decoration-none">Xem tất cả</a>
                </div>
                <p>Bạn chưa có đơn hàng nào. Tiếp tục mua hàng!</p>
            </div>
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
