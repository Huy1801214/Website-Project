<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/11/2024
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="../css/reset_pass.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<!-- Header-->
<div><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<!-- Body -->
<h2>Đổi mật khẩu</h2>
<div class="reset-form">
    <form action="${pageContext.request.contextPath}/ResetPass.java" method="post">
        <input type="text" placeholder="Nhập mật khẩu mới của bạn" name="password" required="required">
        <input type="text" placeholder="Nhập lại mật khẩu mới của bạn" name="confirmPassword" required="required">
        <button>Đổi mật khẩu</button>
    </form>
</div>

<!-- end body -->

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
</body>
</html>
