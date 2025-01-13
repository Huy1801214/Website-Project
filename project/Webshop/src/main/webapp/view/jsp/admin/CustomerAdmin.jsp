<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 1/12/2025
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/products_admin.css">
    <title><fmt:message key="customer_management_title"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
        .btn-custom-dark {
            background-color: black;
            color: white;
            border: black;
        }

        .btn-custom-dark:hover {
            background-color: #333333;
        }

        .btn-custom-gray {
            background-color: #e9ecef;
            border: #e9ecef;
            color: #555;
        }

        .btn-custom-gray:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" scope="session"/>
<c:import url="../../viewshare/Header_admin.jsp"/>
<h2><fmt:message key="customer_management_header"/></h2>
<div class="search-add-container">
    <form action="#" class="search-form">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="<fmt:message key="customer_id_placeholder"/>" name="search">
            <button class="btn btn-primary" type="button"><fmt:message key="search_button"/></button>
        </div>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th><fmt:message key="customer_id"/></th>
        <th><fmt:message key="customer_name"/></th>
        <th><fmt:message key="email"/></th>
        <th><fmt:message key="phone_number"/></th>
        <th><fmt:message key="address"/></th>
        <th><fmt:message key="action"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.id_user}</td>
            <td>${customer.username}</td>
            <td>${customer.email}</td>
            <td>${customer.phone_num}</td>
            <td>${customer.address}</td>
            <td>
                <a href="<c:url value="/ShowDetailCus">
                    <c:param name="id_user" value="${customer.id_user}"/></c:url>"
                   class="btn btn-primary btn-edit btn-custom-dark"><fmt:message key="view_detail"/></a>
                <a href="<c:url value="/DeleteCustomerAdmin">
                    <c:param name="id_user" value="${customer.id_user}"/></c:url>"
                   class="btn btn-danger btn-delete btn-custom-gray"><fmt:message key="delete"/></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="../../js/products_admin.js"></script>
<!-- Footer -->
<c:import url="../../viewshare/Footer.jsp"/>
</body>
</html>
