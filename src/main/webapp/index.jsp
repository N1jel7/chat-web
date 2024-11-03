<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" type="text/css">
    <title>Чат с переключателем тем</title>
</head>
<body class="light">
<c:if test="${sessionScope.user == null}">
    <c:redirect url="pages/login.jsp" />
</c:if>

<c:if test="${sessionScope.user != null}">
    <c:redirect url="/chat" />
</c:if>

</body>
</html>