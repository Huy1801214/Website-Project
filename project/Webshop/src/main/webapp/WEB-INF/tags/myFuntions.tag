<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- Hàm để lấy giá trị user --%>
<c:choose>
    <c:when test="${not empty param}">
        <%-- Giả sử 'user' có getter cho thuộc tính có tên giống param,
            Ví dụ: nếu param là "username", gọi user.getUsername() --%>
        <c:set var="value" value="${sessionScope.user[param]}" />
        <c:if test="${not empty value}">
            <c:out value="${fn:escapeXml(value)}"/>
        </c:if>
    </c:when>
    <c:when test="${not empty sessionScope.user}">
        <%-- Trường hợp này nếu sessionScope.user có value
        Cần logic lấy param từ user bằng java
        Bạn có thể thay thế bằng giá trị cố định hoặc hàm Java
        --%>

        <c:set var="value" value="${sessionScope.user}" />
        <c:out value="${fn:escapeXml(value)}" />
    </c:when>
    <c:otherwise>
        <%-- Xử lý khi không có user hoặc param --%>

    </c:otherwise>
</c:choose>