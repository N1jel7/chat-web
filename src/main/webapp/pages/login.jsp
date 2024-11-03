<%--
  Created by IntelliJ IDEA.
  User: vanoj
  Date: 10/30/2024
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" type="text/css">
    <title>Страница входа</title>
</head>
<body class="light">
<button class="theme-toggle" onclick="toggleTheme()">Тёмная тема</button>

<div class="login-container">
    <h2>Вход в чат</h2>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <input name="user" type="text" class="login-input" placeholder="Введите логин" required>
        <button class="login-button">Войти</button>
    </form>
</div>

</body>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</html>

