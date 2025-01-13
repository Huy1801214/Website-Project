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
    <title><fmt:message key="reset_pass_title"/></title>
    <link rel="stylesheet" href="../css/reset_pass.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
<!-- Header-->
<div><c:import url="../viewshare/Header.jsp"/></div>
<!-- End Header-->

<!-- Body -->
<h2><fmt:message key="reset_pass_header"/></h2>
<div class="reset-form">
    <form action="${pageContext.request.contextPath}/ResetPass" method="post">
        <c:if test="${not empty error}">
            <p style=" color: red">${error}</p>
        </c:if>
        <input type="password" placeholder="<fmt:message key="new_password_placeholder"/>" name="password" required="required">
        <input type="password" placeholder="<fmt:message key="confirm_new_password_placeholder"/>" name="confirmPassword" required="required">
        <button><fmt:message key="change_password_btn"/></button>
    </form>
</div>

<!-- end body -->

<!--Footer-->
<div><c:import url="../viewshare/Footer.jsp"/></div>
<!-- End Footer-->
</body>
</html>