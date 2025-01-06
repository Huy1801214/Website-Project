<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/login.css">
    <script src="${pageContext.request.contextPath}/view/js/login.js" defer></script>
</head>
<body>
<!-- Header-->
<div id="header-container"><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<!-- Body-->
<div class="login-container">
    <h2 id="form-title">Đăng Nhập</h2>
    <form id="login-form" method="post" action="${pageContext.request.contextPath}/Login">
        <c:if test="${ not empty error}">
            <p style="color: red">${error}</p>
        </c:if>
        <input type="email" id="email" name="email" placeholder="Email" required><br><br>
        <input type="password" id="password" name="password" placeholder="Password" required><br><br>
        <button type="submit">Đăng nhập</button>
    </form>

    <form id="recovery-form" action="${pageContext.request.contextPath}/ForgetPass" method="post">
        <c:if test="${ not empty errorMessage}">
            <p style="color: red">${errorMessage}</p>
        </c:if>
        <label for="recovery-email">Nhập email của bạn:</label><br>
        <input type="email" id="recovery-email" name="recovery-email" required><br><br>
        <button type="submit">Gửi yêu cầu phục hồi</button>
    </form>
    <p>
        <a href="#" onclick="toggleForms(); return false;" class="forget-pass">Quên mật khẩu?</a> |
        <a href="${pageContext.request.contextPath}/view/jsp/Register.jsp" class="register">Đăng ký</a>
    </p>
</div>

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
</body>
</html>
