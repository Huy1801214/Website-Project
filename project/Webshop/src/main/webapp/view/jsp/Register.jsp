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
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
<!-- Header -->
<div><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header -->
<div class="form-container">
    <h2><fmt:message key="register_header"/></h2>
    <form action="${pageContext.request.contextPath}/Register" method="post">
        <input placeholder="<fmt:message key="surname"/>" type="text" name="surname" required="required"/>
        <input placeholder="<fmt:message key="lastname"/>" type="text" name="lastname" required="required"/>
        <input placeholder="<fmt:message key="username"/>" type="text" name="username" required="required"/>
        <div class="gender">
            <input id="female" name="gender" type="radio" required="required" checked="checked" value="Nữ"/>
            <label for="female"><fmt:message key="gender_female"/></label>
            <input id="male" name="gender" type="radio" value="Nam"/>
            <label for="male"><fmt:message key="gender_male"/></label>
        </div>
        <input placeholder="<fmt:message key="phone_number"/>" type="text" name="phone_num" required="required"/>
        <input placeholder="<fmt:message key="email"/>" type="email" name="email" required="required"/>
        <input placeholder="<fmt:message key="date_of_birth"/>" type="date" name="date_of_birth" required="required"/>
        <input placeholder="<fmt:message key="address"/>" type="text" name="address" required="required"/>
        <input placeholder="<fmt:message key="password"/>" type="password" name="password" required="required"/>

        <input type="submit" id="register_btn" value="<fmt:message key="register_button"/>">
    </form>
    <a class="back-link" href="#"><i class="fas fa-arrow-left"></i><fmt:message key="back_home"/></a>

    <%-- Hiển thị thông báo lỗi nếu có --%>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
</div>

<!-- Footer -->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer -->
</body>
</html>
