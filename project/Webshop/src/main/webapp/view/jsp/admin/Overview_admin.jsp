<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/3/2024
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/overview_admin.css">
    <meta name="viewport" content="width=device-width">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>Tổng quan</title>
</head>
<body>
<!-- Header -->
<c:import url="../../viewshare/Header_admin.jsp"/>
<!-- End Header -->

<!-- Body -->
<div class="position-relative mb-4">
    <!-- Hình nền -->
    <div style="height: 250px; background-color: #f0f0f0;">
        <img src="https://theme.hstatic.net/200000677367/1001276449/14/infbannerchimg.png?v=2476" class="w-100 h-100 object-fit-cover"
             alt="Background image">
    </div>

    <!-- Text chào mừng - đã điều chỉnh vị trí -->
    <div class="position-absolute start-0 top-50 translate-middle-y p-4 text-white">
        <h2 class="m-0">Xin chào</h2>
        <h2 class="m-0"><c:out value="${sessionScope.user.surname}"/></h2>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>Kết quả kinh doanh</h2>
        <div class="stats">
            <div class="stat stat-large">
                <h3>Doanh thu thuần</h3>
                <p>0₫</p>
            </div>
            <div class="stat">
                <h3>Tổng đơn</h3>
                <p>0</p>
            </div>
        </div>
        <div class="stats">
            <div class="stat">
                <h3>Số lượng hàng bán</h3>
                <p>0</p>
            </div>
        </div>
    </div>
</div>
<!-- End body -->
<!-- footer -->
<c:import url="../../viewshare/Footer.jsp"/>
</body>
</html>
