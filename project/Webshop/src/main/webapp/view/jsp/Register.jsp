<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 11/28/2024
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/register.css">
</head>
<body>
<!-- Header -->
<div><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header -->
<div class="form-container">
    <h2>Đăng Ký</h2>
    <input placeholder="Họ" type="text"/>
    <input placeholder="Tên" type="text">
    <div class="gender">
        <input id="female" name="gender" type="radio"/>
        <label for="female">Nữ</label>
        <input id="male" name="gender" type="radio"/>
        <label for="male">Nam</label>
    </div>
    <input placeholder="mm/dd/yyyy" type="date"/>
    <input placeholder="Email" type="email"/>
    <input placeholder="Mật khẩu" type="password"/>

    <button>ĐĂNG KÝ</button>
    <a class="back-link" href="#"><i class="fas fa-arrow-left"></i>Quay lại trang chủ</a>
</div>

<!-- Footer -->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer -->
</body>
</html>
