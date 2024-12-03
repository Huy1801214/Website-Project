<%--
  Created by IntelliJ IDEA.
  User: mypc
  Date: 12/3/2024
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/css/banner_admin.css">
    <title>Banner</title>
</head>
<body>
<!-- Header -->
<c:import url="../viewshare/Header_admin.jsp"></c:import>
<!-- End Header -->

<!-- Body -->
<div class="container">
    <div class="title-banner">QUẢN LÝ BANNER</div>
    <div class="table-container">
        <h2>Danh sách Banner</h2>
        <form action="">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Hình ảnh</th>
                    <th>Hành động</th>
                    <th>Ngày tạo</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td></td>
                    <td>
                        <img alt="Banner 1" height="50"
                             src="https://storage.googleapis.com/a1aa/image/8xuvXSKfaDUmPyfTpdHBr16ltymWXfhhK290qrePKz9cQNcPB.jpg"
                             width="100"/>
                    </td>
                    <td>
                        <a class="btn" href="#">
                            <i class="fas fa-edit">
                            </i>
                            Sửa
                        </a>
                        <a class="btn" href="#">
                            <i class="fas fa-trash">
                            </i>
                            Xóa
                        </a>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </form>
        <a class="btn-add" href="#">
            <i class="fas fa-plus">
            </i>
            Thêm Banner Mới
        </a>
    </div>
</div>
<!-- End Body -->
<!-- Footer -->
<c:import url="../viewshare/Footer.jsp"></c:import>
</body>
</html>
