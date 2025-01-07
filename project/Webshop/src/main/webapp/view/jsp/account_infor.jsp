<%--
  Created by IntelliJ IDEA.
  User: LAPTOP USA PRO
  Date: 06-01-2025
  Time: 5:09 PM
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
<body>
<!-- Header với hình nền -->
<div class="position-relative mb-4">
    <!-- Hình nền -->
    <div style="height: 250px; background-color: #f0f0f0;">
        <img src="../img/product_01.png" class="w-100 h-100 object-fit-cover" alt="Background image">
    </div>

    <!-- Text chào mừng - đã điều chỉnh vị trí -->
    <div class="position-absolute start-0 top-50 translate-middle-y p-4 text-white">
        <h2 class="m-0">Xin chào</h2>
        <h2 class="m-0">Nguyễn Phi</h2>
    </div>
</div>

<!-- Container chính của trang -->
<div class="container mt-4" style="margin: 1.5rem 6rem 3rem;">
    <div class="row">
        <!-- Cột trái chứa thông tin tài khoản và danh sách địa chỉ -->
        <div class="col-md-6">
            <!-- Thông tin tài khoản -->
            <div class="card mb-4">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                        <div>
                            <i class="bi bi-person"></i>
                            <span class="h5">THÔNG TIN TÀI KHOẢN</span>
                        </div>
                        <a href="#" class="text-decoration-none" data-bs-toggle="modal"
                           data-bs-target="#updateInfoModal">Chỉnh sửa</a>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-2">
                            <div class="text-muted">Họ</div>
                            <div class="text-nowrap fw-bold">Nguyễn</div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <div class="text-muted">Giới tính</div>
                            <div class="text-nowrap fw-bold">Nam</div>
                        </div>
                        <div class="col-md-4"></div>
                    </div>

                    <div class="row mb-2">
                        <div class="col-md-2">
                            <div class="text-muted">Tên</div>
                            <div class="text-nowrap fw-bold">Phi</div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <div class="text-muted">Sinh nhật</div>
                            <div class="text-nowrap fw-bold">06/04/2004</div>
                        </div>
                        <div class="col-md-4"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-2">
                            <div class="text-muted">Email</div>
                            <div class="text-nowrap fw-bold">phinguyen06042004@gmail.com</div>
                        </div>
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <div class="text-muted">Số điện thoại</div>
                            <div class="text-nowrap fw-bold">0793052019</div>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                </div>
            </div>

            <!-- Danh sách địa chỉ -->
            <div class="card mb-4">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                        <div>
                            <i class="bi bi-truck"></i>
                            <span class="h5">DANH SÁCH ĐỊA CHỈ</span>
                        </div>
                        <a href="#" class="text-decoration-none">Xem tất cả</a>
                    </div>

                    <div class="p-3 border rounded">
                        <div class="d-flex justify-content-between">
                            <div>
                                <strong>Nguyễn Phi -</strong>
                                <div>, Vietnam</div>
                            </div>
                            <span class="text-primary">Mặc định</span>
                        </div>
                    </div>
                </div>
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

            <!-- Sản phẩm yêu thích -->
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom">
                        <div>
                            <i class="bi bi-heart"></i>
                            <span class="h5">SẢN PHẨM YÊU THÍCH</span>
                        </div>
                        <a href="#" class="text-decoration-none">Xem tất cả</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Nút đăng xuất -->
    <div class="mt-4 text-end">
        <form action="${pageContext.request.contextPath}/Logout" method="post">
        <button class="btn btn-outline-dark px-4">ĐĂNG XUẤT</button>
        </form>
    </div>
</div>

<!-- Modal Cập nhật thông tin -->
<div class="modal fade" id="updateInfoModal" tabindex="-1" aria-labelledby="updateInfoModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="updateInfoModalLabel">CẬP NHẬT THÔNG TIN</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <!-- Họ -->
                    <div class="mb-3">
                        <label class="form-label">Họ</label>
                        <input type="text" class="form-control" value="Nguyễn">
                    </div>

                    <!-- Tên -->
                    <div class="mb-3">
                        <label class="form-label">Tên</label>
                        <input type="text" class="form-control" value="Phi">
                    </div>

                    <!-- Giới tính -->
                    <div class="mb-3">
                        <label class="form-label">Giới tính</label>
                        <div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female">
                                <label class="form-check-label" for="female">Nữ</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" checked>
                                <label class="form-check-label" for="male">Nam</label>
                            </div>
                        </div>
                    </div>

                    <!-- Ngày sinh -->
                    <div class="mb-3">
                        <label class="form-label">Ngày sinh (DD/MM/YYYY)</label>
                        <input type="text" class="form-control" value="06/04/2004">
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" value="phinguyen06042004@gmail.com">
                    </div>

                    <!-- Số điện thoại -->
                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <input type="tel" class="form-control">
                    </div>

                    <!-- Tỉnh/Thành phố -->
                    <div class="mb-3">
                        <label class="form-label">Chọn Tỉnh/Thành phố</label>
                        <select class="form-select">
                            <option selected>Tỉnh/Thành phố</option>
                            <option>Hà Nội</option>
                            <option>Tp.Hồ Chí Minh</option>
                            <option>Đồng Nai</option>
                        </select>
                    </div>

                    <!-- Quận/Huyện -->
                    <div class="mb-3">
                        <label class="form-label">Chọn Quận/Huyện</label>
                        <select class="form-select">
                            <option selected>Quận/Huyện</option>
                            <option>Long Bình Tân</option>
                            <option>An Bình</option>
                            <option>Thành phố Biên Hoà</option>
                        </select>
                    </div>

                    <!-- Địa chỉ -->
                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <input type="text" class="form-control" placeholder="Địa chỉ">
                    </div>

                    <!-- Nút cập nhật -->
                    <button type="submit" class="btn btn-dark w-100">Cập nhật</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->

<script src="${pageContext.request.contextPath}/view/js/cookie.js"></script>
</html>
